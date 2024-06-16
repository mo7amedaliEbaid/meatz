

import '../entities/user.dart';
import '../repositories/auth.dart';

class SignInWithEmailAndPassword {
  final AuthRepository repository;

  SignInWithEmailAndPassword(this.repository);

  Future<User?> call(String email, String password) async {
    return await repository.signInWithEmailAndPassword(email, password);
  }
}

class RegisterWithEmailAndPassword {
  final AuthRepository repository;

  RegisterWithEmailAndPassword(this.repository);

  Future<User?> call(String email, String password) async {
    return await repository.registerWithEmailAndPassword(email, password);
  }
}

class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  Future<User?> call() async {
    return await repository.signInWithGoogle();
  }
}

class SignOut {
  final AuthRepository repository;

  SignOut(this.repository);

  Future<void> call() async {
    return await repository.signOut();
  }
}

class GetAuthStateChanges {
  final AuthRepository repository;

  GetAuthStateChanges(this.repository);

  Stream<User?> call() {
    return repository.authStateChanges;
  }
}
