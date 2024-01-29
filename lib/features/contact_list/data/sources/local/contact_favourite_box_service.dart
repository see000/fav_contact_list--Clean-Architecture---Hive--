import 'dart:async';

import 'package:fav_contact_list/features/contact_list/data/model/contact.dart';

import 'database_provider.dart';



abstract class ContactFavouriteBoxService {
  
  const ContactFavouriteBoxService(DatabaseProvider databaseProvider);

  Future<List<ContactModel>> getLocalFavouriteContacts();

  Future<void> addContactToLocalFavouriteList(ContactModel contactModel);

  Future<void> removeFavoriteContact(ContactModel contactModel);


}