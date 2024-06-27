import 'package:easy_coffee/services/auth.dart';
import 'package:easy_coffee/shared/Loading.dart';
import 'package:easy_coffee/shared/shared_code.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register({required this.toggleview});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // creating a variable to store a email
  String Email = '';
  // creating a variable to store a password
  String password = '';
  // creating an error value to show on the screen
  String error = '';
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[700],
              actions: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      widget.toggleview();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Sign in'))
              ],
              elevation: 0.0,
              title: Text('sign to brew crew'),
            ),
            body: Container(
              padding: EdgeInsetsDirectional.symmetric(
                  vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textdecoratorinput.copyWith(hintText: 'Email'),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter your name' : null,
                      onChanged: (val) {
                        setState(() => Email = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textdecoratorinput.copyWith(hintText: 'password'),
                      //obscure text used to hide the password
                      validator: (val) =>
                          val!.length < 6 ? 'Enter the password' : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // it will check wheather the user entered or note
                        // it will say true or false
                        if (_formkey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(Email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'please give a valid id';
                            });
                          }
                        }
                      },
                      child: Text(
                        ' Register ',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                    ),
                    SizedBox(
                      height: 20.0,
                      child: Text(
                        error,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
