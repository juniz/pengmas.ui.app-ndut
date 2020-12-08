part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GoToDetailMateriPage extends PageEvent {
  final Category category;
  GoToDetailMateriPage(this.category);

  @override
  List<Object> get props => [category];
}

class GoToDetailTugasMindfull extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToDetailTugasPwb extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToDetailMateriPwb extends PageEvent {
  final Category category;
  GoToDetailMateriPwb(this.category);

  @override
  List<Object> get props => [category];
}

class GoToDetailTugasKomunikasi extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToDetailMateriKomunikasi extends PageEvent {
  final Category category;
  GoToDetailMateriKomunikasi(this.category);

  @override
  List<Object> get props => [category];
}

class GoToTaskPage extends PageEvent {
  final Materi materi;
  final Category category;
  GoToTaskPage(this.materi, this.category);

  @override
  List<Object> get props => [materi, category];
}

class GoToTaskMindfullPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToByDoingPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRateEmojiPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToNoteHomePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToGoalsPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSuccessPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToQuestAnswerPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToQuestChoicesPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToPopUpPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRateOnlyPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToStudyRateOnlyPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMoodOnlyPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToChoicesPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToChoices1Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToChoices2Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToChoices3Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSyukurPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToQuestAnswerUPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSadarPageOne extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMengamatiPageOne extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToPerspektifPageOne extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToKalenderPageOne extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToKesimpulanPageOne extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToTahukahPageOne extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSuaraPageOne extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToPerkataanPageOne extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSuksesPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSukses2Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToTaskKomunikasiPage extends PageEvent {
  final Tugaskomunikasi tugas;
  final Category category;
  GoToTaskKomunikasiPage(this.tugas, this.category);

  @override
  List<Object> get props => [tugas, category];
}

class GoToTaskPwbPage extends PageEvent {
  final Tugaspwb tugas;
  final Category category;
  GoToTaskPwbPage(this.tugas, this.category);

  @override
  List<Object> get props => [tugas, category];
}

class GoToStudyCasePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToKomunikasiPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToInti1Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToInti2Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToInti3Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToInti4Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToInti5Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToInti6Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToStudyChoicePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToStudyChoicePart2Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToStudyChoicePart3Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToPenjelasanTantangan3Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToPenjelasanTantangan4Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToTantangan5Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToTugas6Page extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToInputTujuanPage extends PageEvent {
  @override
  List<Object> get props => [];
}
