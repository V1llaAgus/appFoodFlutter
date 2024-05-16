import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Alerts/alert_dialog.dart';

//WIDGET
import 'package:foodapp/src/features/presentation/commons_widgets/BackButtons/back_button.dart';

import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/rounded_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return backButton(context, Colors.black);
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              headerText(
                  texto: 'Forgot password', color: accentColor, fontSize: 30.0),

              /*Text('Forgot password',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0))*/

              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                    'Pleace enter your email address. You will receive a link to create a new password via email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0)),
              ),
              _emailInput(),
              createButton(
                  buttonColor: orange,
                  labelButton: 'Send',
                  shape: const StadiumBorder(),
                  func: () => _showAlerta(context))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _emailInput() {
  return Container(
    margin: const EdgeInsets.only(top: 40.0),
    padding: const EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

void _showAlerta(BuildContext context) {
  showAlertDialog(
      context,
      const AssetImage('assets/images/lock.png'),
      'Your password has been reset',
      "You'll shortly receive an email with a code to setup a new password.",
      "Done",
      createButton(
          buttonColor: orange,
          labelButton: 'Done',
          func: () {
            Navigator.pushNamed(context, 'login');
          }));
}
