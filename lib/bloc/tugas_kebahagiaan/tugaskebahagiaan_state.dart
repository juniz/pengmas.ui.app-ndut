part of 'tugaskebahagiaan_bloc.dart';

abstract class TugaskebahagiaanState extends Equatable {}

class TugaskebahagiaanInitialState extends TugaskebahagiaanState {
  @override
  List<Object> get props => [];
}

class TugaskebahagiaanLoadingState extends TugaskebahagiaanState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class TugaskebahagiaanLoadedState extends TugaskebahagiaanState {
  List<Tugaskebahagiaan> tugaskebahagiaan;

  TugaskebahagiaanLoadedState({@required this.tugaskebahagiaan});

  @override
  List<Object> get props => [tugaskebahagiaan];
}

// ignore: must_be_immutable
class TugaskebahagiaanErrorState extends TugaskebahagiaanState {
  String message;

  TugaskebahagiaanErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
