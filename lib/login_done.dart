import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  String result;
  Login(this.result);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            color: Colors.lightBlue,
            padding: EdgeInsets.all(50),
            child: Text(
              result,
              style: TextStyle(fontSize: 45),
            ),
          ),
        ),
      ),
    );
  }
}
