part of 'cep_bloc.dart';

abstract class CepState extends Equatable {
  const CepState();

  @override
  List<Object> get props => [];
}

class CepInitialState extends CepState {}

class CepLoadingState extends CepState {}

class CepErrorState extends CepState {}

class CepSuccesState extends CepState {}
