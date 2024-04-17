import 'package:state_management_provider/model.dart';
import 'package:state_management_provider/widgets/header_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/contact.dart' as contact_store;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  String phoneNumber = '';
  var nameController = TextEditingController();
  var phoneNumbersController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneNumbersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contact_store.Contact>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Contact App Provider'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Header(),
                TextField(
                  controller: nameController,
                  onChanged: (String value) {
                    name = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    labelText: 'Name',
                    hintText: 'Insert Your Name',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: phoneNumbersController,
                  onChanged: (String value) {
                    phoneNumber = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    labelText: 'Nomor',
                    hintText: 'Insert Your Number',
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) return;

                    formKey.currentState!.save();

                    contactProvider.addContact(
                      GetContact(
                        name: name,
                        phoneNumber: phoneNumber,
                      ),
                    );
                  },
                  child: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: contactProvider.contacts.length,
                  itemBuilder: (context, index) {
                    final currentContact = contactProvider.contacts[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.black38, width: 1)),
                        title: Text(currentContact.name),
                        subtitle: Text(currentContact.phoneNumber),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                contactProvider.deleteContact(
                                  currentContact.name,
                                  currentContact.phoneNumber,
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                // Set initial values to controllers
                                nameController.text = currentContact.name;
                                phoneNumbersController.text =
                                    currentContact.phoneNumber;

                                // Show dialog to edit contact
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Edit Contact'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            TextField(
                                              controller: nameController,
                                              decoration: InputDecoration(
                                                  labelText: 'Name'),
                                            ),
                                            TextField(
                                              controller:
                                                  phoneNumbersController,
                                              decoration: InputDecoration(
                                                  labelText: 'Phone'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Save'),
                                          onPressed: () {
                                            String newName =
                                                nameController.text;
                                            String newPhoneNumber =
                                                phoneNumbersController.text;

                                            // Edit contact
                                            contactProvider.editContact(
                                                index, newName, newPhoneNumber);

                                            // Clear controllers
                                            nameController.clear();
                                            phoneNumbersController.clear();

                                            Navigator.of(context)
                                                .pop(); // Close dialog
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            // Clear controllers
                                            nameController.clear();
                                            phoneNumbersController.clear();

                                            Navigator.of(context)
                                                .pop(); // Close dialog
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
