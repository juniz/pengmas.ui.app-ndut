part of '../pages.dart';

// ignore: must_be_immutable
class PenjelasanTantangan4Page extends StatelessWidget {
  Category category;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          context.bloc<PageBloc>().add(GoToDetailTugasPwb());

          return;
        },
        child: Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /*Container(
          width: 300,
          height: 300,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/newpack/2 SCENE.png"))),
        ),*/
            Align(
              child: Text(
                "Penjelasan Tantangan",
                textAlign: TextAlign.center,
                style: blackTextFont.copyWith(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: defaultMargin, right: defaultMargin),
              child: Text(
                  " Pada tantangan kali ini, kita akan mencoba memberi apresiasi pada orangtua/saudara/orang terdekat kita.  ",
                  textAlign: TextAlign.center,
                  style: blackTextFont.copyWith(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: defaultMargin, right: defaultMargin),
              child: Text(" Caranya :",
                  textAlign: TextAlign.justify,
                  style: blackTextFont.copyWith(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: defaultMargin, right: defaultMargin),
              child: Text(
                  "1. Telepon orangtua/saudara/orang terdekat kita, tanyakan kabar mereka. ",
                  textAlign: TextAlign.center,
                  style: blackTextFont.copyWith(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: defaultMargin, right: defaultMargin),
              child: Text(
                  "2. Berikan apresiasi pada orangtua/saudara/orang terdekat kita atas kebaikannya. ",
                  textAlign: TextAlign.center,
                  style: blackTextFont.copyWith(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: defaultMargin, right: defaultMargin),
              child: Text(
                  "3. Ungkapkan rasa sayang/kepedulian anda pada orang tersebut. ",
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
                    "Lanjut",
                    style: whiteTextFont.copyWith(fontSize: 16),
                  ),
                  onPressed: () {
                    //context.bloc<PageBloc>().add(GoToInti4Page());
                    context.bloc<PageBloc>().add(GoToQuestChoicesPage());
                  }),
            ),
          ],
        )));
  }
}
