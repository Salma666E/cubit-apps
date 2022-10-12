import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

// AuthenticationStatusChanged: notifies the bloc of a change to the user's AuthenticationStatus
class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);
  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

// AuthenticationLogoutRequested: notifies the bloc of a logout request
class AuthenticationLogoutRequested extends AuthenticationEvent {}
