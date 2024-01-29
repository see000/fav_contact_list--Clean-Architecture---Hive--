import '../../../../domain/entities/contact_entity.dart';

abstract class LocalContactEvent {
  const LocalContactEvent();
}

class GetFavouriteContacts extends LocalContactEvent {
  const GetFavouriteContacts();
}

class AddFavouriteContact extends LocalContactEvent {
  final ContactEntity contactEntity;
  const AddFavouriteContact(this.contactEntity);
}


class RemoveFavouriteContact extends LocalContactEvent {
  final ContactEntity contactEntity;
  const RemoveFavouriteContact(this.contactEntity);
}

