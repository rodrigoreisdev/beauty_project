import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ProjetoBelezaFirebaseUser {
  ProjetoBelezaFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ProjetoBelezaFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ProjetoBelezaFirebaseUser> projetoBelezaFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ProjetoBelezaFirebaseUser>(
            (user) => currentUser = ProjetoBelezaFirebaseUser(user));
