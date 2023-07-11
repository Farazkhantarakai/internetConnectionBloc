import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_bloc/bloc/internetbloc.dart';
import 'package:internet_bloc/bloc/internetstate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocConsumer<InternetBloc, InternetState>(builder: (context, state) {
        if (state is InternetGainedState) {
          return const Center(child: Text('Connected'));
        } else if (state is InternetLostState) {
          return const Center(
            child: Text('Disconnected'),
          );
        } else {
          return const Center(
            child: Text('Loading'),
          );
        }
      }, listener: (context, state) {
        if (state is InternetGainedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Internet Conected')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Internet Disconnected')));
        }
      }),
    );
  }
}
