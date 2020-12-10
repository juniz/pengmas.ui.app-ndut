part of '../pages.dart';

class InputTujuanPage extends StatefulWidget {
  @override
  _InputTujuanPageState createState() => _InputTujuanPageState();
}

class _InputTujuanPageState extends State<InputTujuanPage> {
  TextEditingController harmonis = TextEditingController();
  TextEditingController pekerjaan = TextEditingController();
  TextEditingController spiritualitas = TextEditingController();
  TextEditingController finansial = TextEditingController();
  TextEditingController kesehatan = TextEditingController();
  bool visible = false;
  String nmtgs6 = '';

  void setTgs6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nmtgs6 = prefs.getString("Tgs6");
    });
  }


  @override
  void initState() { 
    super.initState();
    
  }

  void postKebahagiaan() async {
    setState(() {
      visible = true;
    });
    String j1 = harmonis.text;
    String j2 = pekerjaan.text;
    String j3 = spiritualitas.text;
    String j4 = finansial.text;
    String j5 = kesehatan.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var idTugas = prefs.getInt('idTugas');
    var idUser = prefs.getInt("id");
    var tgs6 = prefs.getString("Tgs6");
    var jawaban =
        "$tgs6  -->  Keharmonisan Keluarga : $j1    Pekerjaan : $j2    Spiritualitas : $j3    Finansial : $j4    Kesehatan : $j5";
    if (j1 == '' || j2 == '' || j3 == '' || j4 == '' || j5 == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Error"),
            content: Text("Form Tidak Boleh Kosong"),
          );
        },
        barrierDismissible: true,
      );
      setState(() {
        visible = false;
      });
    } else {
      var url =
          'https://timkecilproject.com/pengmas/public/api/jawaban_kebahagiaans';
      var data = {
        "id_tugas": idTugas.toString(),
        "id_pengguna": idUser.toString(),
        "jawaban": jawaban
      };
      var response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        setDone(namaTugas);
        setState(() {
          visible = false;
        });
        context.bloc<PageBloc>().add(GoToInti6Page());
      } else {
        setState(() {
          visible = false;
        });
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
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToTugas6Page());

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
              SizedBox(height: 50),
              Center(
                child: Text(
                  'Rancangan hidup anda pada \n $tgs6',
                  textAlign: TextAlign.center,
                  style: purpleTextFont.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(height: 0),
              Container(
                  height: 50,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(nmtgs6,
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              Container(
                  height: 50,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Keharmonisan Keluarga :',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 0),
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
                                controller: harmonis,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  harmonis.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Container(
                  height: 50,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Pekerjaan :',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 0),
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
                                controller: pekerjaan,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  pekerjaan.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Container(
                  height: 50,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Spiritualitas : ',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 0),
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
                                controller: spiritualitas,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  spiritualitas.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Container(
                  height: 50,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Kesehatan :',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 0),
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
                                controller: kesehatan,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  kesehatan.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0),
              Container(
                  height: 50,
                  width: 250,
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 25, defaultMargin, 25),
                  decoration: BoxDecoration(
                    color: accentColor1,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Finansial :',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 0),
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
                                controller: finansial,
                                //maxLength: 200,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  finansial.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Visibility(
                visible: visible,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              SizedBox(height: 20),
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
                    //context.bloc<PageBloc>().add(GoToStudyChoicePart2Page());
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
