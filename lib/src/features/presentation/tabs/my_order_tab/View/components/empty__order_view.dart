import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';

class EmptyOrderView extends StatelessWidget {
  const EmptyOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        elevation: 0.5,
        leading: const Text(''),
        backgroundColor: white,
        title: Center(
          child: headerText(
            texto: 'My Order',
            color: accentColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              width: 216,
              height: 216,
              image: AssetImage('assets/images/emptyOrder.png'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: headerText(
                texto: 'Cart Empty',
                color: bgInputs,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: headerText(
                texto:
                    'Good food is always cooking! Go ahead, order some yummy items from the menu.',
                textAlign: TextAlign.center,
                color: bgInputs,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
