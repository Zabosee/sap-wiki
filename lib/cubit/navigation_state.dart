part of 'navigation_cubit.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationSuccess extends NavigationState {
  final List<NavigationModel> list;

  NavigationSuccess(this.list);
}

class NavigationError extends NavigationState {
  final String message;

  NavigationError(this.message);
}
