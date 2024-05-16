import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/header_double.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          label: headerText(
            texto: 'Añadir a la Cesta 95.40Є ',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          )),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: orange,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/details1.jpg')),
                  Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 1.5)),
                      width: double.infinity,
                      height: 350),
                  Wrap(
                    children: [
                      _promoButtom(),
                      _infoPlace(), _infoPlaceStats(),

                      //  _offerBanner()
                    ],
                  )
                ],
              ),
            ),
            leading: Builder(builder: (BuildContext context) {
              return backButton(context, Colors.white);
            }),
            actions: [
              Container(
                margin: const EdgeInsets.all(10),
                child:
                    const Image(image: AssetImage('assets/images/share.png')),
              ),
              IconButton(
                icon: const Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _headers(texto: 'Populars'),
              _sliderCards(),
              _headers(texto: 'Full Menu'),
              _menuList(context),
              _headers(texto: 'Reviews'),
              _reviews(),
              _headers(texto: 'Your Rating'),
              _yourRating(),
              const SizedBox(
                height: 150.0,
              )
            ]),
          )
        ],
      ),
    );
  }
}

Widget _promoButtom() {
  return Container(
    margin: const EdgeInsets.only(top: 121.0, left: 30.0, right: 1.0),
    width: double.infinity,
    height: 25,
    // child:  Row(children: [
    //    createButton(
    //        buttonColor: orange,
    //       labelButton: 'Free Delivery',
    //       labelFontsize: 12.0)
    // ]),
  );
}

Widget _infoPlace() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        child: headerText(
            texto: 'Boon Lay Ho Huat Friend Prawn Noodle',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: gris),
            headerText(
                texto: '',
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
          ],
        ),
      )
    ],
  );
}

Widget _infoPlaceStats() {
  return Container(
    margin: const EdgeInsets.only(top: 26.0),
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    height: 70.0,
    decoration: const BoxDecoration(
        border: Border(
      top: BorderSide(color: Colors.white),
      bottom: BorderSide(color: Colors.white),
    )),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(Icons.star, color: Colors.white, size: 19.0),
            headerText(
                texto: '4.5',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0)
          ]),
          headerText(
              texto: '351 Ratings',
              color: gris,
              fontWeight: FontWeight.w500,
              fontSize: 15.0)
        ],
      ),
      Container(
        height: 40,
        decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.white))),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(Icons.bookmark, color: Colors.white, size: 19.0),
            headerText(
                texto: '137k',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0)
          ]),
          headerText(
              texto: 'Favourites',
              color: gris,
              fontWeight: FontWeight.w500,
              fontSize: 15.0)
        ],
      ),
      Container(
        height: 40,
        decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.white))),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Icon(Icons.photo, color: Colors.white, size: 19.0),
            headerText(
                texto: '346',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0)
          ]),
          headerText(
              texto: 'Photo',
              color: gris,
              fontWeight: FontWeight.w500,
              fontSize: 15.0)
        ],
      ),
    ]),
  );
}

// Widget _offerBanner() {
//   return Container(
//     color: const Color.fromRGBO(255, 237, 214, 1.0),
//     padding: const EdgeInsets.all(20),
//     height: 90.0,
//     child: Row(
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             headerText(
//                 texto: 'New! Try Pickup',
//                 color: orange,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15.0),
//             headerText(
//                 texto:
//                     'Pickup on your time. Your order is \n ready when you are ',
//                 color: orange,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 13.0)
//           ],
//         ),
//         const Spacer(),
//         createButton(
//           labelButton: 'Order Now',
//           labelFontsize: 13.0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           buttonColor: orange,
//         )
//       ],
//     ),
//   );
// }

Widget _headers({texto = String}) {
  return Container(
    margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: headerDoubleText(textHeader: texto, textAction: ''),
  );
}

Widget _sliderCards() {
  return Container(
      height: 210.0,
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext _, int index) {
            return _cards();
          }));
}

Widget _cards() {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: const Image(
          width: 200.0,
          height: 100.0,
          fit: BoxFit.cover,
          image: AssetImage('assets/images/details1.jpg'),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: headerText(
          texto: "Peanut Cheat with Dahi",
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
        ),
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: headerText(
            texto: "9.50 Є",
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: gris),
      ),
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: headerText(
                texto: "Seleccionar",
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
                color: orange),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 90),
            child: const Image(
              width: 20.0,
              height: 20.0,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/plus_order.png'),
            ),
          )
        ],
      )
    ]),
  );
}

Widget _menuList(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 10),
    child: Column(
      children: [
        _menuItem(context, 'Salads', '2'),
        _menuItem(context, 'Chicken', '5'),
        _menuItem(context, 'Soups', '6'),
        _menuItem(context, 'Vegetables', '7')
      ],
    ),
  );
}

Widget _menuItem(BuildContext context, String texto, String itemCount) {
  return Container(
    decoration:
        const BoxDecoration(border: Border(bottom: BorderSide(color: gris))),
    child: Column(
      children: [
        ListTile(
          title: headerText(
              texto: texto, fontWeight: FontWeight.w300, fontSize: 17.0),
          trailing: headerText(
              texto: itemCount, fontWeight: FontWeight.w300, fontSize: 17.0),
        ),
        _sliderCards()
      ],
    ),
  );
}

Widget _reviews() {
  return Container(
    height: 145,
    padding: const EdgeInsets.only(left: 10),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _cardReviews();
        }),
  );
}

Widget _cardReviews() {
  var lorem =
      " lorem ipsn dolor sit amet, consectetur adipiscing elit, ser do eismod tempor incididunt";
  return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(top: 10, right: 10),
      width: 350,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: const Image(
                  width: 49.0,
                  height: 43.0,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/collections2.jpg'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerText(
                        texto: "Mike Smithson",
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0),
                    headerText(
                        texto: "45 Reviews",
                        fontWeight: FontWeight.w500,
                        color: gris,
                        fontSize: 12.0)
                  ],
                ),
              ),
              const Spacer(),
              ClipRRect(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: orange,
                    width: 60,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        headerText(
                            texto: "4",
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 12),
                        const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 14,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: headerText(
                texto: lorem,
                color: gris,
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
                textAlign: TextAlign.left),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: headerText(
                texto: 'See full review',
                color: orange,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ))
        ],
      ));
}

Widget _yourRating() {
  var lorem =
      " lorem ipsn dolor sit amet, consectetur adipiscing elit, ser do eismod tempor incididunt";

  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: orangeAllOpacity,
                  width: 60,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText(
                          texto: "1",
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 12),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
            ClipRRect(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: orangeAllOpacity,
                  width: 60,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText(
                          texto: "2",
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 12),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
            ClipRRect(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: orangeAllOpacity,
                  width: 60,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText(
                          texto: "3",
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 12),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
            ClipRRect(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: orange,
                  width: 60,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText(
                          texto: "4",
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 12),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            ),
            ClipRRect(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: orangeAllOpacity,
                  width: 60,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText(
                          texto: "5",
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 12),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: headerText(
              texto: lorem,
              color: gris,
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              textAlign: TextAlign.left),
        ),
        Container(
            margin: const EdgeInsets.only(top: 10),
            child: headerText(
              texto: '+ Edit your review',
              color: orange,
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ))
      ],
    ),
  );
}
