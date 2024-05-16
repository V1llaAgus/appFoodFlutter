import 'package:flutter/material.dart';
//COLORES
import 'package:foodapp/src/colors/colors.dart';
//COMMONS WIDGETS
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';

Widget cardVertical({
  BuildContext? context,
  double? width,
  double? height,
  required ImageProvider<Object> image,
  required String title,
  required String subtitle,
}) {
  return Container(
    margin: const EdgeInsets.all(9.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          child: Image(
            width: width,
            height: height,
            fit: BoxFit.cover,
            image: image,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: headerText(
                  texto: title, fontWeight: FontWeight.w500, fontSize: 17.0),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: headerText(
                  texto: subtitle,
                  color: gris,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0),
            )
          ],
        )
      ],
    ),
  );
}
