
import 'dart:async';
import '../models/contact_model.dart';
import 'contact_event.dart';
import '../repositories/contact_repository.dart';

class ContactBloc {
  final _contactRepository = ContactRepository();

  final _contactController = StreamController<List<ContactModel>>.broadcast();
  Stream<List<ContactModel>> get contacts => _contactController.stream;

  final _contactEventController = StreamController<ContactEvent>();
  Sink<ContactEvent> get contactEventSink => _contactEventController.sink;

  ContactBloc() {
    _contactEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ContactEvent event) {
    if (event is AddContact) {
      _contactRepository.addContact(
          ContactModel(name: event.name, phoneNumber: event.phoneNumber));
      _contactController.add(_contactRepository.contacts);
    } else if (event is DeleteContact) {
      _contactRepository.deleteContact(event.index);
      _contactController.add(_contactRepository.contacts);
    } else if (event is UpdateContact) {
      _contactRepository.updateContact(event.index,
          ContactModel(name: event.name, phoneNumber: event.phoneNumber));
      _contactController.add(_contactRepository.contacts);
    }
  }

  void dispose() {
    _contactController.close();
    _contactEventController.close();
  }
}
