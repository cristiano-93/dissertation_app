import 'package:dissertation_app/components/avatar.dart';
import 'package:flutter/material.dart';

import 'package:dissertation_app/theme.dart';
import '../components/components.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            'Contact List',
            style: TextStyle(
              color: AppColors.kTextDark,
              fontSize: 20,
            ),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Sign Out',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Avatar.medium(url: Helper.randomPictureUrl())
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(60),
              child: const Center(
                child: Text(
                  'Contacts List',
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
              height: 800,
              margin: const EdgeInsets.symmetric(horizontal: 70),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    height: 760,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      children: <Widget>[
                        ContactBody(
                          name: 'Cristiano Santos',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Cristiano Santos',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Cristiano Santos',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Cristiano Santos',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Cristiano Santos',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Cristiano Santos',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Cristiano Santos',
                          url: Helper.randomPictureUrl(),
                        ),
                        const MessagesDivider(),
                        ContactBody(
                          name: 'Cristiano Santos',
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
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/chats');
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
                  Container(
                    child: ElevatedButton(
                      onPressed: () {},
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
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
                      print('helper');
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
            ),
          ],
        ),
      ),
    );
  }
}
