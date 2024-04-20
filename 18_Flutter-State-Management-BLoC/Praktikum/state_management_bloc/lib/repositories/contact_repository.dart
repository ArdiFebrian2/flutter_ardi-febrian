

import '../models/contact_model.dart';

class ContactRepository {
  List<ContactModel> _contacts = [];

  List<ContactModel> get contacts => _contacts;

  void addContact(ContactModel contact) {
    _contacts.add(contact);
  }

  void deleteContact(int index) {
    _contacts.removeAt(index);
  }

  void updateContact(int index, ContactModel contact) {
    _contacts[index] = contact;
  }
}
