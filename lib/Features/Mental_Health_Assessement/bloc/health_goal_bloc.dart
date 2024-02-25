import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'health_goal_event.dart';
part 'health_goal_state.dart';

class HealthGoalBloc extends Bloc<HealthGoalEvent, HealthGoalState> {
  HealthGoalBloc()
      : super(HealthGoalState(selectedGoals: List.filled(5, false))) {
    on<ToggleSelectionEvent>((event, emit) {
      final newSelectedGoals = List<bool>.from(state.selectedGoals);

      newSelectedGoals[event.goalIndex] =
          !(state.selectedGoals[event.goalIndex]);
      emit(HealthGoalState(selectedGoals: newSelectedGoals));
    });
  }

  @override
  void onChange(Change<HealthGoalState> change) {
    // TODO: implement onChange
    super.onChange(change);
     print('Current State: ${change.currentState.selectedGoals}');
  print('Next State: ${change.nextState.selectedGoals}');
  }
}
