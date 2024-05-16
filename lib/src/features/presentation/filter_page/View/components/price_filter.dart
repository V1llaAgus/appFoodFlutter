import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({Key? key}) : super(key: key);

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  //properties
  RangeValues values = const RangeValues(0.0, 100.0);
  int minPrice = 0;
  int maxPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("$minPrice Є", style: const TextStyle(fontSize: 16)),
        SizedBox(
          width: 300,
          child: RangeSlider(
            activeColor: orange,
            inactiveColor: gris,
            values: values,
            min: 0,
            max: 100.0,
            onChanged: (RangeValues newValues) {
              setState(() {
                values = newValues;
                minPrice = values.start.round();
                maxPrice = values.end.round();
              });
            },
          ),
        ),
        Text("$maxPrice Є", style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
