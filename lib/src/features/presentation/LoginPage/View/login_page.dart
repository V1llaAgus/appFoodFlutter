import 'package:flutter/material.dart';
//UI
import 'package:flutter/services.dart';
import 'package:foodapp/src/Base/Views/base_view.dart';

//colors
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/LoginPage/VielModel/login_viewmodel.dart';
import 'package:foodapp/src/features/presentation/StateProviders/loading_stateprovider.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/rounded_button.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/TextFormFields/customtext_fotmfield.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

import 'package:provider/provider.dart';

//witgets

class LoginPage extends StatelessWidget with BaseView {
  final LoginVielModel _vielModel;

  LoginPage({Key? key, LoginVielModel? vielModel})
      : _vielModel = vielModel ?? DefaultLoginViewModel(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //Inicializa viewmodel
    _vielModel.initState(
        loadingState: Provider.of<LoadingStateProvider>(context));

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));

    return _vielModel.loadingStatusState.isLoading
        ? loadingView
        : Scaffold(
            body: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Column(
                  children: [
                    Stack(
                      children: [
                        const Image(
                            width: double.infinity,
                            height: 350.0,
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/inicio.jpg")),
                        Container(
                            margin: const EdgeInsets.only(top: 50.0),
                            child: backButton(context, Colors.white))
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(0.0, -20.0),
                      child: Container(
                        width: double.infinity,
                        height: 500,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                              child: Form(
                            key: _vielModel.formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                const Text("Welcome Back",
                                    style: TextStyle(
                                        color: accentColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0)),
                                const Text("Login to you account",
                                    style: TextStyle(
                                        color: bgInputs,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.0)),
                                CustomTextFormField(
                                    delegate: _vielModel,
                                    textFormFieldType:
                                        CustomTextFormFieldType.email,
                                    hintext: 'Email'),
                                CustomTextFormField(
                                    delegate: _vielModel,
                                    textFormFieldType:
                                        CustomTextFormFieldType.password,
                                    hintext: 'Password'),
                                createButton(
                                    buttonColor: orange,
                                    labelButton: 'Log in',
                                    func: () {
                                      ctaButtonTapped(context);
                                    }),
                                Container(
                                  margin: const EdgeInsets.only(top: 30.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, 'forgot-password');
                                    },
                                    child: const Text(
                                      "Forgot you password",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Don't have an account ",
                                          style: TextStyle(
                                              color: bgInputs,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0)),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, 'sing-up');
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: const Text('Sign up',
                                              style: TextStyle(
                                                  color: orange,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ]))
            ],
          ));
  }
}

extension UserAction on LoginPage {
  void ctaButtonTapped(BuildContext context) {
    if (_vielModel.isFormValidate()) {
      _vielModel
          .login(
              email: _vielModel.loginModel?.email ?? "",
              password: _vielModel.loginModel?.password ?? "")
          .then((result) {
        switch (result.status) {
          case ResultStatus.success:
            Navigator.pushNamed(context, 'tabs');

            break;
          case ResultStatus.error:
            if (result.error != null) {
              errorStateProdiver.setFailure(
                  context: context, value: result.error!);
            }
            break;
        }
      });
    }
  }
}
