part of '../pages.dart';

// ignore: must_be_immutable
class TaskMindfullPage extends StatefulWidget {
  @override
  _TaskMindfullPageState createState() => _TaskMindfullPageState();
}

class _TaskMindfullPageState extends State<TaskMindfullPage> {
  PerintahBloc perintahBloc;
  OnTaskMindfullPage state;
  int id;
  String nama;

  void setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getInt("idTugas");
      nama = prefs.getString("namaTugas");
    });
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int no = prefs.getInt("idTugas");
    print(no);
    perintahBloc = BlocProvider.of<PerintahBloc>(context);
    perintahBloc.add(FetchPerintahEvent(no));
  }

  @override
  void initState() {
    super.initState();
    setData();
    getData();
  }

  Widget build(BuildContext context) {
    var materi;

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToDetailTugasMindfull());

        return;
      },
      child: Scaffold(
        // theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        body: Stack(children: <Widget>[
          Container(color: accentColor4),
          SafeArea(
            child: Container(
              color: Color(0xFFF6F7F9),
            ),
          ),
          ListView(
            children: <Widget>[
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
                            context
                                .bloc<PageBloc>()
                                .add(GoToDetailTugasMindfull());
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Latihan:',
                          textAlign: TextAlign.center,
                          style: blackTextFont.copyWith(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    elevation: 10,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              // borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/taskmindfull.jpeg"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.90),
                                  Colors.black.withOpacity(0)
                                ]),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  nama ?? "",
                                  maxLines: 2,
                                  style: whiteTextFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              BlocListener<PerintahBloc, PerintahState>(
                listener: (context, state) {
                  if (state is PerintahErrorState) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                child: BlocBuilder<PerintahBloc, PerintahState>(
                  // ignore: missing_return
                  builder: (context, state) {
                    if (state is LatihanInitialState) {
                      return buildLoading();
                    } else if (state is PerintahLoadingState) {
                      return buildLoading();
                    } else if (state is PerintahLoadedState) {
                      print(state.perintah[0].pertanyaan);
                      return buildLatihanList(state.perintah ?? '');
                    } else if (state is PerintahErrorState) {
                      return buildErrorUi(state.message);
                    }
                  },
                ),
              ),
              SizedBox(height: 45),
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
                    print(id);
                    //navigateToMateriDetailPage(context, materi[pos]);

                    if (id == 1) {
                      context.bloc<PageBloc>().add(GoToSadarPageOne());
                    } else if (id == 2) {
                      context.bloc<PageBloc>().add(GoToMengamatiPageOne());
                    } else if (id == 3) {
                      context.bloc<PageBloc>().add(GoToPerspektifPageOne());
                    } else if (id == 4) {
                      context.bloc<PageBloc>().add(GoToKalenderPageOne());
                    } else if (id == 5) {
                      context.bloc<PageBloc>().add(GoToKesimpulanPageOne());
                    } else if (id == 6) {
                      context.bloc<PageBloc>().add(GoToSyukurPage());
                    }
                  },
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildLatihanList(List<Perintah> perintah) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: perintah.length,
      itemBuilder: (ctx, pos) {
        print(perintah[pos].pertanyaan);
        return Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: ModalTrigger(perintah[pos]),
            //child: Text(latihan[pos].panduan),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class ModalTriggerMIndfull extends StatefulWidget {
  final Perintah perintah;

  ModalTriggerMIndfull(this.perintah);

  @override
  _ModalTriggerState createState() => _ModalTriggerState();
}

class _ModalTriggerMIndfullState extends State<ModalTrigger> {
  //LatihanBloc latihanBloc;
  void initState() {
    super.initState();
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Stack(children: <Widget>[
            Container(
              height: 600,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: ListView(children: <Widget>[
                Column(children: <Widget>[
                  Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.cancel, color: mainColor, size: 20),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 0),
                        child: Text(
                          widget.perintah.pertanyaan,
                          textAlign: TextAlign.left,
                          style: blackTextFont.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ])
                ]),
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 20, horizontal: defaultMargin),
                    child: Divider(
                      color: Color(0xFFE4E4E4),
                      thickness: 1,
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Html(
                    data: widget.perintah.detail,
                    //style: purpleTextFont.copyWith(fontSize: 16),
                    //textAlign: TextAlign.left,
                  ),
                ),
              ]),
            ),

            // SizedBox(height: 15.0),
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 70,
      child: RaisedButton(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Icon(Icons.question_answer, color: accentColor4),
              ),
              Flexible(
                child: Center(
                  child: Text(
                    widget.perintah.pertanyaan,
                    style: purpleTextFont.copyWith(fontSize: 13),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          _showModalBottomSheet(context);
        },
      ),
    );
  }
}

class ModalTriggerMIndfull2 extends StatefulWidget {
  Materi materi;

  ModalTriggerMIndfull2({this.materi});

  @override
  _ModalTriggerMIndfull2State createState() => _ModalTriggerMIndfull2State();
}

class _ModalTriggerMIndfull2State extends State<ModalTriggerMIndfull2> {
  _showModalBottomSheet2(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Stack(children: <Widget>[
            Container(
              height: 600,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(0),
                  )),
              child: ListView(children: <Widget>[
                Column(children: <Widget>[
                  Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.cancel, color: mainColor, size: 10),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 40),
                        child: Text(
                          // widget.materi.judul,
                          'Judul',
                          textAlign: TextAlign.left,
                          style: blackTextFont.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ])
                ]),
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 20, horizontal: defaultMargin),
                    child: Divider(
                      color: Color(0xFFE4E4E4),
                      thickness: 1,
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 20, 20, 20),
                  child: Text(
                    widget.materi.detailMateri,
                    // '1. Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.\n'
                    // '2. Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.\n'
                    // '3. Lorem ipsum dolor sit amet, consect adipiscing elit, sed do.\n',
                    style: purpleTextFont.copyWith(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ]),
            ),
            // SizedBox(height: 15.0),
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 70,
      child: RaisedButton(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Icon(Icons.question_answer, color: accentColor4),
              ),
              Text(
                "Ikuti instruksi berikut ini",
                style: purpleTextFont.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          _showModalBottomSheet2(context);
        },
      ),
    );
  }
}
