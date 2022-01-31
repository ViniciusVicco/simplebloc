import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:simpleblocproject/cep/presentation/alerts/alerts.dart';

part 'cep_event.dart';
part 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  CepBloc(CepState initialState) : super(initialState);

  @override
  Stream<CepState> mapEventToState(CepEvent event) async* {
    if (event is SearchCepEvent) {
      // Se o evento disparado é busca de cpf, execute este if.
      yield CepLoadingState(); // Apresenta estado de carregamento na view
      await Future.delayed(Duration(seconds: 2));
      // await, quando o corpo da função tem um async, é possível escrever códigos assincronos, como esperar 2 segundos...
      print(event.cep);
      CustomPopUpModel.showErrorPopUp(CustomPopUpModel(
        backgroundColor: Colors.black, // Cor de fundo do popUp
        textColor: Colors.white, // Cor do texto
        text: "Ocorreu Um Erro", // Texto
        tittle: "Erro ao buscar Cep", // Titulo
      ));
      yield CepInitialState(); // Retorna estado inicial após apresentar erro.
    }
  }
}
