import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:loginpage/login_done.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final titleControl = TextEditingController();

  final amountControl = TextEditingController();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final TextEditingController emailController = new TextEditingController();
    final TextEditingController passwordController =
        new TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFFee9ca7),
      appBar: AppBar(
        backgroundColor: Color(0xFFee9ca7),
        title: Text('Login'),
      ),
      body: Center(
        child: Container(
          height: 350,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Color(0xFFee9ca7),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'EMAIL'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(labelText: 'PASSWORD'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      color: Color(0xFFee9ca7),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 5, bottom: 5),
                        child: FlatButton(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              _validation(emailController.text,
                                  passwordController.text);
                            }),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _validation(String emails, String passwords) async {
    Map<String, String> headers = {};
    Response response = await post('http://multi.capcee.com/api/login',
        headers: headers, body: {'email': emails, 'password': passwords});
    print('Response status: ${response.statusCode}');
    print(response.body);
    Map<String, dynamic> responseJson = jsonDecode(response.body);
    String respons = responseJson['message'].toString();

    if (respons == 'true') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login(respons)));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login(respons)));
    }
  }
}
