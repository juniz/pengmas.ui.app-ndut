import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project1/models/models.dart';
import 'package:meta/meta.dart';
import 'package:project1/services/services.dart';

part 'tugaskebahagiaan_event.dart';
part 'tugaskebahagiaan_state.dart';

class TugasKebahagiaanBloc
    extends Bloc<TugaskebahagiaanEvent, TugaskebahagiaanState> {
  TugasKebahagiaanRepo tugaskebahagiaanrepo;
  TugasKebahagiaanBloc({@required this.tugaskebahagiaanrepo});

  @override
  TugaskebahagiaanState get initialState => TugaskebahagiaanInitialState();

  @override
  Stream<TugaskebahagiaanState> mapEventToState(
    TugaskebahagiaanEvent event,
  ) async* {
    if (event is FetchTugaskebahagiaanEvent) {
      yield TugaskebahagiaanLoadingState();
      try {
        List<Tugaskebahagiaan> tugaskebahagiaan =
            await tugaskebahagiaanrepo.getTugas(event.id);
        yield TugaskebahagiaanLoadedState(tugaskebahagiaan: tugaskebahagiaan);
      } catch (e) {
        TugaskebahagiaanErrorState(message: e.toString());
      }
    }
  }
}
