part of '../pages.dart';

// ignore: must_be_immutable
class Inti2Page extends StatelessWidget {
  Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Align(
          child: Text(
            "Apa sih Inti Dari Tantangan ini?",
            textAlign: TextAlign.center,
            style: blackTextFont.copyWith(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 10, left: defaultMargin, right: defaultMargin),
          child: Text(
              "Pada tantangan ini tidak ada jawaban benar dan salah. Hal penting yang ingin disampaikan adalah untuk menjadi bahagia kita perlu mengambil keputusan-keputusan secara mandiri. Mempertimbangkan saran orang lain boleh saja, asalkan saran tersebut sesuai dengan keadaan kita. ",
              textAlign: TextAlign.center,
              style: blackTextFont.copyWith(fontSize: 16)),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 45,
          width: 250,
          margin: EdgeInsets.only(top: 30, bottom: 20),
          child: RaisedButton(
              elevation: 0,
              color: mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                "Menu Awal",
                style: whiteTextFont.copyWith(fontSize: 16),
              ),
              onPressed: () {
                context.bloc<PageBloc>().add(GoToSukses2Page());
              }),
        ),
        /*Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Lanjut Nugas? ",
              style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
            ),
            GestureDetector(
              onTap: () {
                context.bloc<PageBloc>().add(GoToMainPage());
              },
              child: Text(
                "Kembali ke Beranda",
                style: purpleTextFont,
              ),
            )
          ],
        ),*/
      ],
    ));
  }
}
