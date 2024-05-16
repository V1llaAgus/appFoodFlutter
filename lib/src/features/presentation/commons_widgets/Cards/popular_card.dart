import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/rounded_button.dart';

Widget popularesCard({
  BuildContext? context,
  double marginTop = 0.0,
  double marginRight = 0.0,
  double marginBottom = 0.0,
  double marginLeft = 10.0,
  required ImageProvider<Object> image,
  required String title,
  required String subtitle,
  String? review,
  String? ratings,
  String buttonText = '',
  required bool hasActionButton,
}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(
            top: marginTop,
            right: marginRight,
            bottom: marginBottom,
            left: marginLeft),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  Image(width: 80, height: 80, fit: BoxFit.cover, image: image),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 7.0),
                      child: headerText(
                          texto: title, color: Colors.black, fontSize: 17.0)),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                          color: gris,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: yellow, size: 16.0),
                      Text(
                        review ?? '',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          ratings!,
                          style: const TextStyle(
                              color: gris,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35.0),
                        width: 110.0,
                        height: 18.0,
                        child: hasActionButton
                            ? createButton(
                                buttonColor: orange,
                                labelButton: buttonText,
                                labelFontsize: 11.0)

                            // ? ElevatedButton(
                            //     onPressed: () {},
                            //     style: ElevatedButton.styleFrom(
                            //       elevation: 0.5,
                            //       shape: const StadiumBorder(),
                            //       backgroundColor: orange,
                            //     ),
                            //     child: Text(
                            //       buttonText,
                            //       style: const TextStyle(
                            //           fontSize: 11.0, color: Colors.white),
                            //     ), // Agrega un widget hijo aquí
                            //   )
                            : const Text(''),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
