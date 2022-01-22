import 'package:bloc_exercises/business_logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //1st way to consume day
          // BlocBuilder<CounterCubit, CounterState>(
          //   builder: (context, state) {
          //     if (state.counterValue >= 0) {
          //       return Text(state.counterValue.toString());
          //     }
          //     return Text('');
          //   },
          // ),
          //2nd way to consume data
          BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
            if (state.counterValue >= 0) {
              return Text(state.counterValue.toString());
            }
            return Text('');
          }, listener: (context, state) {
            if (state.wasIncremented) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Incremented")));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("decremented")));
            }
          }),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: Text('${widget.title}'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} #2'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    // context.bloc<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          MaterialButton(
              child: Text('Go to second screen'),
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              })
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// Note:
// 1. Blockbuilder calls every time state is changed.
// 2. BlocListener only calls once over state change but not for initial state.
// 3. BlocConsumer is combination of both blocbuilder and bloclistener


// Scenario: Updating UI when specific state of BLoc changes
// 1st way

// BlocBuilder<CounterCubit,CounterState>(
//   buildWhen:(previousState,currentState)=>previousState.user.name!==currentState.user.name,
//   builder:(context,state)=>Text(state.user.name)
// )

// 2nd way
// Builder(
//   builder:(context){
//     final name = context.select(
//       (Counterbloc bloc)=>bloc.state.value
//     );
//     return Text('udate text')
//   }
// )


//Notes
// context.read is used to access the instnce of bloc  , but it doesnot rebuild the UI on state chnage
// contex.watch , context.select and BlocBuilder rebuilds the UI when state is Updatd