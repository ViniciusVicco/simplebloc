import 'package:flutter/material.dart';
import 'package:simpleblocproject/cep/presentation/alerts/alerts.dart';

class CustomPopUp extends StatelessWidget {
  final CustomPopUpModel event;
  const CustomPopUp({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: event.backgroundColor,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 2,
              child: Offstage(
                offstage: event.tittle!.isEmpty,
                child: Text(
                  event.tittle!,
                  style: TextStyle(color: event.textColor),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: Icon(
                  Icons.warning,
                  color: event.textColor,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Text(
                event.text!,
                style: TextStyle(color: event.textColor),
              ),
            ),
          ],
        ));
  }
}
