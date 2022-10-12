/* 
  * LoginUsernameChanged: notifies the bloc that the username has been modified.
  * LoginPasswordChanged: notifies the bloc that the password has been modified.
  * LoginSubmitted: notifies the bloc that the form has been submitted.
  */

import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);
  final String username;
  @override
  List<Object> get props => [username];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);
  final String password;
  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}
