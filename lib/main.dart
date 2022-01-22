import 'package:bloc_exercises/business_logic/cubit/counter_cubit.dart';
import 'package:bloc_exercises/business_logic/cubit/internet_cubit.dart';
import 'package:bloc_exercises/presentation/router/app_router.dart';
import 'package:bloc_exercises/presentation/screen/home_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<InternetCubit>(
            create: (context) => InternetCubit(connectivity: Connectivity()),
          ),
          BlocProvider<CounterCubit>(
            create: (context) => CounterCubit(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: _appRouter.onGenerateRoute,
        ));
    // return BlocProvider<CounterCubit>(
    //   create: (context) => CounterCubit(),
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     onGenerateRoute: _appRouter.onGenerateRoute,
    //     // home: BlocProvider<CounterCubit>(
    //     //   create: (context) => CounterCubit(),
    //     //   child: const MyHomePage(title: 'Flutter Demo Home Page'),
    //     // ),
    //   ),
    // );
  }

// Note: If we provide counter cubit globally , it automatically dispose cubit instance
  // @override
  // void dispose() {
  //   _appRouter.dispose();
  // }
}

// Github link for bloc code :  https://github.com/TheWCKD/blocFromZeroToHero
