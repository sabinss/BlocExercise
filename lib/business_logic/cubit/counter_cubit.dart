import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_exercises/business_logic/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // final InternetCubit internetCubit;
  // late StreamSubscription internetStreamSubscription;
  // CounterCubit({required this.internetCubit}) : super(CounterState(counterValue: 0));
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));
//   StreamSubscription monitorInternet(){
//       internetStreamSubscription = internetCubit.listen((internetState)){
// if(internetState is InternetConnected && internetState.connectionType==ConnectionType.Wifi){
//   incremet();
// }else if(internetState is InternetDisconnected && internetState.connectionType==ConnectionType.Mobile ){
// increment();
// }else if(internetState is InternetDisconnected){
//   decrement();
// }
//     };
//   }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  void onChange(Change<CounterState> change) {
    // TODO: implement onChange
    print(change);
    super.onChange(change);
  }
}
