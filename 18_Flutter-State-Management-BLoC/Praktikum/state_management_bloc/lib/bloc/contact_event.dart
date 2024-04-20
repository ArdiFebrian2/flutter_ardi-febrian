// lib/bloc/contact_event.dart

abstract class ContactEvent {}

class AddContact extends ContactEvent {
  final String name;
  final String phoneNumber;

  AddContact({required this.name, required this.phoneNumber});
}

class DeleteContact extends ContactEvent {
  final int index;

  DeleteContact(this.index);
}

class UpdateContact extends ContactEvent {
  final int index;
  final String name;
  final String phoneNumber;

  UpdateContact(
      {required this.index, required this.name, required this.phoneNumber});
}
