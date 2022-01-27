part of 'cep_bloc.dart';

abstract class CepEvent extends Equatable {
  const CepEvent();

  @override
  List<Object> get props => [];
}

class SearchCepEvent extends CepEvent {
  final String cep;
  final BuildContext context;

  SearchCepEvent(this.cep, this.context);
}
