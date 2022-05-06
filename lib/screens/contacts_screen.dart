import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../elements.dart';
import '../helper.dart';
import '../main.dart';
import '../model/avatar.dart';
import '../theme.dart';
import '../widgets.dart';

class ContactsScreen extends StatelessWidget {
  ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            'Contact List',
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(60),
              child: const Center(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    fontSize: 40,
                    color: AppColors.kTextDark,
                  ),
                ),
              ),
            ),
            Container(
              // container for the filtering row
              margin: const EdgeInsets.only(
                  left: 150, top: 0, right: 150, bottom: 50),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Order by:',
                      style:
                          TextStyle(fontSize: 24, color: AppColors.kTextDark),
                    ),
                    SizedBox(
                      width: 160,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Name',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Recently Added'),
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // listview container
              height: 717,
              margin: const EdgeInsets.symmetric(horizontal: 70),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Expanded(
                    // height: 663,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    // padding: const EdgeInsets.only(bottom: 10),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      children: <Widget>[
                        ContactBody(
                          name: 'Andrew Garfield',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Andy',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Barack Obama',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Cristiano Santos',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Darlene Steward',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Donald Trump',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Josh',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'John Depp',
                          url: Helper.randomPictureUrl(),
                        ),
                      ],
                    ),
                  ),
                  const Center(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 40,
                      color: AppColors.kIconDark,
                    ),
                  )
                ],
              ),
            ),
            Container(
              // container for the bottom toolbar
              height: 80,
              margin: const EdgeInsets.only(
                  left: 50, right: 50, top: 50, bottom: 10),
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
                      //Navigator.pushNamed(context, '/new_contacts_screen');
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade300, elevation: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                          Icons.contact_page_outlined,
                          size: 40,
                          color: Colors.blue,
                        ),
                        Text(
                          'Contacts',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
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
                          style: TextStyle(
                              fontSize: 20, color: AppColors.kTextDark),
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
    );
  }
}
