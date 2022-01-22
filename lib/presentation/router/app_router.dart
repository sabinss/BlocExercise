import 'package:bloc_exercises/business_logic/cubit/counter_cubit.dart';
import 'package:bloc_exercises/presentation/screen/home_screen.dart';
import 'package:bloc_exercises/presentation/screen/second_screen.dart';
import 'package:bloc_exercises/presentation/screen/third_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  //1st way:
  //here we are manually providing instance of counter cubit to individual screen
  // Route onGenerateRoute(RouteSettings routeSetting) {
  //   switch (routeSetting.name) {
  //     case '/':
  //       return MaterialPageRoute(
  //         builder: (_) => BlocProvider.value(
  //             value: _counterCubit, child: MyHomePage(title: 'Home Page')),
  //       );
  //       break;
  //     case '/second':
  //       return MaterialPageRoute(
  //           builder: (_) => BlocProvider.value(
  //                 value: _counterCubit,
  //                 child: SecondScreen(),
  //               ));
  //       break;
  //     case '/third':
  //       return MaterialPageRoute(
  //           builder: (_) => BlocProvider.value(
  //                 value: _counterCubit,
  //                 child: ThirdScreen(),
  //               ));
  //     default:
  //       return _errorRoute();
  //   }
  // }

  // 2nd way Giving Global access of Cubit state to all the screens
  Route onGenerateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MyHomePage(title: 'Home Page'),
        );
        break;
      case '/second':
        return MaterialPageRoute(builder: (_) => SecondScreen());
        break;
      case '/third':
        return MaterialPageRoute(builder: (_) => ThirdScreen());
      default:
        return _errorRoute();
    }
  }

  // void dispose() {
  //   _counterCubit.close();
  // }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
        appBar: AppBar(title: Text('Error'), centerTitle: true),
        body: Center(
          child: Text('Page Not found'),
        ));
  });
}
