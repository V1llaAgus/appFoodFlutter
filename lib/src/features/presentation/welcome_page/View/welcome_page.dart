//UIS
import 'dart:ui';

//SERVICES
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/src/colors/colors.dart';

// COMMONS WITGEDS
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/rounded_button.dart';

class WelComePage extends StatelessWidget {
  const WelComePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/inicio.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ), // BackdropFilter
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: headerText(
                      texto: 'DELIVERI FAST\n FOOD TO YOUR\n DOOR',
                      color: Colors.white,
                      fontSize: 45.0) //ESTE ES EL FontSize
                  ),

              /*
            Text('DELIVERED FAST FOOD TO YOUR DOOR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45.0,
                    )),
            */

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.symmetric(
                  horizontal: 80.0,
                  vertical: 30.0,
                ),
                child: const Text(
                    'Set exact location to find the right restaurants near you.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0,
                    )),
              ),

              createButton(
                  buttonColor: orange,
                  labelButton: 'Log in',
                  func: () {
                    Navigator.pushNamed(context, 'login');
                  }),
              createButton(
                labelButton: 'Connect with Faceboock',
                buttonColor: fbButtonColor,
                isWithIcon: true,
                icon: const AssetImage('assets/images/facebook.png'),
                // ignore: avoid_print
                func: () => print("goToFaceboock"),
              )
              //AQUI VA EL BOTON AZUL
            ],
          ),
        ],
      ),
    );
  }
}
