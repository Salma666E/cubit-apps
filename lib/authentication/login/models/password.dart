import 'package:formz/formz.dart';

enum PasswordValidationError { empty }

//FormzInput aims to simplify form representation and validation in a generic way.

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : PasswordValidationError.empty;
  }
}
