import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class EmojiController extends Cubit<int> {
  final PageController pageController =
      PageController(viewportFraction: 0.25, initialPage: 100);

  EmojiController() : super(60);

  void setEmogi(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    emit(index);
  }

  void goToEmoji(int index) {
    pageController.jumpToPage(index.toInt());
    if (index >= 0) emit(index);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
