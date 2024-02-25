import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class WeightController extends Cubit<double> {
  final PageController pageController = PageController(viewportFraction: 1/23,initialPage: 300);

  WeightController() : super(60);

  void setPage(double index) {
    // pageController.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.linear,
    // );
    if (index >= 0) emit(index);
  }

  void goToPage(double index){
      pageController.animateToPage(
      (index*5).toInt(),
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    if (index >= 0) emit(index);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
