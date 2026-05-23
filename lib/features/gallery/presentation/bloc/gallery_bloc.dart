import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalaryBloc extends Bloc<GalaryEvent, GalaryState> {
  GalaryBloc() : super(GalaryInitial()) {
    on<GalaryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
