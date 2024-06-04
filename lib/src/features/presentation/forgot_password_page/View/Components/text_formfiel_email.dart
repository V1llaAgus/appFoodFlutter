import 'package:flutter/material.dart';
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/forgot_password_page/VielModel/forgot_password_viewmodel.dart';
import 'package:foodapp/src/utils/Helpers/Validators/form_validator.dart';

class TextFormFieldEmailUpdatePassword extends StatelessWidget {
  final ForgotPasswordViewModel viewModel;



  const TextFormFieldEmailUpdatePassword({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: bgInputs, borderRadius: BorderRadius.circular(40.0)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
        validator: (value) =>
            EmailFormValidator.validateEmail(email: value ?? ""),
        onChanged: (newvalue) => viewModel.email = newvalue,
      ),
    );
  }
}
