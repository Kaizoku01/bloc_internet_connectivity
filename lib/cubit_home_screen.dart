//import 'package:bloc_internet_connectivity/internet_bloc/InternetBloc.dart';
//import 'package:bloc_internet_connectivity/internet_bloc/InternetStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_cubit/internet_cubit.dart';

class CubitHomeScreen extends StatelessWidget {
  const CubitHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connectivity'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state == InternetState.gained) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Connected"),
                  backgroundColor: Colors.green,
                ));
              } else if (state == InternetState.lost) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Not Connected"),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state == InternetState.gained) {
                return const Text(
                  'Connected!',
                  style: TextStyle(fontSize: 25),
                );
              } else if (state == InternetState.lost) {
                return const Text(
                  'Not Connected!',
                  style: TextStyle(fontSize: 25),
                );
              } else {
                return const Text(
                  'Loading...',
                  style: TextStyle(fontSize: 25),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

