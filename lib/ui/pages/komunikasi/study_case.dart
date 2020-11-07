part of '../pages.dart';

class StudyCase extends StatefulWidget {
  @override
  _StudyCaseState createState() => _StudyCaseState();
}

class _StudyCaseState extends State<StudyCase> {
  String id = '';
  String nama;
  String jawaban;
  List<bool> _checked = [];
  @override
  void initState() {
    super.initState();
    getId();
  }

  void getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString('idTugas');
      nama = prefs.getString('nama');
    });
  }

  getPilihan(param) async {
    //print(param);
    var response = await http.get(
        "http://timkecilproject.com/pengmas/public/api/pilihan_komunikasis?id_kasus=$param");
    var body = jsonDecode(response.body);
    //var data = body["data"];
    return body;
  }

  getKasus() async {
    var response = await http.get(
        "http://timkecilproject.com/pengmas/public/api/kasus_komunikasis?id_tugas=$id");
    var body = jsonDecode(response.body);
    var data = body["data"];
    return body;
  }

  void postPilihan() async {
    var url =
        'http://timkecilproject.com/pengmas/public/api/jawaban_komunikasis';
    var data = {
      "id_tugas": id,
      "perasaan": nama,
      "jawaban": jawaban,
    };
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      context.bloc<PageBloc>().add(GoToKomunikasiPage());
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Error saat mengirim jawaban"),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(color: accentColor4),
      SafeArea(
          child: Container(
        color: Color(0xFFF6F7F9),
      )),
      ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 70,
              width: 200,
              margin: EdgeInsets.only(left: 20, right: 20, top: defaultMargin),
              child: RaisedButton(
                child: Text('Misi Pertama !',
                    style: whiteTextFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w400)),
                color: accentColor2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  // context.bloc<PageBloc>().add(GoToSuksesPage());
                },
              ),
            ),
            SizedBox(height: 25),
            FutureBuilder(
                future: getKasus(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var kasus = snapshot.data["data"];
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: kasus.length,
                      itemBuilder: (context, index) {
                        //print(kasus[index]["kasus"]);
                        return Column(
                          children: [
                            Container(
                              height: 200,
                              width: (MediaQuery.of(context).size.width -
                                  2 * defaultMargin -
                                  24),
                              margin: EdgeInsets.fromLTRB(
                                  defaultMargin, 25, defaultMargin, 25),
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(defaultMargin),
                                child: SingleChildScrollView(
                                  child: Text(
                                      //'Pada suatu hari, Ibu Tuti secara tidak sengaja melihat anaknya sedang duduk lesu sambil menunjukkan ekspresi sedih di mukanya setelah pembelajaran jarak jauh telah selesai. Anak Ibu melihat ke arah Ibu kemudian menghampiri sambil menangis. Anak Ibu Tuti bercerita panjang lebar kalau ia tidak memahami pelajaran yang diberikan oleh guru dan ketika hendak bertanya kepada guru, koneksinya buruk hingga akhir pembelajaran. Ia bercerita sambil sesenggukan menangis. ',
                                      kasus[index]["kasus"],
                                      textAlign: TextAlign.justify,
                                      style: whiteTextFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ),
                            ),
                            FutureBuilder(
                              future: getPilihan(kasus[index]["id"]),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var pilihan = snapshot.data["data"];
                                  //print(pilihan);
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: pilihan.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      _checked.add(false);
                                      return CheckboxListTile(
                                          title:
                                              Text(pilihan[index]["pilihan"]),
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (bool value) {
                                            setState(() {
                                              if (_checked[index] == false) {
                                                _checked[index] = true;
                                                jawaban =
                                                    pilihan[index]["pilihan"];
                                              } else {
                                                _checked[index] = false;
                                              }
                                            });
                                          },
                                          value: _checked[index]);
                                    },
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ],
                        );
                        // ignore: dead_code
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
            SizedBox(height: 35),
            Align(
              alignment: Alignment.topCenter,
              child: FloatingActionButton(
                  elevation: 20,
                  backgroundColor: mainColor,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    //context.bloc<PageBloc>().add(GoToKomunikasiPage());
                    postPilihan();
                  }),
            ),
            SizedBox(height: 100),
          ],
        ),
      ]),
    ]));
  }
}
