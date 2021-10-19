import 'package:data_app/Credentials-Page/login-page.dart';
import 'package:data_app/hex-color/Hex_color.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Color _color = HexColor("#243642");

  bool HiddenPassword = true;

  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? validatepass(value) {
    if (value.isEmpty) {
      return 'Requried';
    } else if (value.length < 8) {
      return 'should be atleast 8 charcaters';
    } else if (value.length > 18) {
      return 'Should be less than 18 charcaters';
    } else {
      return null;
    }
  }

  void signup() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('SuccessFully'),
          content: Text('Created the account'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: InkWell(
                child: Text(
                  'OK',
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (LoginPage()),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      print(
          userController.text + " "+ emailController.text + " "+passwordController.text);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Invalid'),
          content: Text('Please enter correct fields'),
          actions: <Widget>[
            TextButton(
              onPressed: closedDialog,
              child: Text(
                'OK',
              ),
            ),
          ],
        ),
      );
    }
  }

  void closedDialog() {
    Navigator.pop(context, 'OK');
    userController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(
        elevation: 5,
        title: Text('Existing User ?'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 70,
                  height: MediaQuery.of(context).size.height / 9,
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => (LoginPage())),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                    splashColor: Colors.amberAccent,
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(200),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100)),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehaviour(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 13,
              top: MediaQuery.of(context).size.width / 13,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'My Data',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 15,
                      top: MediaQuery.of(context).size.width / 14),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: userController,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/icons/21-avatar-outline.gif',
                                      fit: BoxFit.fill,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                            labelText: 'User Name',
                            hintText: 'Enter your UserName',
                            labelStyle: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Required'),
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 17,
                          ),
                        ),
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
                            labelText: 'Email',
                            hintText: 'Enter your Email',
                            labelStyle: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Required'),
                            EmailValidator(
                              errorText: 'Enter valid Email',
                            ),
                          ]),
                          onChanged: (value) {
                            emailController.text;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 17,
                          ),
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: passwordController,
                          validator: validatepass,
                          obscureText: HiddenPassword,
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
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 19),
                          width: 250,
                          height: 60,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            // onPressed: () async {
                            //   await FirebaseAuth.instance
                            //       .createUserWithEmailAndPassword(
                            //     email: emailController.text,
                            //     password: passwordController.text,
                            //   );
                            //   setState(() {});
                            // },
                            onPressed: signup,
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 36,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDiresction) {
    return child;
  }
}
