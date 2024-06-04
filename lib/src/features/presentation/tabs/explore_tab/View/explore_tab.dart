import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Cards/popular_card.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/rounded_button.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildListDelegate([
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                _topBar(context),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    alignment: Alignment.centerLeft,
                    child: headerText(
                        texto: 'Discover new pleaces',
                        color: Colors.black,
                        fontSize: 30.0) //FondSize

                    /*Text('Discover me pleaces',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    )),*/

                    ),
                _sliderCards(context),
                _headers(context, "Popular this week", "Show al"),
                popularesCard(
                  image: const AssetImage('assets/images/populares1.jpg'),
                  title: "Andy & Cindy's Diner",
                  subtitle: "87 Botsford Circle Apt",
                  review: "4.0",
                  ratings: "(233 ratings)",
                  buttonText: 'Delivery',
                  hasActionButton: true,
                ),
                popularesCard(
                  image: const AssetImage('assets/images/populares1.jpg'),
                  title: "Andy & Cindy's Diner",
                  subtitle: "87 Botsford Circle Apt",
                  review: "4.0",
                  ratings: "(233 ratings)",
                  buttonText: 'Delivery',
                  hasActionButton: true,
                ),
                popularesCard(
                  image: const AssetImage('assets/images/populares1.jpg'),
                  title: "Andy & Cindy's Diner",
                  subtitle: "87 Botsford Circle Apt",
                  review: "4.0",
                  ratings: "(233 ratings)",
                  buttonText: 'Delivery',
                  hasActionButton: true,
                ),
                const SizedBox(height: 10.0),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'collections');
                    },
                    child:
                        _headers(context, "Collections this week", "Show al")),
                _sliderCollections(context)
              ], // Agregué una coma aquí
            )),
      ])),
    ]));
  }
}

Widget _topBar(BuildContext context) {
  return Row(
    children: <Widget>[
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'search'),
        child: Container(
          width: 310,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(left: 26),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(234, 236, 239, 1.0)),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, size: 20.0, color: gris),
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: const Text('Search',
                    style: TextStyle(color: gris, fontSize: 17.0)),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: 45.0,
        height: 45.0,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(209, 209, 214, 1.0),
          borderRadius: BorderRadius.circular(30),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.filter_list,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'filter');
          },
        ),
      ),
    ],
  );
}

Widget _sliderCards(BuildContext context) {
  return SizedBox(
    height: 360.0,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: _tarjeta(context),
          ),
        ),
      ),
    ),
  );
}

Widget _tarjeta(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'place-detail');
    },
    child: Container(
      margin: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              "assets/images/inicio.jpg",
              width: 210.0,
              height: 250.0,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text("Andy y Cindy's Diner",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "87 Botsford Circle Apt",
                  style: TextStyle(
                    color: bgInputs,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0,
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: yellow, size: 16),
                  const Text("4.8",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  const Text("(233 ratings)",
                      style: TextStyle(
                          color: bgInputs,
                          fontWeight: FontWeight.w600,
                          fontSize: 13.0)),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      width: 80.0,
                      height: 18.0,
                      child: createButton(
                        buttonColor: orange,
                        labelButton: 'Delivery',
                        labelFontsize: 11.0,
                      ))
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget _headers(BuildContext context, String textHeader, String textAction) {
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child:
            headerText(texto: textHeader, color: Colors.black, fontSize: 20.0),
      ),
      const Spacer(),
      GestureDetector(
        child: Row(
          children: [
            Text(
              textAction,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
              ),
            ),
            const Icon(Icons.play_arrow)
          ],
        ),
      )
    ],
  );
}

Widget populares(BuildContext context, String foto) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  image: NetworkImage(foto)),
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
                          texto: "Andy & Cindy's Diner",
                          color: Colors.black,
                          fontSize: 17.0)),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: const Text(
                      "87 Botsford Circle Apt",
                      style: TextStyle(
                          color: gris,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: yellow, size: 16.0),
                      const Text(
                        "4.5",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: const Text(
                          "230 rating",
                          style: TextStyle(
                              color: gris,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35.0),
                        width: 110.0,
                        height: 18.0,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0.5,
                            shape: const StadiumBorder(),
                            backgroundColor: orange,
                          ),
                          child: const Text(
                            'Delivery',
                            style:
                                TextStyle(fontSize: 11.0, color: Colors.white),
                          ), // Agrega un widget hijo aquí
                        ),
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

Widget _sliderCollections(BuildContext context) {
  return SizedBox(
    height: 180.0,
    child: ListView.builder(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return _tarjetaCollection(context);
      },
    ),
  );
}

Widget _tarjetaCollection(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: const Image(
            width: 300,
            height: 150,
            fit: BoxFit.cover,
            image: AssetImage("assets/images/popularWidget.jpg"),
          ),
        ),
      ],
    ),
  );
}
