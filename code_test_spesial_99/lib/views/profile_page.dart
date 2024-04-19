import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_viewmodel.dart';
import '../models/user.dart';
import '../views/edit_profile_page.dart'; // Import halaman EditProfilePage

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
      builder: (context, userViewModel, child) {
        User user = userViewModel.user;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Profil'),
            actions: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Navigasi ke halaman EditProfilePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blue,
                  child: Text(
                    user.name.substring(0, 1).toUpperCase(),
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Nama: ${user.name}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Umur: ${user.age} tahun',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Divider(),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                  subtitle: Text('email@example.com'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Telepon'),
                  subtitle: Text('+62 123 4567 890'),
                ),
                Divider(),
                Spacer(), // Untuk menggeser tombol ke bawah
                ElevatedButton.icon(
                  onPressed: () {
                    userViewModel.updateUser(User(name: 'Jane Doe', age: 25));
                  },
                  icon: Icon(Icons.update),
                  label: Text('Update Profil'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
