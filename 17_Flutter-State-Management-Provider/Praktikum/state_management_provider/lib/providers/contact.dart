import 'package:state_management_provider/model.dart';
import 'package:flutter/material.dart';

class Contact with ChangeNotifier {
  final List<GetContact> _contacts = [];
  List<GetContact> get contacts => _contacts;

  void addContact(GetContact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void deleteContact(String name, String phoneNumber) {
    _contacts.removeWhere((contact) =>
        contact.name == name && contact.phoneNumber == phoneNumber);
    notifyListeners();
  }

  void editContact(int index, String newName, String newPhoneNumber) {
    contacts[index].name = newName;
    contacts[index].phoneNumber = newPhoneNumber;
    notifyListeners();
  }
}
