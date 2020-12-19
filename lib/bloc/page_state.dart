part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnDetailMateriPage extends PageState {
  final Category category;

  OnDetailMateriPage(this.category);

  @override
  List<Object> get props => [category];
}

class OnDetailMateriMindfull extends PageState {
  final Category category;

  OnDetailMateriMindfull(this.category);

  @override
  List<Object> get props => [category];
}

class OnDetailTugasMindfull extends PageState {
  @override
  List<Object> get props => [];
}

class OnDetailTugasKomunikasi extends PageState {
  @override
  List<Object> get props => [];
}

class OnDetailTugasPwb extends PageState {
  @override
  List<Object> get props => [];
}

class OnDetailMateriPwb extends PageState {
  final Category category;

  OnDetailMateriPwb(this.category);

  @override
  List<Object> get props => [category];
}

class OnDetailMateriKomunikasi extends PageState {
  final Category category;

  OnDetailMateriKomunikasi(this.category);

  @override
  List<Object> get props => [category];
}

class OnTaskPage extends PageState {
  final Materi materi;
  final Category category;
  OnTaskPage(this.materi, this.category);

  @override
  List<Object> get props => [materi, category];
}

class OnTaskMindfullPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnByDoingPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRateEmojiPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnNoteHomePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnGoalsPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSuccessPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnQuestAnswerPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnQuestAnswerUPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnQuestChoicesPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnPopUpPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRateOnlyPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnStudyRateOnlyPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMoodOnlyPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnChoicesPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnChoices1Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnChoices2Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnChoices3Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnSadarPageOne extends PageState {
  @override
  List<Object> get props => [];
}

class OnMengamatiPageOne extends PageState {
  @override
  List<Object> get props => [];
}

class OnPerspektifPageOne extends PageState {
  @override
  List<Object> get props => [];
}

class OnKalenderPageOne extends PageState {
  @override
  List<Object> get props => [];
}

class OnKesimpulanPageOne extends PageState {
  @override
  List<Object> get props => [];
}

class OnTahukahPageOne extends PageState {
  @override
  List<Object> get props => [];
}

class OnSuaraPageOne extends PageState {
  @override
  List<Object> get props => [];
}

class OnSyukurPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnPerkataanPageOne extends PageState {
  @override
  List<Object> get props => [];
}

class OnSuksesPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSukses2Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnTaskKomunikasiPage extends PageState {
  final Category category;
  final Tugaskomunikasi tugas;
  OnTaskKomunikasiPage(this.tugas, this.category);

  @override
  List<Object> get props => [tugas, category];
}

class OnTaskPwbPage extends PageState {
  final Category category;
  final Tugaspwb tugas;
  OnTaskPwbPage(this.tugas, this.category);

  @override
  List<Object> get props => [tugas, category];
}

class OnStudyCasePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnKomunikasiPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnInti1Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnInti2Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnInti3Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnInti4Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnInti5Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnInti6Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnStudyChoicePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnStudyChoicePart2Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnStudyChoicePart3Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnPenjelasanTantangan3Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnPenjelasanTantangan4Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnTantangan5Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnTugas6Page extends PageState {
  @override
  List<Object> get props => [];
}

class OnInputTujuanPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnChoicesKomPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnChoicesQuizKomPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnChoicesQuiz2KomPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnChoicesQuiz3KomPage extends PageState {
  @override
  List<Object> get props => [];
}
