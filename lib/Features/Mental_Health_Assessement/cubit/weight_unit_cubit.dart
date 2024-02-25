import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightUnitCubit extends Cubit<Alignment> {
  WeightUnitCubit() : super(Alignment.centerLeft);

  void selectWeight(int index) {
    emit(index == 0 ? Alignment.centerLeft : Alignment.centerRight);
  }


}
