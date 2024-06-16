import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/use_case/auth.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmailAndPassword signInWithEmailAndPassword;
  final RegisterWithEmailAndPassword registerWithEmailAndPassword;
  final SignInWithGoogle signInWithGoogle;
  final SignOut signOut;
  final GetAuthStateChanges getAuthStateChanges;

  AuthBloc({
    required this.signInWithEmailAndPassword,
    required this.registerWithEmailAndPassword,
    required this.signInWithGoogle,
    required this.signOut,
    required this.getAuthStateChanges,
  }) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInEvent) {
        emit(AuthLoading());
        try {
          final user = await signInWithEmailAndPassword(event.email, event.password);
          emit(AuthAuthenticated(user));
        } catch (_) {
          emit(const AuthError("Sign In Failed"));
        }
      } else if (event is RegisterEvent) {
        emit(AuthLoading());
        try {
          final user = await registerWithEmailAndPassword(event.email, event.password);
          emit(AuthAuthenticated(user));
        } catch (_) {
          emit(const AuthError("Registration Failed"));
        }
      } else if (event is GoogleSignInEvent) {
        emit(AuthLoading());
        try {
          final user = await signInWithGoogle();
          emit(AuthAuthenticated(user));
        } catch (_) {
          emit(const AuthError("Google Sign In Failed"));
        }
      } else if (event is SignOutEvent) {
        emit(AuthLoading());
        try {
          await signOut();
          emit(AuthUnauthenticated());
        } catch (_) {
          emit(const AuthError("Sign Out Failed"));
        }
      } else if (event is AuthStateChangedEvent) {
        await emit.forEach<User?>(
          getAuthStateChanges(),
          onData: (user) => user != null ? AuthAuthenticated(user) : AuthUnauthenticated(),
        );
      }
    });
  }
}
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;

  const RegisterEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class GoogleSignInEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}

class AuthStateChangedEvent extends AuthEvent {}

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User? user;

  const AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}