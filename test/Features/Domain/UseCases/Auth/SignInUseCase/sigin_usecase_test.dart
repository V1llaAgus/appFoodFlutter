import 'package:flutter_test/flutter_test.dart';
import 'package:foodapp/src/Base/ApiService/app_error.dart';
import 'package:foodapp/src/Base/Constants/error_message.dart';
import 'package:foodapp/src/Services/FirebasseServices/AutFirebaseServices/Decodables/out_error_decodable.dart';
import 'package:foodapp/src/features/Domain/Entities/Auth/SignInEntity/signin_entity.dart';
import 'package:foodapp/src/features/Domain/UseCases/Auth/SignInUseCase/signin_usecase.dart';
import 'package:foodapp/src/features/Domain/UseCases/Auth/SignInUseCase/signin_usecase_bodyparameters.dart';
import 'package:foodapp/src/utils/Helpers/ResultType/result_type.dart';

abstract class _Constants {
  static String correctEmail = "cane1@gmail.com";
  static String correctPass = "12345678";
  //correct password = 12345
  static String wrongEmail = "cane@gmail.com";
  static String wrongPass = "123456789";
}

void main() {
  // GIVEN
  final SignInUseCase sut = DefaultSignInUseCase();

  // Test correct response to SignInUseCase
  group('Test correct response to SignInUseCase', () {
    // Test correct signIn feature with correct email and password
    test('Test correct signIn feature with correct email and password',
        () async {
      // GIVEN
      final SignInUseCaseParameters signInBodyParams = SignInUseCaseParameters(
          email: _Constants.correctEmail, password: _Constants.correctPass);

      // WHEN
      var result = await sut.execute(params: signInBodyParams);

      switch (result.status) {
        case ResultStatus.success:
          // THEN
          expect(result.value, isA<SignInEntity>());
          break;
        case ResultStatus.error:
          // THEN
          expect(result.error, isA<Failure>());
          break;
      }
    });
  });

  group('Test failure response to SignInUseCase', () {
    test('Test failure response to SignInUseCase', () async {
      // GIVEN
      final SignInUseCaseParameters params = SignInUseCaseParameters(
          email: _Constants.wrongEmail, password: _Constants.wrongPass);

      try {
        final _ = await sut.execute(params: params);
      } on Failure catch (f) {
        AuthErrorDecodable error = f as AuthErrorDecodable;

        //THEN
        expect(error.error!.message, FBFailureMessages.emailNotFoundMessage);
      }
    });

    test('Test failure response to SignInUseCase with wrong password',
        () async {
      // GIVEN
      final SignInUseCaseParameters params = SignInUseCaseParameters(
          email: _Constants.correctEmail, password: _Constants.wrongPass);

      try {
        final _ = await sut.execute(params: params);
      } on Failure catch (f) {
        AuthErrorDecodable error = f as AuthErrorDecodable;

        //THEN
        expect(error.error!.message, FBFailureMessages.invalidPasswordMessage);
      }
    });

    //AÑADE MAS TEST ;
  });
}
