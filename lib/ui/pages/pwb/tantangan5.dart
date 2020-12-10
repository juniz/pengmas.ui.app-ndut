part of '../pages.dart';

class Tantangan5Page extends StatefulWidget {
  @override
  _Tantangan5PageState createState() => _Tantangan5PageState();
}

class _Tantangan5PageState extends State<Tantangan5Page> {
  TextEditingController jwb1 = TextEditingController();
  TextEditingController jwb2 = TextEditingController();
  TextEditingController jwb3 = TextEditingController();
  TextEditingController jwb4 = TextEditingController();
  TextEditingController jwb5 = TextEditingController();
  TextEditingController jwb6 = TextEditingController();
  TextEditingController jwb7 = TextEditingController();
  TextEditingController jwb8 = TextEditingController();
  TextEditingController jwb9 = TextEditingController();
  TextEditingController jwb10 = TextEditingController();

  int idTugas;
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
      idTugas = prefs.getInt('idTugas');
      idUser = prefs.getInt("id");
      nama = prefs.getString('nama');
    });
  }

  void postKebahagiaan() async {
    String j1 = jwb1.text;
    String j2 = jwb2.text;
    String j3 = jwb2.text;
    String j4 = jwb2.text;
    String j5 = jwb2.text;
    String j6 = jwb2.text;
    String j7 = jwb2.text;
    String j8 = jwb2.text;
    String j9 = jwb2.text;
    String j10 = jwb2.text;

    var jawaban =
        "Kelebihan : 1.$j1,2.$j2,3.$j3,4.$j4,5.$j5   Kekurangan : 1.$j6,2.$j7,3.$j8,4.$j9,5.$j10";

    var url =
        'https://timkecilproject.com/pengmas/public/api/jawaban_kebahagiaans';
    var data = {
      "id_tugas": idTugas.toString(),
      "id_pengguna": idUser.toString(),
      "jawaban": jawaban
    };
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      context.bloc<PageBloc>().add(GoToRateOnlyPage());
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
                    child: Text('Isikan 5 Kelebihan Anda',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, defaultMargin, 0, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '1.',
                                ),
                                controller: jwb1,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb1.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, defaultMargin, 0, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '2.',
                                ),
                                controller: jwb2,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb2.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, defaultMargin, 0, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '3.',
                                ),
                                controller: jwb3,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb3.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, defaultMargin, 0, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '4.',
                                ),
                                controller: jwb4,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb4.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, defaultMargin, 0, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '5.',
                                ),
                                controller: jwb5,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb5.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
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
                    child: Text('Isikan 5 Kekurangan Anda',
                        textAlign: TextAlign.center,
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  )),
              SizedBox(height: 35),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  00, defaultMargin, 0, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '1.',
                                ),
                                controller: jwb6,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb6.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, defaultMargin, 0, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '2.',
                                ),
                                controller: jwb7,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb7.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, defaultMargin, 0, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '3.',
                                ),
                                controller: jwb8,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb8.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, defaultMargin, 0, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '4..',
                                ),
                                controller: jwb9,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb9.text,
                                  style: kTitleTextStyle,
                                )),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                child: Align(
                  child: Material(
                    color: Color(0xFFE4E4E4),
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Color(0x802196F3),
                    child: Container(
                      height: 50,
                      width: (MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          24),
                      child: ListView(children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0, defaultMargin, 0, defaultMargin),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '5.',
                                ),
                                controller: jwb10,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(30),
                                child: Text(
                                  jwb10.text,
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
                  },
                ),
              ),
            ],
          ),
        ]),
      ])),
    );
  }
}
