part of '../pages.dart';

class SuccessPWB2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300,
          height: 300,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/newpack/2 SCENE.png"))),
        ),
        Align(
          child: Text(
            "SELAMAT!!",
            textAlign: TextAlign.center,
            style: blackTextFont.copyWith(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 10, left: defaultMargin, right: defaultMargin),
          child: Text(
              "Anda menyelesaikan tantangan ini./nTetap semangat terus ya!",
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
                "Menu Utama",
                style: whiteTextFont.copyWith(fontSize: 16),
              ),
              onPressed: () {
                context.bloc<PageBloc>().add(GoToMainPage());
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
