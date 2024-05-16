import 'package:flutter/material.dart';

//COLORS
import 'package:foodapp/src/colors/colors.dart';

// COMMON WIDGETS
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Cards/popular_card.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Cards/vertical_card.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/header_double.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 40.0,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        alignment: Alignment.centerLeft,
                        child: headerText(
                            texto: 'Search',
                            color: Colors.black,
                            fontSize: 40.0)),
                    _searchiInput(context),
                    const SizedBox(
                      height: 30.0,
                    ),
                    headerDoubleText(
                        textHeader: 'Recent search', textAction: 'Clear Alls'),
                    _sliderRecentSearch(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    headerDoubleText(
                        textHeader: 'Recommend for you', textAction: ''),
                    const SizedBox(
                      height: 20.0,
                    ),
                    popularesCard(
                      image: const AssetImage('assets/images/populares1.jpg'),
                      title: "Andy & Cindy's Diner",
                      subtitle: "87 Botsford Circle Apt",
                      review: "4.0",
                      ratings: "(233 ratings)",
                      hasActionButton: false,
                    ),
                    popularesCard(
                      image: const AssetImage('assets/images/populares1.jpg'),
                      title: "Andy & Cindy's Diner",
                      subtitle: "87 Botsford Circle Apt",
                      review: "4.0",
                      ratings: "(233 ratings)",
                      hasActionButton: false,
                    ),
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

Widget _searchiInput(BuildContext context) {
  return Container(
    height: 40.0,
    margin: const EdgeInsets.only(
      top: 20.0,
    ),
    padding: const EdgeInsets.only(left: 5.0),
    decoration: BoxDecoration(
        color: bgInputs, borderRadius: BorderRadius.circular(20.0)),
    child: const TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5.0),
          prefixIcon: Icon(Icons.search, color: gris),
          hintText: 'Search',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _sliderRecentSearch() {
  return Container(
    margin: const EdgeInsets.only(top: 5.0),
    height: 200.0,
    child: PageView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return cardVertical(
                context: context,
                width: 160.0,
                height: 120.0,
                title: "Andy & Cyndi's Diner",
                subtitle: "87 Botsford Circle Apt",
                image: const AssetImage("assets/images/card1.jpg"),
              );
            },
          );
        }),
  );
}
