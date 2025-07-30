part of 'call_cubit.dart';

abstract class CallState {}

class CallInitial extends CallState {}

class CallLoading extends CallState {}

class CallJoined extends CallState {
  final Call call;
  CallJoined(this.call);
}

class CallError extends CallState {
  final String message;
  CallError(this.message);
}

class CallLeft extends CallState {}

