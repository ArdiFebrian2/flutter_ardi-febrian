import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({Key? key}) : super(key: key);

  @override
  _NewContactPageState createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  List<Contact> _contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create New Contacts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Nama'),
              subtitle: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan Nama',
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Nomor'),
              subtitle: TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan Nomor',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addContact();
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            const Text(
              'List Contacts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  final contact = _contacts[index];
                  return ListTile(
                    title: Text(contact.name),
                    subtitle: Text(contact.phone),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deleteContact(index);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _editContact(contact);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addContact() {
    final name = _nameController.text;
    final phone = _phoneController.text;
    if (name.isNotEmpty && phone.isNotEmpty) {
      setState(() {
        _contacts.add(Contact(name: name, phone: phone));
      });
      _nameController.clear();
      _phoneController.clear();
    }
  }

  void _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  void _editContact(Contact contact) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: TextEditingController(text: contact.name),
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) => contact.name = value,
            ),
            TextField(
              controller: TextEditingController(text: contact.phone),
              decoration: const InputDecoration(labelText: 'Phone Number'),
              onChanged: (value) => contact.phone = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {});
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class Contact {
  late String name;
  late String phone;

  Contact({required this.name, required this.phone});
}

void main() {
  runApp(MaterialApp(
    title: 'Contacts App',
    home: NewContactPage(),
  ));
}
