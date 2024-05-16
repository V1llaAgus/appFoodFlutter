import 'package:flutter_test/flutter_test.dart';
import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Base/Constants/error_message.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Decodables/out_error_decodable.dart';
import 'package:foodapp/src/features/Domain/Entities/Auth/SignUpEntity/signupentity.dart';
import 'package:foodapp/src/features/Domain/UseCases/Auth/SignUpUseCase/signup_use_caseparameters.dart';
import 'package:foodapp/src/features/Domain/UseCases/Auth/SignUpUseCase/signup_usecase.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

abstract class _Constants {
  static String correctEmail = "cane2@gmail.com";
  static String correctPass = "123456";
  static String wrongEmail = "cane21@gmail.com";
  static String wrongPass = "123456";
}

void main() {
  //GIVEN
  SignUpUseCase sut = DefaultSignUpUseCase();

  group('Test success SignUp user in Firebase', () {
    test('Test succes SignUp user in Firebase ', () async {
      final SignUpUseCaseParameters params = SignUpUseCaseParameters(
          email: _Constants.correctEmail,
          password: _Constants.correctPass,
          username: 'cane 2',
          date: '29/10/2001',
          phone: '123456');

      //WHEN (CUANDO PASE ALGO)
      final result = await sut.execute(params: params);

      switch (result.status) {
        case ResultStatus.success:
          //THEN
          expect(result.value, isA<SignUpEntity>());
          break;
        case ResultStatus.error:
          //THEN
          expect(result.error, Failure);
          break;
      }
    });
  });

  group('Test failure SignUp in Firebase', () {
    test('Test failure SignUp in Firebase', () async {
      try {
        //WHEN

        final SignUpUseCaseParameters params = SignUpUseCaseParameters(
            email: _Constants.wrongEmail,
            password: _Constants.wrongPass,
            username: 'cane 2',
            date: '29/10/2001',
            phone: '123456');

        final _ = await sut.execute(params: params);
      } on Failure catch (f) {
        //THEN

        AuthErrorDecodable error = f as AuthErrorDecodable;
        expect(error.error!.message, FBFailureMessages.emailExistMessage);
      }
    });

    //AÑADOR MAS TEST;)
  });
}
