import 'package:flutter/material.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';

Widget headerDoubleText({
  String textHeader = "",
  String textAction = "",
  void Function()? func,
}) {
  return Row(
    children: [
      headerText(texto: textHeader, fontSize: 20.0),
      const Spacer(),
      GestureDetector(
        onTap: func,
        child: headerText(
          texto: textAction,
          color: Colors.orange,
          fontWeight: FontWeight.w500,
          fontSize: 15.0,
        ),
      ),
    ],
  );
}
