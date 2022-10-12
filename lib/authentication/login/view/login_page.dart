import 'package:authentication_repository/authentication_repository.dart';
import 'package:counterapp_cubit/authentication/login/view/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

// RepositoryProvider
// is a Flutter widget which provides a repository to its children via RepositoryProvider.of<T>(context).
// It is used as a dependency injection (DI) widget so that a single instance of a repository can be provided to multiple widgets within a subtree.
// BlocProvider should be used to provide blocs whereas RepositoryProvider should only be used for repositories.
// * then from ChildA we can retrieve the Repository instance with:
// with    extensions  >>>>   context.read<RepositoryA>();
// without extensions  >>>>   RepositoryProvider.of<RepositoryA>(context)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: const LoginForm(),
        ),
      ),
    );
  }
}
