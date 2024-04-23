import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/screens/login_screen.dart';

class ProfileSheet extends StatefulWidget {
  const ProfileSheet({Key? key}) : super(key: key);

  @override
  State<ProfileSheet> createState() => _ProfileSheetState();
}

class _ProfileSheetState extends State<ProfileSheet> {
  late SharedPreferences logindata;
  String username = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile_pic.jpg'),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            username,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Task Completed',
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Goals',
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Settings',
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    logindata.setBool('login', true);
                    logindata.remove('username');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    'Log Out',
                    style: GoogleFonts.poppins(fontSize: 17),
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
