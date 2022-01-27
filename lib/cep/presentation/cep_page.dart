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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CepBloc(CepInitialState()),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<CepBloc, CepState>(
            builder: (context, state) {
              if (state is CepInitialState)
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TextInputMask(mask: '999.99.99', placeholder: "")
                        ],
                        decoration: InputDecoration(
                          hintText: "CEP: 000.00.000",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                      ),
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
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(color: Colors.red)))),
                            onPressed: () {
                              BlocProvider.of<CepBloc>(context)
                                  .add(SearchCepEvent("", context));
                            }))
                  ],
                );
              if (state is CepLoadingState) return CircularProgressIndicator();
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
