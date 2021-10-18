import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:data_app/Credentials-Page/signup-page.dart';
import 'package:data_app/Screen/home/home-screen.dart';
import 'package:data_app/hex-color/Hex_color.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color _color = HexColor("#243642");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool HiddenPassword = true;

  String? validatepass(value) {
    if (value.isEmpty) {
      return 'Requried';
    } else {
      return null;
    }
  }

  void validator() {
    print(emailController.text);
    print(passwordController.text);
    if (formKey.currentState!.validate()) {
      print(emailController.text + passwordController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                // name: emailController.text,
                )),
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text('Invalid'),
                content: Text('Email or Password is wrong'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ));
    }
  }

  late StreamSubscription sub;
  bool isConnected = false;
  @override
  void initState() {
    super.initState();
    sub = Connectivity().onConnectivityChanged.listen((event) {
      setState(() {
        isConnected = (event != ConnectivityResult.none);
      });
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Connectivity().checkConnectivity();
    return Scaffold(
      backgroundColor: _color,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width / 13,
                  left: MediaQuery.of(context).size.width / 15,
                ),
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        MediaQuery.of(context).size.width * 0.2),
                    bottomRight: Radius.circular(
                        MediaQuery.of(context).size.width * 0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Data',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      'Please Login TO Continue',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 12,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      child: Form(
                        key: formKey,
                        // autovalidate: true,.
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.white),
                              controller: emailController,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/icons/gmail.png',
                                    fit: BoxFit.fill,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Enter your Email',
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                errorStyle: TextStyle(color: Colors.white),
                              ),
                              validator: MultiValidator([
                                RequiredValidator(
                                  errorText: 'Required',
                                ),
                                EmailValidator(
                                  errorText: 'Enter valid Email',
                                ),
                              ]),
                              onChanged: (value) {
                                emailController.text;
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 12,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: passwordController,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/icons/password.png',
                                    fit: BoxFit.fill,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                labelText: 'Password',
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      HiddenPassword = !HiddenPassword;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/icons/69-eye-outline.gif',
                                      fit: BoxFit.fill,
                                      width: 30,
                                      height: 40,
                                    ),
                                  ),
                                ),
                                hintText: 'Enter your Password',
                                labelStyle: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                errorStyle: TextStyle(color: Colors.white),
                              ),
                              validator: validatepass,
                              obscureText: HiddenPassword,
                              onChanged: (value) {
                                passwordController.text;
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: 250,
                              height: 60,
                              child: RaisedButton(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                onPressed: validator,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 36,
                                  ),
                                ),
                                splashColor: Colors.amberAccent,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      overlayColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.red),
                                    ),
                                    onPressed: () {
                                      print('pressed');
                                    },
                                    child: Text(
                                      'FORGOT PASSWORD ?',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 80),
                    ),
                    Center(
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 35),
                      child: Center(
                        child: Container(
                          width: 250,
                          height: 60,
                          child: RaisedButton(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()),
                              );
                            },
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 36,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
