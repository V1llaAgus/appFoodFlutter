import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Cards/favourites_card.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({Key? key}) : super(key: key);

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            leading: Text(''),
            backgroundColor: white,
            title: Text(
              'My Favourites',
              style: TextStyle(
                color: orange,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true, // Esto centra el título
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
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
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
