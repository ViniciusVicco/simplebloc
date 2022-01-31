import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleblocproject/cep/bloc/cep_bloc.dart';

class CepPage extends StatefulWidget {
  CepPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CepPageState createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CepBloc(CepInitialState()),
      child: Scaffold(
        backgroundColor: Colors.greenAccent[700],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Demonstração De Flutter + Bloc Com consumo de Api",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              BlocBuilder<CepBloc, CepState>(
                builder: (context, state) {
                  if (state is CepInitialState)
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TextInputMask(mask: '99999-99', placeholder: "")
                            ],
                            decoration: InputDecoration(
                              hintText: "CEP: 00000-00",
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: ElevatedButton(
                                child: Text("Buscar".toUpperCase(),
                                    style: TextStyle(fontSize: 14)),
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.orange),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: BorderSide(
                                                color: Colors.orange)))),
                                onPressed: () {
                                  BlocProvider.of<CepBloc>(context)
                                      .add(SearchCepEvent("", context));
                                }))
                      ],
                    );
                  if (state is CepLoadingState)
                    return CircularProgressIndicator();
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
