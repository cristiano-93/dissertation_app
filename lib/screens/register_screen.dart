import 'package:dissertation_app/components/components.dart';
import 'package:flutter/material.dart';
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
                margin: EdgeInsets.all(100),
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 60,
                        color: AppColors.kTextDark,
                      ),
                    ),
                    SizedBox(height: 50),
                    Form(
                      child: Column(
                        children: [
                          Container(
                            child: TextField(
                              decoration: ThemeHelper()
                                  .textInputDecoration('Name', 'Your Name'),
                            ),
                          ),
                          SizedBox(height: 50),
                          Container(
                            child: TextField(
                              decoration: ThemeHelper().textInputDecoration(
                                  'Email', 'Your Email Address'),
                            ),
                          ),
                          SizedBox(height: 50.0),
                          Container(
                            child: TextField(
                              obscureText: true,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Password', 'Your password'),
                            ),
                          ),
                          SizedBox(height: 50.0),
                          Container(
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  'Sign In'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                //After successful login we will redirect to profile page. Let's create profile page now
                                Navigator.pushNamed(context, '/login');
                              },
                            ),
                          ),
                        ],
                      ),
                    )
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

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('to login page'),
      onPressed: () {
        // Navigator.pop(context);
        Navigator.pushNamed(context, '/login');
      },
    );
  }
}

class TestPageButton extends StatelessWidget {
  const TestPageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('to test page'),
      onPressed: () {
        // Navigator.pop(context);
        Navigator.pushNamed(context, '/test');
      },
    );
  }
}
