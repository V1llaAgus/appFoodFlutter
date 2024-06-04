import 'package:flutter/material.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';

const defaultShape = StadiumBorder(); // Cambiado el nombre de la constante

Widget createButton({
  BuildContext? context,
  double width = 350.0,
  double height = 45.0,
  double radius = 20.0,
  bool isWithIcon = false,
  ImageProvider<Object>? icon,
  String? labelButton,
  Color labelColor = Colors.white,
  double labelFontsize = 15.0,
  Color? buttonColor,
  OutlinedBorder? shape = defaultShape, // Usar la nueva constante
  Function()? func, // Función opcional
}) {
  return Container(
    width: width,
    height: height,
    margin: const EdgeInsets.only(top: 40.0),
    child: isWithIcon
        ? _raisedButtonWithIcon(radius, icon, labelButton ?? "", labelFontsize,
            labelColor, buttonColor!, shape ?? const StadiumBorder(), func)
        : _raisedButtonNotIcon(radius, labelButton ?? "", labelColor,
            labelFontsize, buttonColor!, shape ?? const StadiumBorder(), func),
  );
}

Widget _raisedButtonWithIcon(
    double radius,
    ImageProvider<Object>? icon,
    String labelButton,
    double labelFontsize,
    Color labelButtonColor,
    Color color,
    OutlinedBorder shape,
    Function()? func) {
  return ElevatedButton(
    onPressed:
        func, // Elimina los paréntesis para pasar la referencia de la función
    style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        backgroundColor: color,
        elevation: 0.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          Image(
            image: icon,
            width: 20.0,
            height: 20.0,
          ),
        Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: headerText(
                texto: labelButton,
                color: labelButtonColor,
                fontSize: labelFontsize,
                fontWeight: FontWeight.bold))
      ],
    ),
  );
}

Widget _raisedButtonNotIcon(
    double radius,
    String labelButton,
    Color labelButtonColor,
    double labelFontsize,
    Color color,
    OutlinedBorder shape,
    Function()? func) {
  return ElevatedButton(
    onPressed:
        func, // Elimina los paréntesis para pasar la referencia de la función
    style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        backgroundColor: color,
        elevation: 0.5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: headerText(
                texto: labelButton,
                color: labelButtonColor,
                fontSize: labelFontsize,
                fontWeight: FontWeight.bold))
      ],
    ),
  );
}
