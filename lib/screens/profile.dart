import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_app2/main.dart';
import 'package:social_app2/widgets.dart';

import '../helper.dart';
import '../model/avatar.dart';
import '../theme.dart';
import 'login_screen.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  //String name = appuser.name;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            'Profile',
            style: TextStyle(
              color: AppColors.kTextDark,
              fontSize: 30,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getheight(context, 21)),
              Text(
                "Your Profile",
                style: TextStyle(
                    color: Colors.black, fontSize: getheight(context, 36)),
              ),
              SizedBox(
                height: getheight(context, 30),
              ),
              Container(
                height: getheight(context, 809),
                width: getwidth(context, 766),
                decoration: BoxDecoration(
                    color: const Color(0xFFE5E5E5),
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(getheight(context, 20)),
                            child: Column(
                              children: [
                                Container(
                                  height: getheight(context, 180),
                                  width: getheight(context, 180),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(27),
                                  ),
                                  child: Avatar.large(
                                    url: Helper.randomPictureUrl(),
                                  ),
                                ),
                                SizedBox(
                                  height: getheight(context, 10),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: getwidth(context, 10)),
                            child: Column(
                              children: [
                                Container(
                                  width: getwidth(context, 280),
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                        fontSize: getheight(context, 28),
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  height: getheight(context, 120),
                                  width: getwidth(context, 320),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFC4C4C4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: TextField(
                                      expands: true,
                                      maxLines: null,
                                      decoration: InputDecoration(
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText:
                                              "Small paragraph about you"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getheight(context, 70),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getwidth(context, 80)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Your Name",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF2DA5F5).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: ''),
                              ),
                            ),
                            SizedBox(
                              height: getheight(context, 40),
                            ),
                            const Text(
                              "Your Email Address",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF2DA5F5).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextField(
                                enabled: false,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: ''),
                              ),
                            ),
                            SizedBox(
                              height: getheight(context, 40),
                            ),
                            const Text(
                              "Your Phone Number",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF2DA5F5).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: ''),
                              ),
                            ),
                            SizedBox(height: getheight(context, 40)),
                            TextButton(
                              onPressed: () {},
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: BlueColor),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Text(
                                    "Save Profile",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  ),
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
                            style: TextStyle(
                                fontSize: 20, color: AppColors.kTextDark),
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
                            style: TextStyle(
                                fontSize: 20, color: AppColors.kTextDark),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/profile');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade300, elevation: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.account_circle,
                            size: 40,
                            color: Colors.blue,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/helper');
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade300, elevation: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.help_center,
                            size: 40,
                            color: AppColors.kIconDark,
                          ),
                          Text(
                            'Helper',
                            style: TextStyle(
                                fontSize: 20, color: AppColors.kTextDark),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
