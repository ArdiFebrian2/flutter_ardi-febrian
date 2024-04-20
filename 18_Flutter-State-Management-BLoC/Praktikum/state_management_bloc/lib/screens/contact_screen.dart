import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import '../bloc/contact_bloc.dart';
import '../bloc/contact_event.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final ContactBloc _contactBloc = ContactBloc();
  final ValueNotifier<String> _nameValueNotifier = ValueNotifier<String>('');
  final ValueNotifier<String> _phoneNumberValueNotifier =
      ValueNotifier<String>('');
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text('Contact List'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: _nameValueNotifier,
                    builder: (context, name, child) {
                      return TextField(
                        onChanged: (value) {
                          _nameValueNotifier.value = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  ValueListenableBuilder(
                    valueListenable: _phoneNumberValueNotifier,
                    builder: (context, phoneNumber, child) {
                      return TextField(
                        onChanged: (value) {
                          _phoneNumberValueNotifier.value = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_selectedIndex == -1) {
                        String name = _nameValueNotifier.value;
                        String phoneNumber = _phoneNumberValueNotifier.value;
                        _contactBloc.contactEventSink.add(
                            AddContact(name: name, phoneNumber: phoneNumber));
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Edit Contact'),
                              content: Text(
                                  'Are you sure you want to update this contact?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    _contactBloc.contactEventSink
                                        .add(UpdateContact(
                                      index: _selectedIndex,
                                      name: _nameValueNotifier.value,
                                      phoneNumber:
                                          _phoneNumberValueNotifier.value,
                                    ));
                                    _selectedIndex = -1; // Reset selectedIndex
                                    _nameValueNotifier.value = '';
                                    _phoneNumberValueNotifier.value = '';
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Update'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text('Add Contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: StreamBuilder<List<ContactModel>>(
              stream: _contactBloc.contacts,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return Center(child: Text('Contact Not Found'));
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(snapshot.data![index].name),
                          subtitle: Text(snapshot.data![index].phoneNumber),
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                            backgroundColor: Colors.deepOrange,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Edit Contact'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: TextEditingController(
                                                text:
                                                    snapshot.data![index].name,
                                              ),
                                              onChanged: (value) {
                                                _nameValueNotifier.value =
                                                    value;
                                              },
                                              decoration: InputDecoration(
                                                labelText: 'Name',
                                                prefixIcon: Icon(Icons.person),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            TextField(
                                              controller: TextEditingController(
                                                text: snapshot
                                                    .data![index].phoneNumber,
                                              ),
                                              onChanged: (value) {
                                                _phoneNumberValueNotifier
                                                    .value = value;
                                              },
                                              decoration: InputDecoration(
                                                labelText: 'Phone Number',
                                                prefixIcon: Icon(Icons.phone),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              keyboardType: TextInputType.phone,
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              _contactBloc.contactEventSink
                                                  .add(UpdateContact(
                                                index: index,
                                                name: _nameValueNotifier.value,
                                                phoneNumber:
                                                    _phoneNumberValueNotifier
                                                        .value,
                                              ));
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Update'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Cancel'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Delete Contact'),
                                        content: Text(
                                            'Are you sure you want to delete this contact?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              _contactBloc.contactEventSink
                                                  .add(DeleteContact(index));
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Delete'),
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
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _contactBloc.dispose();
    _nameValueNotifier.dispose();
    _phoneNumberValueNotifier.dispose();
    super.dispose();
  }
}
