import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../widgets/input_widget.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<FormState>();
  String name = 'decha',
      cardNumber = '',
      phone = '',
      password = 'deee',
      phonePrefix = '09';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    color: mainredMoreBlacked,
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * .45,
                  width: size.width * .8,
                  //width: double.infinity,
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        InputWidget(
                          hintText: 'Name',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'enter correct name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        // InputWidget(
                        //   keyboardType: TextInputType.phone,
                        //   validator: (value) {
                        //     if (value.isEmpty ||
                        //         value.length > 10 ||
                        //         (!value.startsWith('09') &&
                        //             !value.startsWith('+251') &&
                        //             !value.startsWith('251'))) {
                        //       return 'enter correct phone';
                        //     }

                        //     return null;
                        //   },
                        //   //hintText: 'phone',
                        //   hintText: 'ስልክ ቁጥር',
                        //   onSaved: (value) {
                        //     setState(() {
                        //       phone = value.trim();
                        //       if (!phone.startsWith('+251')) {
                        //         phone = phone.replaceFirst('09', '+2519');
                        //       } else if (phone.startsWith('251')) {
                        //         phone = '+$phone';
                        //       }
                        //       print(phone);
                        //     });
                        //   },
                        // ),
                        InputWidget(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value.isEmpty ||
                                value.length > 10 ||
                                !['09', '+251', '251'].any(value.startsWith)) {
                              return 'invalid phone number';
                            }
                            return null;
                          },
                          hintText: 'phone number',
                          onSaved: (value) {
                            setState(() {
                              phone = value.trim();
                              if (!phone.startsWith('+251')) {
                                phone = phone.replaceFirst('09', '+2519');
                              } else if (phone.startsWith('251')) {
                                phone = '+$phone';
                              }
                              print(phone);
                            });
                          },
                        ),

                        const SizedBox(height: 15),
                        InputWidget(
                          hintText: 'Password',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'enter correct name';
                            }
                            return null;
                          },
                          obscure: true,
                          onSaved: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        InputWidget(
                          hintText: 'Confirm Password',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'enter correct name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        const SizedBox(height: 35),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            //backgroundColor: Colors.black,
                            backgroundColor: mainredMoreBlacked,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                          ),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              //sendPhoneNumber();
                            }
                          },
                          child: Text(
                            'Register',
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
                const SizedBox(height: 30),
                SizedBox(
                  height: 60,
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              color: mainredBlacked,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const TextSpan(text: '\t\t'),
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              color: mainRed.withRed(253),
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
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
        ),
      ),
    );
  }

  // void sendPhoneNumber() {
  //   final ap = Provider.of<AuthProvider>(context, listen: false);
  //   ap.signInWithPhone(context, phone);
  // }
}
