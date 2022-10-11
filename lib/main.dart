import 'package:counterapp_cubit/app.dart';
import 'package:counterapp_cubit/counter_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const CounterApp());
}