import 'package:bloc_internet_connectivity/cubit_home_screen.dart';
import 'package:bloc_internet_connectivity/internet_bloc/InternetBloc.dart';
import 'package:bloc_internet_connectivity/internet_cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => InternetCubit(), //InternetBloc() also here
      child: MaterialApp(
        home: CubitHomeScreen(),
      ),
    );
  }
}
