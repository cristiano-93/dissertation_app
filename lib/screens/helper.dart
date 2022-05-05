import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app2/widgets.dart';
//import 'package:giffy_dialog/giffy_dialog.dart';

import '../helper.dart';
import '../main.dart';
import '../model/avatar.dart';
import '../theme.dart';

class HelperPage extends StatelessWidget {
  HelperPage({Key? key}) : super(key: key);
  var calling = Image.asset('images/callingv3.gif');
  var gallery = Image.asset('images/galleryv3.gif');
  var messaging = Image.asset('images/messagingv3.gif');
  var signout = Image.asset('images/signoutv3.gif');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          'Contact List',
          style: TextStyle(
            color: AppColors.kTextDark,
            fontSize: 20,
          ),
        ),
        actions: [
          SizedBox(
            height: 40,
            child: TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                GoogleSignIn().signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
          SizedBox(width: getwidth(context, 10)),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Hello,",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Text(
                  'Cristiano',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Avatar.medium(
              url: Helper.randomPictureUrl(),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: getheight(context, 50)),
          SizedBox(height: getheight(context, 21)),
          Text(
            "What do you need help with?",
            style: TextStyle(
              color: Colors.black,
              fontSize: getheight(context, 36),
            ),
          ),
          SizedBox(height: getheight(context, 75)),
          Container(
            height: 772,
            child: Column(
              children: [
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (_) => AssetGiffyDialog(
                            //     image: calling,
                            //     title: Text(''),
                            //     description: Text(''),
                            //     entryAnimation: EntryAnimation.BOTTOM,
                            //     onOkButtonPressed: () {},
                            //   ),
                            // );
                          },
                          child: Container(
                            width: getwidth(context, 350),
                            padding: EdgeInsets.symmetric(vertical: 3),
                            decoration: BoxDecoration(
                              border: Border.all(color: BlueColor),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                "Calling a contact",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (_) => AssetGiffyDialog(
                            //     image: messaging,
                            //     title: Text(''),
                            //     description: Text(''),
                            //     entryAnimation: EntryAnimation.BOTTOM,
                            //     onOkButtonPressed: () {},
                            //   ),
                            // );
                          },
                          child: Container(
                            width: getwidth(context, 350),
                            padding: EdgeInsets.symmetric(vertical: 3),
                            decoration: BoxDecoration(
                              border: Border.all(color: BlueColor),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                "Messaging a contact",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getheight(context, 50)),
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (_) => AssetGiffyDialog(
                            //     image: gallery,
                            //     title: Text(''),
                            //     description: Text(''),
                            //     entryAnimation: EntryAnimation.BOTTOM,
                            //     onOkButtonPressed: () {},
                            //   ),
                            // );
                          },
                          child: Container(
                            width: getwidth(context, 350),
                            padding: EdgeInsets.symmetric(vertical: 3),
                            decoration: BoxDecoration(
                              border: Border.all(color: BlueColor),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                "Showing my photos",
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (_) => AssetGiffyDialog(
                            //     image: signout,
                            //     title: Text(''),
                            //     description: Text(''),
                            //     entryAnimation: EntryAnimation.BOTTOM,
                            //     onOkButtonPressed: () {},
                            //   ),
                            // );
                          },
                          child: Container(
                            width: getwidth(context, 350),
                            padding: EdgeInsets.symmetric(vertical: 3),
                            decoration: BoxDecoration(
                                border: Border.all(color: BlueColor),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Center(
                                child: Text("Sign out my Account",
                                    style: TextStyle(fontSize: 24))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            // container for the bottom toolbar
            height: 80,
            margin: const EdgeInsets.only(
                left: 50, right: 50, top: 100, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/new_chat_screen');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade300, elevation: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.message,
                        size: 40,
                        color: AppColors.kIconDark,
                      ),
                      Text(
                        'Chat List',
                        style:
                            TextStyle(fontSize: 20, color: AppColors.kTextDark),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/new_contacts_screen');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade300, elevation: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.contact_page_outlined,
                        size: 40,
                        color: AppColors.kIconDark,
                      ),
                      Text(
                        'Contacts',
                        style:
                            TextStyle(fontSize: 20, color: AppColors.kIconDark),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade300, elevation: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.account_circle,
                        size: 40,
                        color: AppColors.kIconDark,
                      ),
                      Text(
                        'Profile',
                        style:
                            TextStyle(fontSize: 20, color: AppColors.kTextDark),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, '/helper');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade300, elevation: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.help_center,
                        size: 40,
                        color: Colors.blue,
                      ),
                      Text(
                        'Helper',
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
