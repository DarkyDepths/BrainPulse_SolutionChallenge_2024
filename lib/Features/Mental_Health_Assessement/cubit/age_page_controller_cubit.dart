import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AgePageControolerCubit extends Cubit<int> {
  final PageController pageController = PageController(viewportFraction: 0.22,initialPage: 18);

  AgePageControolerCubit() : super(18);

  void init(){
    pageController.jumpToPage(state);
  }

  void setPage(int index) {
    // pageController.animateToPage(
    //   index,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.linear,
    // );
    if (index >= 0) emit(index);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
