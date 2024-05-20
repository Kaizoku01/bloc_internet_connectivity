import 'package:bloc_internet_connectivity/internet_bloc/InternetBloc.dart';
import 'package:bloc_internet_connectivity/internet_bloc/InternetStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHomeScreen extends StatelessWidget {
  const BlocHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connectivity'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Connected"),
                  backgroundColor: Colors.green,
                ));
              } else if (state is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Internet Not Connected"),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state is InternetGainedState) {
                return const Text(
                  'Connected!',
                  style: TextStyle(fontSize: 25),
                );
              } else if (state is InternetLostState) {
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

//! BlocBuilder : Code
// BlocBuilder<InternetBloc, InternetState>(
// builder: (context, state) {
// if (state is InternetGainedState) {
// return Text(
// 'Connected!',
// style: TextStyle(fontSize: 25),
// );
// } else if (state is InternetLostState) {
// return Text(
// 'Not Connected!',
// style: TextStyle(fontSize: 25),
// );
// } else {
// return Text(
// 'Loading...',
// style: TextStyle(fontSize: 25),
// );
// }
// }),
