part of 'tugaskebahagiaan_bloc.dart';

abstract class TugaskebahagiaanEvent extends Equatable {}

class FetchTugaskebahagiaanEvent extends TugaskebahagiaanEvent {
  final int id;

  FetchTugaskebahagiaanEvent(this.id);
  //FetchTugasEvent(int id);
  @override
  List<Object> get props => null;

  //get id => id;
}
