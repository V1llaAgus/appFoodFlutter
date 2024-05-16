import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';

//COLORES

Widget favouritesCard({
  BuildContext? context,
  double marginTop = 15.0,
  double marginRight = 0.0,
  double marginBottom = 0.0,
  double marginLeft = 0.0,
  required ImageProvider<Object> image,
  required String title,
  required String subtitle,
  String? review,
  String? ratings,
  String buttonText = '',
  required bool hasActionButton,
  bool isFavourite = true,
}) {
  return Container(
    margin: EdgeInsets.only(
      top: marginTop,
      right: marginRight,
      bottom: marginBottom,
      left: marginLeft,
    ),
    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(210, 211, 215, 1.0),
              offset: Offset(0, 5),
              blurRadius: 10.0)
        ]),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(width: 90, height: 90, fit: BoxFit.cover, image: image),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 7.0),
                      child: headerText(
                          texto: title,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  const SizedBox(width: 25.0),
                  IconButton(
                    icon: Icon(Icons.bookmark,
                        size: 35.0,
                        color: isFavourite ? pink : Colors.grey[300]),
                    onPressed: () {},
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5.0),
                alignment: Alignment.centerLeft,
                child: headerText(
                    texto: subtitle,
                    color: gris,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: yellow, size: 16),
                  headerText(
                      texto: review!,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                  headerText(
                      texto: ratings!,
                      color: gris,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                  // Container(
                  //     margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  //     width: 110.0,
                  //     height: 25.0,
                  //     child: createButton(
                  //         buttonColor: orange,
                  //         labelButton: buttonText,
                  //         labelFontsize: 11.0)

                  //     ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
