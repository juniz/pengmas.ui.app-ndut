part of '../pages.dart';

class ByDoing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlayList(),
    );
  }
}

class PlayList extends StatefulWidget {
  PlayList({Key key}) : super(key: key);

  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  String liveVideo = "https://www.youtube.com/watch?v=dsp45WWmVqA";

  YoutubePlayerController _liveController;

  int id;
  String nama;
  String jawaban;

  List<bool> _checked = [];

  void getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getInt('idTugas');
      nama = prefs.getString('nama');
    });
  }

  getKasus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getInt('idTugas');
    var response = await http.get(
        "https://timkecilproject.com/pengmas/public/api/kasus_kebahagiaans?id_tugas=" +
            id.toString());
    var body = jsonDecode(response.body);
    print(body);
    return body;
  }

  @override
  void initState() {
    super.initState();
    getId();
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
            Column(children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20, left: 10),
                height: 50,
                child: Stack(
                  children: <Widget>[
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       context.bloc<PageBloc>().add(GoToTaskPage());
                    //     },
                    //     child: Icon(Icons.arrow_back),
                    //   ),
                    // ),
                    Center(
                      child: Text(
                        'Latihan:\nTenang',
                        textAlign: TextAlign.center,
                        style: blackTextFont.copyWith(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Stack(
              children: <Widget>[
                Container(color: accentColor4),
                SafeArea(
                    child: Container(
                  color: Color(0xFFF6F7F9),
                )),
                Container(
                  child: SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                        child: Text(
                          'Video: Bernafas - Intro',
                          style: blackTextFont.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 20),
                      FutureBuilder(
                        future: getKasus(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            var video = snapshot.data["data"];
                            print(video);
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: video.length,
                                itemBuilder: (context, index) {
                                  _liveController = YoutubePlayerController(
                                    initialVideoId:
                                        YoutubePlayer.convertUrlToId(
                                            video[index]["audio"]),
                                    flags: YoutubePlayerFlags(
                                      autoPlay: false,
                                      isLive: true,
                                    ),
                                  );
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: defaultMargin,
                                            right: defaultMargin),
                                        child: YoutubePlayer(
                                          controller: _liveController,
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                24),
                                        margin: EdgeInsets.fromLTRB(
                                            defaultMargin,
                                            25,
                                            defaultMargin,
                                            25),
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(defaultMargin),
                                          child: SingleChildScrollView(
                                            child: Text(
                                                video[index]["deskripsi"],
                                                textAlign: TextAlign.justify,
                                                style: whiteTextFont.copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ],
                  )),
                ),
              ],
            ),
            SizedBox(height: 20),
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
                  context.bloc<PageBloc>().add(GoToQuestAnswerUPage());
                },
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
