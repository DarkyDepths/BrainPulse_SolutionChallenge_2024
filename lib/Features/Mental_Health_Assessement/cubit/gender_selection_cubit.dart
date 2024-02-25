import 'package:bloc/bloc.dart';

class GenderSelectionCubit extends Cubit<int?> {
  GenderSelectionCubit() : super(null);

  void selectGender(int index) {
    emit(index);
  }

  @override
  void onChange(Change<int?> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
