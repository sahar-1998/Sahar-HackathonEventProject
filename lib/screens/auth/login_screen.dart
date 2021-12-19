import 'package:evemts/api/api_helper.dart';
import 'package:evemts/api/controller/auth_api_controller.dart';
import 'package:evemts/widgets/custom_text_feild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> with ApiHelper {
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _passwordTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 160,
                ),
                Text(
                  'UCAS EVENTS ',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 35,
                      color: Color(0xff253975)),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.only(right: 205),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to back',
                        style: TextStyle(
                            fontSize: 11,
                            color: Color(0xff253975),
                            fontFamily: 'Cairo'),
                      ),
                      Text(
                        'Login with',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff253975),
                            fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Phone',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                AppTextField(
                  hint: 'Enter your phone ',
                  controller: _phoneTextEditingController,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: 16.h,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                AppTextField(
                  hint: '*********',
                  controller: _passwordTextEditingController,
                  obscureText: true,
                ),
                SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                  onPressed: () async => await performLogin(),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 15, fontFamily: 'Roboto'),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff253975),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(300, 48),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_phoneTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(
      context,
      mobile: _phoneTextEditingController.text,
      password: _passwordTextEditingController.text,
    );
    if (status) Navigator.pushReplacementNamed(context, '/categoryScreen');
  }
}
