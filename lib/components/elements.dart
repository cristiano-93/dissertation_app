import 'package:flutter/material.dart';

import '../theme.dart';
import 'avatar.dart';
import 'helper.dart';

class Elements extends StatelessWidget {
  const Elements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MessagesDivider extends StatelessWidget {
  const MessagesDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // container for the divider class
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: const Divider(
        height: 2,
        thickness: 1,
        color: AppColors.kTextLight,
      ),
    );
  }
}

class MessageBody extends StatelessWidget {
  const MessageBody({
    Key? key,
    required this.name,
    required this.message,
  }) : super(key: key);
  final String name;
  final String message;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/message');
      },
      child: Container(
        // container for 1 message
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Avatar(
              // TODO get name and use to display proper pic
              url: Helper.randomPictureUrl(),
              radius: 40,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: 340,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70),
              width: 50,
              child: Column(
                children: const [
                  Text('18:31'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContactBody extends StatelessWidget {
  const ContactBody({Key? key, required this.name, required this.url})
      : super(key: key);

  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/message');
      },
      child: Container(
        // container for 1 message
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Avatar(
                // TODO get name and use to display proper pic
                url: Helper.randomPictureUrl(),
                radius: 40,
              ),
            ),
            Expanded(
              flex: 8,
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.kButtonTextExtraDark,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
