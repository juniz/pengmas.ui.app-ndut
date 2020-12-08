part of '../pages.dart';

class RateOnlyPage extends StatefulWidget {
  Category category;

  @override
  _RateOnlyPageState createState() => _RateOnlyPageState();
}

class _RateOnlyPageState extends State<RateOnlyPage> {
  var myFeedbackText = "SANGAT TIDAK PUAS";
  var sliderValue = 0.0;
  IconData myFeedback = FontAwesomeIcons.sadTear;
  Color myFeedbackColor = mainColor;
  List<String> selectedMood = [];
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
      namaTugas = prefs.getString("namaTugas");
    });
  }

  void postKebahagiaan() async {
    String j1 = controller.text;
    var jawaban = "$sliderValue  $myFeedbackText";

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
      context.bloc<PageBloc>().add(GoToInti5Page());
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
        context.bloc<PageBloc>().add(GoToMainPage());

        return;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          Container(color: accentColor4),
          SafeArea(
              child: Container(
            color: Color(0xFFF6F7F9),
          )),
          ListView(
            children: <Widget>[
              Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20, left: 10),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Setelah melihat kekurangan dan kelebihan anda,\n Seberapa puas anda dengan diri anda?",
                          textAlign: TextAlign.center,
                          style: purpleTextFont.copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Stack(children: <Widget>[
                Container(
                  color: accentColor4,
                ),
                SafeArea(
                    child: Container(
                  color: Color(0xFFF6F7F9),
                )),
                Container(
                  // color: Color(0xFFF6F7F9),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Align(
                          child: Material(
                            color: Colors.white,
                            elevation: 10.0,
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Color(0x802196F3),
                            child: Container(
                                width: 200.0,
                                height: 230.0,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                          child: Text(
                                        myFeedbackText,
                                        style: purpleTextFont.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                          child: Icon(
                                        myFeedback,
                                        color: myFeedbackColor,
                                        size: 60.0,
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Container(
                                        child: Slider(
                                          min: 0.0,
                                          max: 5.0,
                                          divisions: 5,
                                          value: sliderValue,
                                          activeColor: mainColor,
                                          inactiveColor: accentColor3,
                                          onChanged: (newValue) {
                                            setState(() {
                                              sliderValue = newValue;
                                              if (sliderValue >= 0.0 &&
                                                  sliderValue <= 1.0) {
                                                myFeedback =
                                                    FontAwesomeIcons.sadTear;
                                                myFeedbackColor = Colors.red;
                                                myFeedbackText =
                                                    "SANGAT TIDAK PUAS";
                                              }
                                              if (sliderValue >= 1.1 &&
                                                  sliderValue <= 2.0) {
                                                myFeedback =
                                                    FontAwesomeIcons.frown;
                                                myFeedbackColor = Colors.yellow;
                                                myFeedbackText = "TIDAK PUAS";
                                              }
                                              if (sliderValue >= 2.1 &&
                                                  sliderValue <= 3.0) {
                                                myFeedback =
                                                    FontAwesomeIcons.meh;
                                                myFeedbackColor = Colors.amber;
                                                myFeedbackText = "CUKUP PUAS";
                                              }
                                              if (sliderValue >= 3.1 &&
                                                  sliderValue <= 4.0) {
                                                myFeedback =
                                                    FontAwesomeIcons.smile;
                                                myFeedbackColor = mainColor;
                                                myFeedbackText = "PUAS";
                                              }
                                              if (sliderValue >= 4.1 &&
                                                  sliderValue <= 5.0) {
                                                myFeedback =
                                                    FontAwesomeIcons.laugh;
                                                myFeedbackColor = accentColor4;
                                                myFeedbackText = "SANGAT PUAS";
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                          child: Text(
                                        "Rating kamu: $sliderValue",
                                        style: TextStyle(
                                            color: mainColor,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Container(
                                          child: Align(
                                        alignment: Alignment.bottomCenter,
                                        /*child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      30.0)),
                                          color: mainColor,
                                          child: Text(
                                            'Kirim',
                                            style: TextStyle(
                                                color: Color(0xffffffff)),
                                          ),
                                          onPressed: () {},
                                        ),*/
                                      )),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 50,
                        width: 200,
                        // margin: EdgeInsets.only(left: 50, right: 50),
                        child: RaisedButton(
                          child: Text('Lanjut',
                              style: whiteTextFont.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                          color: mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          onPressed: () {
                            postKebahagiaan();
                            //context.bloc<PageBloc>().add(GoToInti1Page());
                          },
                        ),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                )
              ])
            ],
          ),
        ]),
      ),
    );
  }
}
