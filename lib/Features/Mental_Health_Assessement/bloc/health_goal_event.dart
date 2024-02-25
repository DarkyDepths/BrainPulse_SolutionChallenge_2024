part of 'health_goal_bloc.dart';

@immutable
sealed class HealthGoalEvent {}

class ToggleSelectionEvent extends HealthGoalEvent {
  final int goalIndex;

  ToggleSelectionEvent(this.goalIndex);
}
