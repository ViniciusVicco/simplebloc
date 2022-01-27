import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'cep_event.dart';
part 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  CepBloc(CepState initialState) : super(initialState);

  @override
  Stream<CepState> mapEventToState(CepEvent event) async* {
    // TODO: implement mapEventToState
    if (event is SearchCepEvent) {
      yield CepLoadingState();
      await Future.delayed(Duration(seconds: 2));
      print(event.cep);

      BuildContext context = event.context;
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(child: Text("Ocorreu um erro")));
          });
      yield CepInitialState();
    }
  }
}
