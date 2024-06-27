import 'package:easy_coffee/modules/users.dart';
import 'package:easy_coffee/screens/wrapper.dart';
import 'package:easy_coffee/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCmDQxrqvXOQEdFw9Jx2JU_AJvrJZ65ftk',
      appId: '1:357557181865:android:4175c65a0c46cd001438b8',
      messagingSenderId: '357557181865',
      projectId: 'easy-coffee-ddbbe',
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<users?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
