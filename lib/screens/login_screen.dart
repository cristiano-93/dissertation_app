import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dissertation_app/theme.dart';
import '../components/components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 250),
                child: Column(
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 60,
                        color: AppColors.kTextDark,
                      ),
                    ),
                    const SizedBox(height: 210),
                    Form(
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          const TextInput(
                            hintText: 'Your Email Address',
                            icon: Icon(
                              Icons.email_outlined,
                              color: AppColors.kIconDark,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 50.0),
                          const TextInput(
                            hintText: 'Your Password',
                            icon: Icon(
                              Icons.vpn_key_outlined,
                              color: AppColors.kIconDark,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: 50.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: Helper().buttonStyle(),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/chats');
                                },
                              ),
                              ElevatedButton(
                                style: Helper().buttonStyle(),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 50,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(
                          color: AppColors.kButtonBorder,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.google,
                                size: 40,
                                color: AppColors.kIconDark,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                'Sign In with your Google Account',
                                style: TextStyle(
                                    fontSize: 20, color: AppColors.kTextDark),
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
          ],
        ),
      ),
    );
  }
}
