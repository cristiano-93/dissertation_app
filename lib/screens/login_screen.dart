import 'package:dissertation_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(children: [RegisterPageButton()]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 60,
                      color: AppColors.kTextDark,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 600,
                    height: 60,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.blue.shade50,
                      border: Border.all(
                        color: AppColors.kButtonBorder,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Center(
                            child: Icon(
                              Icons.email_outlined,
                              color: AppColors.kIconDark,
                              size: 40,
                            ),
                          ),
                        ),
                        Center(
                          widthFactor: 2.3,
                          child: Text(
                            'Your Email Address',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Row(),
              // Row(),
              // Row(),
              // Row(),
              // Row(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPageButton extends StatelessWidget {
  const RegisterPageButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('to register page'),
      onPressed: () {
        // Navigator.pop(context);
        Navigator.pushNamed(context, '/register');
      },
    );
  }
}
// Container(
// color: AppColors.kAppBackground,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Center(
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Container(
// width: 600,
// height: 60,
// decoration: BoxDecoration(
// borderRadius: const BorderRadius.all(Radius.circular(5.0)),
// color: Colors.white,
// border: Border.all(
// color: AppColors.kButtonBorder,
// width: 2,
// ),
// ),
// child: Row(
// children: const [
// Icon(
// Icons.email_outlined,
// color: AppColors.kIconDark,
// size: 40,
// ),
// Text(
// 'your email address',
// style: TextStyle(
// color: AppColors.kTextLight,
// ),
// )
// ],
// ),
// ),
// ],
// ),
// ),
// Row(
// children: [
// TextButton(
// child: const Text('to register page'),
// onPressed: () {
// Navigator.pushNamed(context, '/register');
// },
// ),
// ],
// ),
// ],
// ),
// );
