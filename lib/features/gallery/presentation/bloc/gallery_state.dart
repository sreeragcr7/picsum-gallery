part of 'gallery_bloc.dart';

sealed class GalaryState extends Equatable {
  const GalaryState();
  
  @override
  List<Object> get props => [];
}

final class GalaryInitial extends GalaryState {}
