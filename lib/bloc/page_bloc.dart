import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project1/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => OnInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToDetailTugasMindfull) {
      yield OnDetailTugasMindfull();
    } else if (event is GoToDetailTugasKomunikasi) {
      yield OnDetailTugasKomunikasi();
    } else if (event is GoToDetailTugasPwb) {
      yield OnDetailTugasPwb();
    } else if (event is GoToDetailMateriPwb) {
      yield OnDetailMateriPwb(event.category);
    } else if (event is GoToDetailMateriKomunikasi) {
      yield OnDetailMateriKomunikasi(event.category);
    } else if (event is GoToDetailMateriPage) {
      yield OnDetailMateriPage(event.category);
    } else if (event is GoToTaskMindfullPage) {
      yield OnTaskMindfullPage();
    } else if (event is GoToTaskKomunikasiPage) {
      yield OnTaskKomunikasiPage(event.tugas, event.category);
    } else if (event is GoToTaskPwbPage) {
      yield OnTaskPwbPage(event.tugas, event.category);
    } else if (event is GoToTaskPage) {
      yield OnTaskPage(event.materi, event.category);
    } else if (event is GoToByDoingPage) {
      yield OnByDoingPage();
    } else if (event is GoToRateEmojiPage) {
      yield OnRateEmojiPage();
    } else if (event is GoToNoteHomePage) {
      yield OnNoteHomePage();
    } else if (event is GoToGoalsPage) {
      yield OnGoalsPage();
    } else if (event is GoToSuccessPage) {
      yield OnSuccessPage();
    } else if (event is GoToQuestAnswerPage) {
      yield OnQuestAnswerPage();
    } else if (event is GoToQuestAnswerUPage) {
      yield OnQuestAnswerUPage();
    } else if (event is GoToPopUpPage) {
      yield OnPopUpPage();
    } else if (event is GoToRateOnlyPage) {
      yield OnRateOnlyPage();
    } else if (event is GoToStudyRateOnlyPage) {
      yield OnStudyRateOnlyPage();
    } else if (event is GoToMoodOnlyPage) {
      yield OnMoodOnlyPage();
    } else if (event is GoToChoicesPage) {
      yield OnChoicesPage();
    } else if (event is GoToChoices1Page) {
      yield OnChoices1Page();
    } else if (event is GoToChoices2Page) {
      yield OnChoices2Page();
    } else if (event is GoToChoices3Page) {
      yield OnChoices3Page();
    } else if (event is GoToQuestAnswerUPage) {
      yield OnQuestAnswerUPage();
    } else if (event is GoToQuestChoicesPage) {
      yield OnQuestChoicesPage();
    } else if (event is GoToSadarPageOne) {
      yield OnSadarPageOne();
    } else if (event is GoToMengamatiPageOne) {
      yield OnMengamatiPageOne();
    } else if (event is GoToPerspektifPageOne) {
      yield OnPerspektifPageOne();
    } else if (event is GoToKalenderPageOne) {
      yield OnKalenderPageOne();
    } else if (event is GoToKesimpulanPageOne) {
      yield OnKesimpulanPageOne();
    } else if (event is GoToSyukurPage) {
      yield OnSyukurPage();
    } else if (event is GoToTahukahPageOne) {
      yield OnTahukahPageOne();
    } else if (event is GoToSuaraPageOne) {
      yield OnSuaraPageOne();
    } else if (event is GoToPerkataanPageOne) {
      yield OnPerkataanPageOne();
    } else if (event is GoToSuksesPage) {
      yield OnSuksesPage();
    } else if (event is GoToSukses2Page) {
      yield OnSukses2Page();
    } else if (event is GoToStudyCasePage) {
      yield OnStudyCasePage();
    } else if (event is GoToKomunikasiPage) {
      yield OnKomunikasiPage();
    } else if (event is GoToKomunikasiPage) {
      yield OnKomunikasiPage();
    } else if (event is GoToInti1Page) {
      yield OnInti1Page();
    } else if (event is GoToInti2Page) {
      yield OnInti2Page();
    } else if (event is GoToInti3Page) {
      yield OnInti3Page();
    } else if (event is GoToInti4Page) {
      yield OnInti4Page();
    } else if (event is GoToInti5Page) {
      yield OnInti5Page();
    } else if (event is GoToInti6Page) {
      yield OnInti6Page();
    } else if (event is GoToStudyChoicePage) {
      yield OnStudyChoicePage();
    } else if (event is GoToStudyChoicePart2Page) {
      yield OnStudyChoicePart2Page();
    } else if (event is GoToStudyChoicePart3Page) {
      yield OnStudyChoicePart3Page();
    } else if (event is GoToPenjelasanTantangan3Page) {
      yield OnPenjelasanTantangan3Page();
    } else if (event is GoToPenjelasanTantangan4Page) {
      yield OnPenjelasanTantangan4Page();
    } else if (event is GoToTantangan5Page) {
      yield OnTantangan5Page();
    } else if (event is GoToTugas6Page) {
      yield OnTugas6Page();
    } else if (event is GoToInputTujuanPage) {
      yield OnInputTujuanPage();
    }
  }
}
