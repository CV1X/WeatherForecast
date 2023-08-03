part of 'auth_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final User firebaseUser;

  AuthenticationSuccess(this.firebaseUser);
  @override
  // TODO: implement props
  List<Object?> get props => [firebaseUser];
}

class AuthenticationFailure extends AuthenticationState {}
