import 'package:check_connection/internet_bloc/internet_bloc.dart';
//import 'package:check_connection/internet_cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// with BLoC
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InternetBloc>(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        title: 'Check Connection',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }

  /// with Cubit
  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => InternetCubit()..checkConnection(),
  //     child: const MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: HomePage(),
  //     ),
  //   );
  // }
}
