part of '../pages.dart';

class ChoicesQuiz3Kom extends StatefulWidget {
  @override
  _ChoicesQuiz3KomState createState() => _ChoicesQuiz3KomState();
}

class _ChoicesQuiz3KomState extends State<ChoicesQuiz3Kom> {
  int _rgProgramming = -1;
  String _selectedValue;
  int id;
  String nama;
  String namaTugas;
  String jawaban;

  @override
  void initState() {
    super.initState();
    getId();
  }

  void getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getInt('idTugas');
      nama = prefs.getString('nama');
      namaTugas = prefs.getString('namaTugas');
    });
  }

  void postPilihan() async {
    String temp =
        "Anak laki-laki Bu Susi sedang bermain di luar bersama anak tetangga, kemudian selang beberapa menit, terdengar ada suara tangisan dan ternyata anak laki-laki bu Susi bertengkar dengan anak tetangga tersebut. Baik Bu Susi maupun orang tua dari anak tetangga berhasil melerai dan memisahkan mereka berdua. Bu Susi mengajak anaknya untuk berdiskusi tentang apa yang terjadi, dan mendengarkan cerita si anak sampai selesai.";
    jawaban = "Pertanyaan  :  $temp       Jawaban  :  $_selectedValue";
    var url =
        'https://timkecilproject.com/pengmas/public/api/jawaban_komunikasis';

    var data = {
      "id_tugas": id.toString(),
      "perasaan": nama,
      "jawaban": jawaban,
    };
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      setDone(namaTugas);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return SuksesPage();
        },
      ));
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

  final List<RadioGroup2Kom> _programmingList = [
    RadioGroup2Kom(index: 1, text: "BENAR"),
    RadioGroup2Kom(index: 2, text: "SALAH"),
    // RadioGroup(
    //     index: 3,
    //     text: "3. Menyiapkan materi ujian/tugas yang harus dikumpulkan besok"),
    // RadioGroup(index: 4, text: "4. Beri contoh lain.."),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ChoicesQuiz2Kom();
          },
        ));
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
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ChoicesQuiz2Kom();
                          },
                        ));
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Study Kasus:\nKetiga',
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          Container(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    "Anak laki-laki Bu Susi sedang bermain di luar bersama anak tetangga, kemudian selang beberapa menit, terdengar ada suara tangisan dan ternyata anak laki-laki bu Susi bertengkar dengan anak tetangga tersebut. ",
                    style: blackTextFont,
                    textAlign: TextAlign.justify),
                SizedBox(height: 10),
                Text(
                    "Baik Bu Susi maupun orang tua dari anak tetangga berhasil melerai dan memisahkan mereka berdua. Bu Susi mengajak anaknya untuk berdiskusi tentang apa yang terjadi, dan mendengarkan cerita si anak sampai selesai.",
                    style: blackTextFont,
                    textAlign: TextAlign.justify),
                SizedBox(height: 25),
                _buildRadioButton(),
                SizedBox(height: 50),
                Text("Jawaban kamu :"),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    _selectedValue == null ? "Belum memilih" : _selectedValue,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 45),
                Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.only(left: 80, right: 20),
                  child: RaisedButton(
                    child: Text('Lanjut',
                        style: whiteTextFont.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) {
                      //     return TicketPrintPage();
                      //   },
                      // ));
                      postPilihan();
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ])),
    );
  }

  // widget radio
  Widget _buildRadioButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _programmingList
          .map((programming) => RadioListTile(
                title: Text(programming.text),
                value: programming.index,
                groupValue: _rgProgramming,
                controlAffinity: ListTileControlAffinity.trailing,
                dense: true,
                onChanged: (value) {
                  setState(() {
                    _rgProgramming = value;
                    _selectedValue = programming.text;
                  });
                },
              ))
          .toList(),
    );
  }
}

class RadioGroup3Kom {
  final int index;
  final String text;
  RadioGroup3Kom({this.index, this.text});
}
