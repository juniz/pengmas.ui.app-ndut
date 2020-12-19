part of 'pages.dart';

class Wrapper extends StatefulWidget {
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isSigningIn = false;
  String nama = null;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<Null> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isSigningIn = prefs.getBool("isSigningIn");
      nama = prefs.getString("nama");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (nama == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? OnboardingScreen()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnDetailTugasMindfull)
                    ? DetailTugasMindfull()
                    : (pageState is OnDetailTugasKomunikasi)
                        ? DetailTugasKomunikasi()
                        : (pageState is OnDetailTugasPwb)
                            ? DetailTugasPwb()
                            : (pageState is OnDetailMateriPwb)
                                ? DetailMateriPwb(pageState.category)
                                : (pageState is OnDetailMateriKomunikasi)
                                    ? DetailMateriKomunikasi(pageState.category)
                                    : (pageState is OnDetailMateriPage)
                                        ? DetailMateriPage(pageState.category)
                                        : (pageState is OnTaskPage)
                                            ? TaskPage(pageState.materi,
                                                pageState.category)
                                            : (pageState is OnTaskMindfullPage)
                                                ? TaskMindfullPage()
                                                : (pageState is OnByDoingPage)
                                                    ? ByDoing()
                                                    : (pageState
                                                            is OnRateEmojiPage)
                                                        ? RateEmoji()
                                                        : (pageState
                                                                is OnNoteHomePage)
                                                            ? NoteHomePage()
                                                            : (pageState
                                                                    is OnGoalsPage)
                                                                ? GoalsPage()
                                                                : (pageState
                                                                        is OnSuccessPage)
                                                                    ? SuksesPage()
                                                                    : (pageState
                                                                            is OnSuksesPage)
                                                                        ? SuccessPWBPage()
                                                                        : (pageState
                                                                                is OnSukses2Page)
                                                                            ? SuccessPWB2Page()
                                                                            : (pageState is OnTugas6Page)
                                                                                ? Tugas6Page()
                                                                                : (pageState is OnInputTujuanPage)
                                                                                    ? InputTujuanPage()
                                                                                    : (pageState is OnPenjelasanTantangan3Page)
                                                                                        ? PenjelasanTantangan3Page()
                                                                                        : (pageState is OnPenjelasanTantangan4Page)
                                                                                            ? PenjelasanTantangan4Page()
                                                                                            : (pageState is OnTantangan5Page)
                                                                                                ? Tantangan5Page()
                                                                                                : (pageState is OnInti1Page)
                                                                                                    ? Inti1Page()
                                                                                                    : (pageState is OnInti2Page)
                                                                                                        ? Inti2Page()
                                                                                                        : (pageState is OnStudyChoicePage)
                                                                                                            ? StudyChoicePage()
                                                                                                            : (pageState is OnStudyChoicePart2Page)
                                                                                                                ? StudyChoicePart2Page()
                                                                                                                : (pageState is OnStudyChoicePart3Page)
                                                                                                                    ? StudyChoicePart3Page()
                                                                                                                    : (pageState is OnInti3Page)
                                                                                                                        ? Inti3Page()
                                                                                                                        : (pageState is OnInti4Page)
                                                                                                                            ? Inti4Page()
                                                                                                                            : (pageState is OnInti5Page)
                                                                                                                                ? Inti5Page()
                                                                                                                                : (pageState is OnInti6Page)
                                                                                                                                    ? Inti6Page()
                                                                                                                                    : (pageState is OnQuestAnswerPage)
                                                                                                                                        ? QuestAnswerPage()
                                                                                                                                        : (pageState is OnQuestAnswerUPage)
                                                                                                                                            ? QuestAnswerUPage()
                                                                                                                                            : (pageState is OnQuestChoicesPage)
                                                                                                                                                ? QuestChoicesPage()
                                                                                                                                                : (pageState is OnPopUpPage)
                                                                                                                                                    ? PopUpPage()
                                                                                                                                                    : (pageState is OnRateOnlyPage)
                                                                                                                                                        ? RateOnlyPage()
                                                                                                                                                        : (pageState is OnStudyRateOnlyPage)
                                                                                                                                                            ? StudyRateOnlyPage()
                                                                                                                                                            : (pageState is OnKomunikasiPage)
                                                                                                                                                                ? KomunikasiPage()
                                                                                                                                                                : (pageState is OnStudyCasePage)
                                                                                                                                                                    ? StudyCase()
                                                                                                                                                                    : (pageState is OnMoodOnlyPage)
                                                                                                                                                                        ? MoodOnlyPage()
                                                                                                                                                                        : (pageState is OnChoicesPage)
                                                                                                                                                                            ? ChoicesQuiz()
                                                                                                                                                                            : (pageState is OnChoices1Page)
                                                                                                                                                                                ? ChoicesQuiz1()
                                                                                                                                                                                : (pageState is OnChoices2Page)
                                                                                                                                                                                    ? ChoicesQuiz2()
                                                                                                                                                                                    : (pageState is OnChoices3Page)
                                                                                                                                                                                        ? ChoicesQuiz3()
                                                                                                                                                                                        : (pageState is OnQuestAnswerUPage)
                                                                                                                                                                                            ? QuestAnswerUPage()
                                                                                                                                                                                            : (pageState is OnSadarPageOne)
                                                                                                                                                                                                ? SadarPageOne()
                                                                                                                                                                                                : (pageState is OnMengamatiPageOne)
                                                                                                                                                                                                    ? MengamatiPageOne()
                                                                                                                                                                                                    : (pageState is OnPerspektifPageOne)
                                                                                                                                                                                                        ? PerspektifPageOne()
                                                                                                                                                                                                        : (pageState is OnKalenderPageOne)
                                                                                                                                                                                                            ? KalenderPageOne()
                                                                                                                                                                                                            : (pageState is OnKesimpulanPageOne)
                                                                                                                                                                                                                ? KesimpulanPage()
                                                                                                                                                                                                                : (pageState is OnTahukahPageOne)
                                                                                                                                                                                                                    ? TahukahPage()
                                                                                                                                                                                                                    : (pageState is OnSyukurPage)
                                                                                                                                                                                                                        ? SyukurPage()
                                                                                                                                                                                                                        : (pageState is OnSuaraPageOne)
                                                                                                                                                                                                                            ? SuaraPageOne()
                                                                                                                                                                                                                            : (pageState is OnPerkataanPageOne)
                                                                                                                                                                                                                                ? PerkataanPage()
                                                                                                                                                                                                                                : (pageState is OnChoicesKomPage)
                                                                                                                                                                                                                                    ? ChoicesKom()
                                                                                                                                                                                                                                    : (pageState is OnChoicesQuizKomPage)
                                                                                                                                                                                                                                        ? ChoicesQuizKom()
                                                                                                                                                                                                                                        : (pageState is OnChoicesQuiz2KomPage)
                                                                                                                                                                                                                                            ? ChoicesQuiz2Kom()
                                                                                                                                                                                                                                            : (pageState is OnChoicesQuiz3KomPage)
                                                                                                                                                                                                                                                ? ChoicesQuiz3Kom()
                                                                                                                                                                                                                                                : UserProfile());
  }
}
