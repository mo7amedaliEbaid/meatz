
class AuthFailure {
  final String message;

  const AuthFailure._(this.message);

  static const AuthFailure serverError = AuthFailure._('Server Error');
  static const AuthFailure emailAlreadyInUse = AuthFailure._('Email already in use');
  static const AuthFailure invalidEmailAndPasswordCombination = AuthFailure._('Invalid email and password combination');

  String map({
    required String serverError,
    required String  emailAlreadyInUse,
    required String  invalidEmailAndPasswordCombination,
  }) {
    if (this == AuthFailure.serverError) {
      return serverError;
    } else if (this == AuthFailure.emailAlreadyInUse) {
      return emailAlreadyInUse;
    } else if (this == AuthFailure.invalidEmailAndPasswordCombination) {
      return invalidEmailAndPasswordCombination;
    } else {
      throw UnimplementedError();
    }
  }
}


