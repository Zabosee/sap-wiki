part of 'update_cubit.dart';

@immutable
abstract class UpdateState {}

class UpdateInitial extends UpdateState {}

class UpdateSuccess extends UpdateState {
  final List<UpdateModel> list;

  UpdateSuccess(this.list);
}

class UpdateError extends UpdateState {
  final String message;

  UpdateError(this.message);
}
