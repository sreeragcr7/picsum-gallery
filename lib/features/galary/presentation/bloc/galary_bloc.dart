import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'galary_event.dart';
part 'galary_state.dart';

class GalaryBloc extends Bloc<GalaryEvent, GalaryState> {
  GalaryBloc() : super(GalaryInitial()) {
    on<GalaryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
