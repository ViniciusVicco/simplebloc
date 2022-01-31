import 'package:flutter/material.dart';
import 'package:simpleblocproject/cep/presentation/widgets/custom_pop_up.dart';
import 'package:simpleblocproject/main.dart';

class CustomPopUpModel {
  //Classe responsável por definir propriedades do CustomDialog
  String? tittle;
  String? text;
  Color? backgroundColor;
  Color? textColor;
  int? secondsToPopDown;

  CustomPopUpModel(
      {this.tittle,
      this.text,
      this.backgroundColor,
      this.textColor,
      this.secondsToPopDown});

  static Future<dynamic> showErrorPopUp(CustomPopUpModel alert) async {
    showModalBottomSheet(
        isDismissible: false,
        context: MyApp.navigatorKey.currentState!.context,
        builder: (context) {
          return CustomPopUp(event: alert);
        });

    await Future.delayed(Duration(
        seconds: alert.secondsToPopDown ??
            3)); // Caso não coloque os segundos (alert.secondsToPopDown = null) o compilador irá assumir 3 por padrão
    Navigator.of(MyApp.navigatorKey.currentState!.context).pop();
  }
}
