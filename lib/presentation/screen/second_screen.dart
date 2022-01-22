import 'package:bloc_exercises/business_logic/cubit/counter_cubit.dart';
import 'package:bloc_exercises/business_logic/cubit/internet_cubit.dart';
import 'package:bloc_exercises/constants/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetDisconnected) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Second screen'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Text(state.counterValue.toString());
                  },
                ),
                //we can use BlocListener when we want to perform some action on state change instead of building UI

                BlocBuilder<InternetCubit, InternetState>(
                    builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Wifi) {
                    return Column(
                      children: [
                        Text('WIFI'),
                        BlocBuilder<CounterCubit, CounterState>(
                          builder: (context, state) {
                            return Text(state.counterValue.toString());
                          },
                        )
                      ],
                    );
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.Mobile) {
                    return Column(
                      children: [
                        Text('Mobile'),
                        BlocBuilder<CounterCubit, CounterState>(
                          builder: (context, state) {
                            return Text(state.counterValue.toString());
                          },
                        )
                      ],
                    );
                  } else if (state is InternetDisconnected) {
                    return Text('Disconnected');
                  } else {
                    return Text('');
                  }
                }),
                Column(
                  children: [
                    Text('Updating UI based on multiple bloc state changes'),
                    Builder(
                      builder: (context) {
                        final counterState =
                            context.watch<CounterCubit>().state;
                        final internetState =
                            context.watch<InternetCubit>().state;

                        if (internetState is InternetConnected &&
                            internetState.connectionType ==
                                ConnectionType.Mobile) {
                          return Text(
                            'Counter: ' +
                                counterState.counterValue.toString() +
                                ' Internet: Mobile',
                            style: Theme.of(context).textTheme.headline6,
                          );
                        } else if (internetState is InternetConnected &&
                            internetState.connectionType ==
                                ConnectionType.Wifi) {
                          return Text(
                            'Counter: ' +
                                counterState.counterValue.toString() +
                                ' Internet: Wifi',
                            style: Theme.of(context).textTheme.headline6,
                          );
                        } else {
                          return Text(
                            'Counter: ' +
                                counterState.counterValue.toString() +
                                ' Internet: Disconnected',
                            style: Theme.of(context).textTheme.headline6,
                          );
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
