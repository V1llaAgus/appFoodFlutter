import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/rounded_button.dart';
import 'package:foodapp/src/features/presentation/tabs/my_order_tab/View/components/empty__order_view.dart';

class MyOrderTab extends StatefulWidget {
  const MyOrderTab({Key? key}) : super(key: key);

  @override
  State<MyOrderTab> createState() => _MyOrderTabState();
}

class _MyOrderTabState extends State<MyOrderTab> {
  final emptyOrderState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      body: emptyOrderState
          ? const EmptyOrderView()
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0.5,
                  leading: const Text(''),
                  backgroundColor: white,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0), // Ajusta este valor según sea necesario
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        headerText(
                          texto: 'My Order',
                          color: orange,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        _orders(context),
                        const SizedBox(
                          height: 40,
                        ),
                        _checkoutResume(context)
                      ],
                    ),
                  )
                ]))
              ],
            ),
    );
  }
}

Widget _orders(BuildContext context) {
  return Column(
    children: [_cardOrdes(context)],
  );
}

Widget _cardOrdes(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(248, 248, 248, 1.0),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(210, 211, 215, 1.0),
              spreadRadius: 1.0,
              blurRadius: 4.0)
        ]),
    child: Column(
      children: [
        Row(
          children: [_cardOrderTopContent()],
        ),
        Column(
          children: [
            _items(context),
            _items(context),
            _items(context),
            _items(context)
          ],
        ),
        _moreContent(context)
      ],
    ),
  );
}

Widget _cardOrderTopContent() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 7.0, bottom: 7.0, right: 20.0),
          child: headerText(
              texto: "Little Creatures - Club Street",
              fontSize: 20.0,
              fontWeight: FontWeight.normal),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on,
              color: gris,
              size: 16.0,
            ),
            headerText(
                texto: "87 Botsford Circle Apt",
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 14.0),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                width: 120.0,
                height: 20.0,
                child: createButton(
                    labelButton: 'Free Delivery',
                    labelFontsize: 11.0,
                    buttonColor: orange)
                // ElevatedButton(
                //   style: ButtonStyle(
                //     shape: MaterialStateProperty.all<StadiumBorder>(
                //         const StadiumBorder()),
                //     backgroundColor: MaterialStateProperty.all<Color>(orange),
                //     foregroundColor:
                //         MaterialStateProperty.all<Color>(Colors.white),
                //   ),
                //   onPressed: () {},
                //   child: const Text(
                //     'Free Delivery',
                //     style: TextStyle(fontSize: 11.0, color: white),
                //   ),
                // ),
                )
          ],
        )
      ],
    ),
  );
}

Widget _items(context) {
  return Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerText(
              texto: 'Special gajananad Bhel',
              color: orange,
              fontWeight: FontWeight.w300,
              fontSize: 15.0),
          headerText(
              texto: 'Mixed vegetables, Chicken Egg',
              color: gris,
              fontWeight: FontWeight.w300,
              fontSize: 12.0),
        ],
      ),
      trailing: headerText(
          texto: '17.20 Є ',
          color: gris,
          fontWeight: FontWeight.w300,
          fontSize: 15.0),
    ),
  );
}

Widget _moreContent(context) {
  return ListTile(
    title: headerText(
        texto: 'Add more items ',
        color: pink,
        fontWeight: FontWeight.w600,
        fontSize: 17.0),
  );
}

Widget _checkoutResume(context) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: white,
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(210, 211, 215, 1.0),
              spreadRadius: 1.0,
              blurRadius: 4.0)
        ]),
    child: Column(
      children: [
        _itemsCheckOutResume(
            title: 'Subtotal', value: '93.40 Є', context: context),
        _itemsCheckOutResume(
            title: 'Tax & Fee', value: '3.00 Є', context: context),
        _itemsCheckOutResume(
            title: 'Delivery', value: 'Free', context: context),
        _buttonCheckOut(context),
      ],
    ),
  );
}

Widget _itemsCheckOutResume(
    {title = String, value = String, context = BuildContext}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
    ),
    child: ListTile(
        title: headerText(
            texto: title, fontWeight: FontWeight.w400, fontSize: 15.0),
        trailing: headerText(
            texto: value, fontWeight: FontWeight.w500, fontSize: 15.0)),
  );
}

Widget _buttonCheckOut(context) {
  return Container(
    width: double.infinity,
    height: 45.0,
    margin: const EdgeInsets.only(top: 10.0),
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: orange,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            margin: const EdgeInsets.only(
              left: 50,
            ),
            child: headerText(
                texto: 'Pedir',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: white),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 50,
            ),
            child: headerText(
                texto: '95.49 Є ',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: white),
          )
        ],
      ),
    ),
  );
}
