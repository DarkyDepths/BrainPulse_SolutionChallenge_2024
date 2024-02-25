import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class ProgressCubit extends Cubit<int> {
  ProgressCubit() : super(0);
  void startProgress() {
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (state < 100) {
        emit(state + 1);
      } else {
        timer.cancel();
      }
    });
  }
}
