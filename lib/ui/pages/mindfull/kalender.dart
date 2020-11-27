part of '../pages.dart';

class KalenderPageOne extends StatefulWidget {
  @override
  _KalenderPageOneState createState() => _KalenderPageOneState();
}

class _KalenderPageOneState extends State<KalenderPageOne> {
  String _date = "Silahkan Pilih Tanggal";
  String _jam = '';
  bool viewVisible1 = true;
  bool viewVisible2 = true;
  bool viewVisible3 = true;
  bool viewVisible4 = true;
  bool viewVisible5 = true;
  bool viewVisible6 = true;
  //SharedPreferences prefs;

  TextEditingController kapan = TextEditingController();
  TextEditingController bagaimana = TextEditingController();
  TextEditingController fisik = TextEditingController();
  TextEditingController pikiran = TextEditingController();
  TextEditingController perasaan = TextEditingController();
  TextEditingController tindakan = TextEditingController();

  String namaTugas;
  bool isDone = false;

  tugas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      namaTugas = prefs.getString("namaTugas");
      isDone = prefs.getBool(namaTugas + 'isDone');
    });
  }

  void initState() {
    super.initState();
    tugas();
  }

  void save() async {
    String jawaban1 = '$_date';
    String jawaban2 = bagaimana.text;
    String jawaban3 = fisik.text;
    String jawaban4 = pikiran.text;
    String jawaban5 = perasaan.text;
    String jawaban6 = tindakan.text;
    if (isDone == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Tugas Sudah Dikerjakan"),
            //content: Text("Tugas Sudah Dikerjakan"),
          );
        },
        barrierDismissible: true,
      );
      context.bloc<PageBloc>().add(GoToSuccessPage());
    } else if (jawaban1 == 'Silahkan Pilih Tanggal' ||
        jawaban2 == '' ||
        jawaban3 == '' ||
        jawaban4 == '' ||
        jawaban5 == '' ||
        jawaban6 == '') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Form Tidak Boleh Ada yang Kosong"),

            //content: Text("Form Tidak Boleh Kosong"),
          );
        },
        barrierDismissible: true,
      );
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('kapan', jawaban1);
      prefs.setString('jam', _jam);
      prefs.setString('bagaimana', jawaban2);
      prefs.setString('fisik', jawaban3);
      prefs.setString('pikiran', jawaban4);
      prefs.setString('perasaan', jawaban5);
      prefs.setString('tindakan', jawaban6);
      context.bloc<PageBloc>().add(GoToKesimpulanPageOne());
    }
  }

  void showWidget1() {
    setState(() {
      viewVisible1 = true;
    });
  }

  void showWidget2() {
    setState(() {
      viewVisible2 = true;
    });
  }

  void showWidget3() {
    setState(() {
      viewVisible3 = true;
    });
  }

  void showWidget4() {
    setState(() {
      viewVisible4 = true;
    });
  }

  void showWidget5() {
    setState(() {
      viewVisible5 = true;
    });
  }

  void showWidget6() {
    setState(() {
      viewVisible6 = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToTaskMindfullPage());

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
          Column(children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 10),
              height: 50,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        context.bloc<PageBloc>().add(GoToTaskMindfullPage());
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Latihan:\nKalender Stress',
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Kapan ?'),
                onPressed: showWidget1,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              // RaisedButton(
              //   child: Text('Show Widget on Button Click'),
              //   onPressed: showWidget,
              //   color: Colors.pink,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible1,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text('Kapan situasi itu terjadi?',
                              textAlign: TextAlign.justify,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          SizedBox(height: 10),
          Container(
            child: Align(
              child: Material(
                color: accentColor4,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Color(0x802196F3),
                child: Container(
                  height: 50,
                  width: (MediaQuery.of(context).size.width -
                      2 * defaultMargin -
                      24),
                  child: ListView(children: <Widget>[
                    Column(
                      children: <Widget>[
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          elevation: 4.0,
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                theme: DatePickerTheme(
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true,
                                minTime: DateTime(2000, 1, 1),
                                maxTime: DateTime(2022, 12, 31),
                                onConfirm: (date) {
                              print('confirm $date');

                              setState(() {
                                _date =
                                    '${date.year} - ${date.month} - ${date.day}';
                                _jam = '${date.hour}';
                                print(_jam);
                              });
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.id);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.date_range,
                                            size: 18.0,
                                            color: accentColor1,
                                          ),
                                          Text(
                                            " $_date",
                                            style: TextStyle(
                                                color: Colors.indigoAccent,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "Ganti",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        /*Padding(
                          padding: const EdgeInsets.fromLTRB(
                              10, defaultMargin, 10, defaultMargin),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Widget Calendar',
                            ),
                            controller: kapan,
                            maxLength: 200,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(30),
                            child: Text(
                              kapan.text,
                              style: kTitleTextStyle,
                            )),*/
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Bagaimana ?'),
                onPressed: showWidget2,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              // RaisedButton(
              //   child: Text('Show Widget on Button Click'),
              //   onPressed: showWidget,
              //   color: Colors.pink,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible2,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text('Ceritakan bagaimana kejadiannya !',
                              textAlign: TextAlign.justify,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          SizedBox(height: 10),
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
                            ),
                            controller: bagaimana,
                            //maxLength: 200,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Kondisi Fisik'),
                onPressed: showWidget3,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              // RaisedButton(
              //   child: Text('Show Widget on Button Click'),
              //   onPressed: showWidget,
              //   color: Colors.pink,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible3,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text(
                              'Apa yang terjadi pada tubuh Anda? Ceritakan dengan rinci! ',
                              textAlign: TextAlign.justify,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          SizedBox(height: 10),
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
                            ),
                            controller: fisik,
                            //maxLength: 200,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Pikiran'),
                onPressed: showWidget4,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              // RaisedButton(
              //   child: Text('Show Widget on Button Click'),
              //   onPressed: showWidget,
              //   color: Colors.pink,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible4,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text(
                              'Apa pikiran yang pertama kali muncul ketika Anda mengalami situasi ini?',
                              textAlign: TextAlign.justify,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          SizedBox(height: 10),
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
                            ),
                            controller: pikiran,
                            //maxLength: 200,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Perasaan'),
                onPressed: showWidget5,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              // RaisedButton(
              //   child: Text('Show Widget on Button Click'),
              //   onPressed: showWidget,
              //   color: Colors.pink,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible5,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text(
                              'Apa yang Anda rasakan ketika mengalami situasi ini?',
                              textAlign: TextAlign.justify,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          SizedBox(height: 10),
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
                            ),
                            controller: perasaan,
                            //maxLength: 200,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Kecenderungan Tindakan'),
                onPressed: showWidget6,
                color: accentColor4,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              // RaisedButton(
              //   child: Text('Show Widget on Button Click'),
              //   onPressed: showWidget,
              //   color: Colors.pink,
              //   textColor: Colors.white,
              //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              // ),
              Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible6,
                  child: Container(
                      // height: 200,
                      // width: 200,
                      // color: Colors.green,
                      margin: EdgeInsets.fromLTRB(30, 25, 30, 25),
                      child: Center(
                          child: Text(
                              'Berdasarkan pengalaman Anda sebelumnya, apa yang akan Anda lakukan ketika mengalami situasi seperti ini?',
                              textAlign: TextAlign.justify,
                              style: blackTextFont.copyWith(fontSize: 20))))),
            ],
          ),
          SizedBox(height: 10),
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
                            ),
                            controller: tindakan,
                            //maxLength: 200,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
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
            margin: EdgeInsets.only(left: 50, right: 50),
            child: RaisedButton(
              child: Text('Lanjut',
                  style: whiteTextFont.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w400)),
              color: mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                //String jawaban = controller.text;
                save();
              },
            ),
          ),
          SizedBox(height: 50),
        ])
      ])),
    );
  }
}
