import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]) : super(properties);
}

//^what the fuck is this? How does it do it?

// General failures

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
