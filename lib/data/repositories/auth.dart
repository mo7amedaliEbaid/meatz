import 'package:meatz/domain/entities/user.dart' as DomainUser;
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositories/auth.dart';
import '../data_sources/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<DomainUser.User?> signInWithEmailAndPassword(String email, String password) async {
    User? user = await remoteDataSource.signInWithEmailAndPassword(email, password);
    return user != null ? DomainUser.User(uid: user.uid, email: user.email) : null;
  }

  @override
  Future<DomainUser.User?> registerWithEmailAndPassword(String email, String password) async {
    User? user = await remoteDataSource.registerWithEmailAndPassword(email, password);
    return user != null ? DomainUser.User(uid: user.uid, email: user.email) : null;
  }

  @override
  Future<DomainUser.User?> signInWithGoogle() async {
    User? user = await remoteDataSource.signInWithGoogle();
    return user != null ? DomainUser.User(uid: user.uid, email: user.email) : null;
  }

  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();
  }

  @override
  Stream<DomainUser.User?> get authStateChanges => remoteDataSource.authStateChanges.map(
        (user) => user != null ? DomainUser.User(uid: user.uid, email: user.email) : null,
  );
}
