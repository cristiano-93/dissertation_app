import 'package:dissertation_app/components/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                    const SizedBox(height: 150),
                    Form(
                      child: Column(
                        children: [
                          const TextInput(
                            hintText: 'Your Name',
                            icon: Icon(
                              Icons.account_circle,
                              color: AppColors.kIconDark,
                              size: 40,
                            ),
                          ),
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
                          ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                'Register Account',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
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
