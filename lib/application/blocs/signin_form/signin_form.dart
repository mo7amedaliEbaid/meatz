// sign_in_form_event.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/i_auth_facade.dart';
import '../../../domain/auth/value_objects.dart';

abstract class SignInFormEvent {}

class EmailChanged extends SignInFormEvent {
  final String emailStr;

  EmailChanged(this.emailStr);
}

class PasswordChanged extends SignInFormEvent {
  final String passwordStr;

  PasswordChanged(this.passwordStr);
}

class RegisterWithEmailAndPasswordPressed extends SignInFormEvent {}

class SignInWithEmailAndPasswordPressed extends SignInFormEvent {}

class SignInWithGooglePressed extends SignInFormEvent {}

class SignInFormState {
  final EmailAddress emailAddress;
  final Password password;
  final bool showErrorMessages;
  final bool isSubmitting;
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  SignInFormState({
    required this.emailAddress,
    required this.password,
    required this.showErrorMessages,
    required this.isSubmitting,
    required this.authFailureOrSuccessOption,
  });

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );

  SignInFormState copyWith({
    EmailAddress? emailAddress,
    Password? password,
    bool? showErrorMessages,
    bool? isSubmitting,
    Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption,
  }) {
    return SignInFormState(
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      showErrorMessages: showErrorMessages ?? this.showErrorMessages,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      authFailureOrSuccessOption:
          authFailureOrSuccessOption ?? this.authFailureOrSuccessOption,
    );
  }
}

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
        emailAddress: EmailAddress(event.emailStr),
        authFailureOrSuccessOption: none(),
      ));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: Password(event.passwordStr),
        authFailureOrSuccessOption: none(),
      ));
    });

    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      Either<AuthFailure, Unit>? failureOrSuccess;

      final isEmailValid = state.emailAddress.isValid();
      final isPasswordValid = state.password.isValid();

      if (isEmailValid && isPasswordValid) {
        emit(state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ));

        failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
          emailAddress: state.emailAddress,
          password: state.password,
        );
      }

      emit(state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });

    on<SignInWithEmailAndPasswordPressed>((event, emit) async {
      Either<AuthFailure, Unit>? failureOrSuccess;

      final isEmailValid = state.emailAddress.isValid();
      final isPasswordValid = state.password.isValid();

      if (isEmailValid && isPasswordValid) {
        emit(state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ));

        failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
          emailAddress: state.emailAddress,
          password: state.password,
        );
      }

      emit(state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });

    on<SignInWithGooglePressed>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      final failureOrSuccess = await _authFacade.signInWithGoogle();

      emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });
  }
}
