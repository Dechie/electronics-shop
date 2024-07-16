import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/input_widget.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  String name = '', username = '', phone = '', password = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Login',
              style: TextStyle(
                color: mainredBlacked,
                fontSize: size.width * 0.08,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: size.height * .45,
              width: size.width * .75,
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    InputWidget(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'enter correct name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      hintText: 'Phone Number',
                      onSaved: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                    InputWidget(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'enter correct name';
                        }
                        return null;
                      },
                      hintText: 'Password',
                      obscure: true,
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 35),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainredMoreBlacked,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () {
                        if (_key.currentState!.validate()) {}
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //const SizedBox(height: 30),
            SizedBox(
              height: 80,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          color: mainredBlacked,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const TextSpan(text: '\t\t'),
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: mainRed.withRed(253),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
