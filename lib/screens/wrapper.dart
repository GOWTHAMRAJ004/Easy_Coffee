import 'package:easy_coffee/home/home.dart';
import 'package:easy_coffee/modules/users.dart';
import 'package:easy_coffee/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<users?>(context);
    print(user);
    //it will going to return a home (or) authenticate it will work as a decission maker
    //retun either home or sign
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
