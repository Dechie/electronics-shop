import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_shop/models/auth_state.dart';
import 'package:mobile_shop/services/auth/auth_services.dart';

import '../../utils/constants.dart';
import '../../widgets/input_widget.dart';
import 'login.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _key = GlobalKey<FormState>();

  String name = 'decha',
      cardNumber = '',
      phone = '',
      password = '',
      confirmPassword = '',
      phonePrefix = '09';
  @override
  Widget build(BuildContext context) {
    var currentAuthState = ref.watch(authStateProvider);
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
                  height: size.height * .5,
                  width: size.width * .8,
                  //width: double.infinity,
                  child: SingleChildScrollView(
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
                          InputWidget(
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value.isEmpty ||
                                  value.length > 10 ||
                                  !['09', '+251', '251']
                                      .any(value.startsWith)) {
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
                            onSaved: (value) {
                              cardNumber = value;
                            },
                            hintText: "Card Number",
                            validator: (value) {
                              if (value.isEmpty) {
                                return "insert card number";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          InputWidget(
                            hintText: 'Password',
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'enter correct name';
                              }

                              if (password != confirmPassword) {
                                return "Passwords don't match";
                              }
                              return null;
                            },
                            obscure: true,
                            onChanged: (value) {
                              password = value;
                            },
                            onSaved: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                          const SizedBox(height: 15),
                          InputWidget(
                            hintText: 'Confirm Password',
                            obscure: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'enter correct name';
                              }
                              if (password != confirmPassword) {
                                return "Passwords don't match";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                confirmPassword = password;
                              });
                            },
                            onSaved: (value) {
                              setState(() {
                                confirmPassword = value;
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
                                _regApi(currentAuthState);
                                //sendPhoneNumber();
                              }
                            },
                            child: currentAuthState.isLoading
                                ? const CircularProgressIndicator()
                                : Text(
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

  void _regApi(AuthState currentAuthState) async {
    Map<String, dynamic> regVals = {
      "name": name,
      "phone": phone,
      "cardNumber": cardNumber,
      "password": password,
    };

    await ref.read(authStateProvider.notifier).register(regVals);

    if (currentAuthState.user != null && mounted) {
      Navigator.pop(context);
    }
  }

  // void sendPhoneNumber() {
  //   final ap = Provider.of<AuthProvider>(context, listen: false);
  //   ap.signInWithPhone(context, phone);
  // }
}
