import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 70,
        ),
        Icon(
          Icons.app_shortcut_outlined,
          size: 35,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Create New Contact',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          color: Colors.black45,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
