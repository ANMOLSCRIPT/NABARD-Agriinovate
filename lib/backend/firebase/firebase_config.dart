import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDjbje1qYLIENkELDqaVe3tmQ5BYqW36ro",
            authDomain: "agriinovate-u39znz.firebaseapp.com",
            projectId: "agriinovate-u39znz",
            storageBucket: "agriinovate-u39znz.appspot.com",
            messagingSenderId: "643435716266",
            appId: "1:643435716266:web:368b917719225613eebad3"));
  } else {
    await Firebase.initializeApp();
  }
}
