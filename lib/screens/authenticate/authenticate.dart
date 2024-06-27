import 'package:easy_coffee/screens/authenticate/Register.dart';
import 'package:easy_coffee/screens/authenticate/sign_In.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool ShowSignIn = true;
  void toggleView() {
    setState(() => ShowSignIn = !ShowSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (ShowSignIn) {
      return sign_in(toggleview: toggleView);
    } else {
      return Register(toggleview: toggleView);
    }
  }
}
