import 'package:counter_with_bloc/bloc/counter_bloc.dart';
import 'package:counter_with_bloc/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter App with BLoC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Counter value is: ",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return const Text("0",
                      style: TextStyle(
                        fontSize: 30,
                      ));
                } else if (state is CounterValueChangedState) {
                  return Text(state.counter.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                      ));
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: const ButtonWidget(),
    );
  }
}
