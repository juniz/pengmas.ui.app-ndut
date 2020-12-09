part of '../pages.dart';

class StudyChoicePart3Page extends StatefulWidget {
  @override
  _StudyChoicePart3PageState createState() => _StudyChoicePart3PageState();
}

class _StudyChoicePart3PageState extends State<StudyChoicePart3Page> {
  TextEditingController controller = TextEditingController();

  int idTugas;
  int idUser;
  String nama;
  String namaTugas;
  @override
  void initState() {
    super.initState();
    getId();
  }

  void getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      idTugas = prefs.getInt('idTugas');
      idUser = prefs.getInt("id");
      nama = prefs.getString('nama');
      namaTugas = prefs.getString('namaTugas');
    });
  }

  void postKebahagiaan() async {
    String j1 = controller.text;

    var url =
        'https://timkecilproject.com/pengmas/public/api/jawaban_kebahagiaans';
    var data = {
      "id_tugas": idTugas.toString(),
      "id_pengguna": idUser.toString(),
      "jawaban": j1
    };
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      setDone(namaTugas);
      context.bloc<PageBloc>().add(GoToStudyRateOnlyPage());
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
        context.bloc<PageBloc>().add(GoToDetailTugasPwb());

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
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'Saya bisa mendapatkan informasi mengenai hal tersebut melalui…',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 100,
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
                                //maxLength: 200,
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
                    postKebahagiaan();
                    //context.bloc<PageBloc>().add(GoToStudyRateOnlyPage());
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
