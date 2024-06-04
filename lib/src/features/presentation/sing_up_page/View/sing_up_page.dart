import 'package:flutter/material.dart';
import 'package:foodapp/src/Base/Views/base_view.dart';

//COLORES
import 'package:foodapp/src/colors/colors.dart';
import 'package:foodapp/src/features/presentation/StateProviders/loading_stateprovider.dart';

//Common Widgedt
import 'package:foodapp/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/headers_text.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/Headers/rounded_button.dart';
import 'package:foodapp/src/features/presentation/commons_widgets/TextFormFields/customtext_fotmfield.dart';
import 'package:foodapp/src/features/presentation/sing_up_page/VielModel/sign_up_viewmodel.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';
import 'package:provider/provider.dart';

class SingUpPage extends StatelessWidget with BaseView {
  //DEPENCENDIAS

  final SignUpViewModel _viewModel;

  // ignore: use_key_in_widget_constructors
  SingUpPage({SignUpViewModel? viewModel})
      : _viewModel = viewModel ?? DefaultSignUpViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.initState(
      loadingStateProvider: Provider.of<LoadingStateProvider>(context),
    );

    return _viewModel.loadingState.isLoading
        ? loadingView
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: Builder(builder: (BuildContext context) {
                return backButton(context, Colors.black);
              }),
            ),
            body: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Center(
                      child: Form(
                          key: _viewModel.formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: [
                                headerText(
                                    texto: 'Create am account',
                                    color: accentColor,
                                    fontSize: 30.0), // ESTE ES EL FontSize

                                const SizedBox(height: 20.0),

                                CustomTextFormField(
                                  textFormFieldType:
                                      CustomTextFormFieldType.username,
                                  hintext: 'Username',
                                  delegate: _viewModel,
                                ),
                                CustomTextFormField(
                                  textFormFieldType:
                                      CustomTextFormFieldType.email,
                                  hintext: 'Email',
                                  delegate: _viewModel,
                                ),
                                CustomTextFormField(
                                  textFormFieldType:
                                      CustomTextFormFieldType.phone,
                                  hintext: 'Phone',
                                  delegate: _viewModel,
                                ),
                                GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: AbsorbPointer(
                                    child: CustomTextFormField(
                                      textFormFieldType:
                                          CustomTextFormFieldType.dateOfBirth,
                                      hintext: 'Date of Birth',
                                      delegate: _viewModel,
                                      controller: _viewModel.dateController,
                                    ),
                                  ),
                                ),
                                CustomTextFormField(
                                  textFormFieldType:
                                      CustomTextFormFieldType.password,
                                  hintext: 'Password',
                                  delegate: _viewModel,
                                ),

                                createButton(
                                    buttonColor: orange,
                                    labelButton: 'Sign Up',
                                    func: () {
                                      _ctaTapped(context);
                                    }),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 40.0),
                                  child: const Text(
                                    'By clicking Sing up you agree to the following Terms and Condition without reservation',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.0),
                                  ),
                                )
                              ],
                            ),
                          )))
                ]))
              ],
            ));
  }
}

extension UserActions on SingUpPage {
  void _ctaTapped(BuildContext context) {
    if (_viewModel.isFormValidate()) {
      _viewModel.signUp().then((result) {
        switch (result.status) {
          case ResultStatus.success:
            Navigator.pushNamed(context, "login");
            break;
          case ResultStatus.error:
            errorStateProdiver.setFailure(
                context: context, value: result.error!);
            break;
        }
      });
    }
  }

  void _selectDate(BuildContext context) async {
    final SignUpViewModel viewModel =
        _viewModel; // Especificar el tipo de _viewModel
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate,
      firstDate: DateTime(1960, 1),
      lastDate: DateTime(2100),
      locale: const Locale('es', ''),
    );

    if (picked != null && picked != viewModel.selectedDate) {
      viewModel.signUpModel?.date =
          "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
      viewModel.dateController.text =
          "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
    }
  }
}
