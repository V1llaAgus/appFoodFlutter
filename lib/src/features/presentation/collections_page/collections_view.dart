import 'package:flutter/material.dart';

import 'package:foodapp/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Colors.white,
              title: headerText(texto: 'Collections', fontSize: 18),
              centerTitle: true,
              leading: Builder(builder: (BuildContext context) {
                return backButton(context, Colors.black);
              })),
          SliverPadding(
            padding: const EdgeInsets.only(left: 40.0, right: 0.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              children: [
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
                _card(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _card(BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'collections-detail');
      },
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const Image(
                  width: 165,
                  height: 190,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/collections1.jpg'))),
          Positioned.fill(
            bottom: 40.0,
            right: 65.0,

            // Para hacer que el contenedor ocupe todo el tamaño de la imagen
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 1.3),
                borderRadius: BorderRadius.circular(
                    10), // Ajustar los bordes para que coincidan con la imagen
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 70, bottom: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                headerText(
                    texto: 'Asia',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                headerText(
                    texto: '128 places',
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300)
              ],
            ),
          )
        ],
      ));
}
