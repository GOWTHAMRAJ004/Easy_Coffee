import 'package:easy_coffee/services/auth.dart';
import 'package:easy_coffee/shared/Loading.dart';
import 'package:easy_coffee/shared/shared_code.dart';
import 'package:flutter/material.dart';

class sign_in extends StatefulWidget {
  final Function toggleview;
  sign_in({required this.toggleview});

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  // creating a variable to store a email
  String Email = '';
  // creating a variable to store a password
  String password = '';
  // creating an error value to show on the screen
  String error = '';
  //initially it is false when we clikc the button of sign in
  //if the data is entered correctly then it is true
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
              elevation: 0.0,
              title: Text('sign to brew crew'),
              actions: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      widget.toggleview();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Register'))
              ],
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
                      validator: (val) =>
                          val!.length < 6 ? 'Enter the password' : null,
                      //obscure text used to hide the password
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
                              .signInWithEmailAndPassword(Email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'Could not have credintial';
                            });
                          }
                        }
                        //print(password);
                        //print(Email);
                      },
                      child: Text(
                        'Sign in ',
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
