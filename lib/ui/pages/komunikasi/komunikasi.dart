part of '../pages.dart';

class KomunikasiPage extends StatefulWidget {
  @override
  _KomunikasiPageState createState() => _KomunikasiPageState();
}

class _KomunikasiPageState extends State<KomunikasiPage> {
  TextEditingController controller = TextEditingController();

  String idTugas = '';
  int idUser;
  String nama;
  @override
  void initState() {
    super.initState();
    getId();
  }

  void getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idTugas = prefs.getString('idTugas');
      idUser = prefs.getInt("id");
      nama = prefs.getString('nama');
    });
  }

  getTugas() async {
    print(idTugas);
    var response = await http.get(
        "http://timkecilproject.com/pengmas/public/api/tugas_komunikasis/$idTugas");
    var body = jsonDecode(response.body);

    return body;
  }

  void postKomunikasi() async {
    String jawaban = controller.text;
    var url =
        'http://timkecilproject.com/pengmas/public/api/jawaban_komunikasis';
    var data = {
      "id_tugas": idTugas,
      "id_pengguna": idUser.toString(),
      "jawaban": jawaban,
      "perasaan": nama
    };
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      context.bloc<PageBloc>().add(GoToSuksesPage());
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
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToNoteHomePage());

        return;
      },
      child: Scaffold(
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
                height: 100,
                width: 280,
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                decoration: BoxDecoration(
                  color: accentColor1,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: FutureBuilder(
                  future: getTugas(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var tugas = snapshot.data["data"];
                      print(tugas["tantangan"]);
                      return Padding(
                        padding: EdgeInsets.all(15),
                        child: SingleChildScrollView(
                          child: Text(tugas["tantangan"],
                              textAlign: TextAlign.justify,
                              style: whiteTextFont.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                        ),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 300,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10, defaultMargin, 10, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Tulis jawabannya disini...',
                                ),
                                controller: controller,
                                maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  controller.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35),
              Container(
                height: 50,
                width: 150,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: RaisedButton(
                  child: Text('Lanjut',
                      style: whiteTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w400)),
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {
                    postKomunikasi();
                  },
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ]),
      ])),
    );
  }
}
