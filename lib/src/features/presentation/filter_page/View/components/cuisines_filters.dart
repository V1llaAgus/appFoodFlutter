import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/rounded_button.dart';

class CuisinesFilter extends StatefulWidget {
  const CuisinesFilter({Key? key}) : super(key: key);

  @override
  State<CuisinesFilter> createState() => _CuisinesFilterState();
}

class _CuisinesFilterState extends State<CuisinesFilter> {
  bool btnAmerincan = false;
  bool btnAsia = false;
  bool btnSushi = false;
  bool btnPizza = false;

  bool btnDesserts = false;
  bool btnFastFood = false;
  bool btnVietnamese = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          children: [
            _createButtonFilter(
              () {
                setState(() => btnAmerincan = !btnAmerincan);
              },
              btnAmerincan,
              'American',
            ),
            _createButtonFilter(() {
              setState(() => btnAsia = !btnAsia);
            }, btnAsia, 'Asia'),
            _createButtonFilter(() {
              setState(() => btnSushi = !btnSushi);
            }, btnSushi, 'Sushi'),
            _createButtonFilter(() {
              setState(() => btnPizza = !btnPizza);
            }, btnPizza, 'Pizza'),
            _createButtonFilter(() {
              setState(() => btnDesserts = !btnDesserts);
            }, btnDesserts, 'Desserts'),
            _createButtonFilter(() {
              setState(() => btnFastFood = !btnFastFood);
            }, btnFastFood, 'Fasst Food'),
            _createButtonFilter(() {
              setState(() => btnVietnamese = !btnVietnamese);
            }, btnVietnamese, 'Viernam'),
          ],
        )
      ],
    );
  }
}

Widget _createButtonFilter(Function()? func, bool isActive, String labelText) {
  return Container(
    width: 140, // Reduce el ancho de la caja
    height: 80,
    margin: const EdgeInsets.only(
        left: 5, top: 1, right: 10), // Ajusta los márgenes
    child: createButton(
      labelButton: labelText,
      labelColor: isActive ? orange : gris,
      func: func as dynamic Function(),
      buttonColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: isActive ? orange : gris),
      ),
    ),
  );
}
