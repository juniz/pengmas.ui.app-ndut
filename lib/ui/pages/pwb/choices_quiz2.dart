part of '../pages.dart';

class ChoicesQuiz2 extends StatefulWidget {
  Category category;

  @override
  _ChoicesQuiz2State createState() => _ChoicesQuiz2State();
}

class _ChoicesQuiz2State extends State<ChoicesQuiz2> {
  List<String> _hasilCheck = [];
  String _selectedValue;

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
    String chk = _hasilCheck.toString();
    String jwb = 'Kuadran III : $chk';
    var url =
        'https://timkecilproject.com/pengmas/public/api/jawaban_kebahagiaans';
    var data = {
      "id_tugas": idTugas.toString(),
      "id_pengguna": idUser.toString(),
      "jawaban": jwb
    };
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      context.bloc<PageBloc>().add(GoToChoices3Page());
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

  final List<SimpleModel> _items = <SimpleModel>[
    SimpleModel('9. Menjawab telepon dari nomor yang tidak dikenal.', false),
    SimpleModel('10. Menyediakan kue untuk arisan/acara keluarga.', false),
    SimpleModel('11. Belanja kudapan untuk keluarga.', false),
    SimpleModel('12. Beri contoh lain..', false),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToChoices1Page());
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
                        context.bloc<PageBloc>().add(GoToChoices1Page());
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Pilih 3 pilihan dari 12 pilihan',
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
                Text("Kuadran III"),
                Text(
                    "Sangat penting dan sangat mendesak(lakukan segera sendiri)"),
                SizedBox(height: 25),
                _buildRadioButton(),
                SizedBox(height: 50),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Container(
                  height: 45,
                  width: 250,
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  child: RaisedButton(
                      elevation: 0,
                      color: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        "Lanjut",
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                      onPressed: () {
                        postKebahagiaan();
                      }),
                )),
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
      children: _items
          .map(
            (SimpleModel item) => CheckboxListTile(
                title: Text(item.title),
                value: item.isChecked,
                onChanged: (bool val) {
                  setState(() {
                    item.isChecked = val;
                    if (item.isChecked == true) {
                      _hasilCheck.add(item.title);
                    } else {
                      _hasilCheck.remove(item.title);
                    }
                  });
                }),
          )
          .toList(),
    );
  }
}

class RadioGroup2 {
  final int index1;
  final String text1;
  RadioGroup2({this.index1, this.text1});
}
