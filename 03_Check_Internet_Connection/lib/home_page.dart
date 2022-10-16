import 'package:check_connection/internet_bloc/internet_bloc.dart';
//import 'package:check_connection/internet_cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  /// with BLoC
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Connection"),
      ),
      body: BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is NotConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is ConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ConnectedState) {
            return _buildText(state.message);
          } else if (state is NotConnectedState) {
            return _buildText(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }

  /// with Cubit
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Check Connection"),
  //     ),
  //     body: BlocConsumer<InternetCubit, InternetState>(
  //       listener: (context, state) {
  //         if (state is NotConnectedState) {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(
  //               content: Text(state.message),
  //               backgroundColor: Colors.red,
  //             ),
  //           );
  //         }
  //       },
  //       builder: (context, state) {
  //         if (state is ConnectedState) {
  //           return _buildText(state.message);
  //         } else if (state is NotConnectedState) {
  //           return _buildText(state.message);
  //         }
  //         return const SizedBox();
  //       },
  //     ),
  //   );
  // }

  Widget _buildText(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(fontSize: 40),
      ),
    );
  }
}
