import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class PageIndexCubit extends Cubit<int> {
  PageIndexCubit() : super(0);
  void goToNextPage() {
    emit(state+1);
  }
}