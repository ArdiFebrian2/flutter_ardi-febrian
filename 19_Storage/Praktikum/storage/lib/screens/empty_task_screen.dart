import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyTaskScreen extends StatelessWidget {
  const EmptyTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              'assets/images/task.jpg',
            ),
            height: 250,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Your contact is empty, add some!',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
