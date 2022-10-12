// The LoginState will contain the status of the form as well as the username and password input states.
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../models/password.dart';
import '../models/username.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });
  final FormzStatus status; //aims to simplify form representation and validation in a generic way.
  final Username username;
  final Password password;

  LoginState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
