import 'package:flutter/material.dart';

//COMMONS WIDGETS
import 'package:foodapp/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Cards/favourites_card.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 330,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image:
                          AssetImage('assets/images/collectionsdetails1.jpg')),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 1.3),
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: double.infinity),
                  Center(
                      child: headerText(
                          texto: 'Asia \n Restauran',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          textAlign: TextAlign.center))
                ],
              ),
            ),
            leading: Builder(builder: (BuildContext context) {
              return backButton(context, Colors.black);
            }),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: headerText(
                      texto: '128 places',
                      color: const Color.fromRGBO(51, 58, 77, 1.0),
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                Column(
                  children: [
                    favouritesCard(
                        image: const AssetImage('assets/images/populares1.jpg'),
                        title: "Andy & Cindy's Diner",
                        subtitle: "87 Botsford Circle Apt",
                        review: "4.0",
                        ratings: "(233 ratings)",
                        buttonText: 'Delivery',
                        hasActionButton: true,
                        isFavourite: true),
                    favouritesCard(
                        image: const AssetImage('assets/images/populares1.jpg'),
                        title: "Andy & Cindy's Diner",
                        subtitle: "87 Botsford Circle Apt",
                        review: "4.0",
                        ratings: "(233 ratings)",
                        buttonText: 'Delivery',
                        hasActionButton: true,
                        isFavourite: false),
                  ],
                )
              ]),
            )
          ]))
        ],
      ),
    );
  }
}
