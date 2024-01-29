import 'package:fav_contact_list/features/contact_list/data/sources/local/database_provider.dart';

import '../../model/contact.dart';
import 'contact_favourite_box_service.dart';

class ContactFavouriteBox implements ContactFavouriteBoxService { 
  final DatabaseProvider _databaseProvider;

  ContactFavouriteBox(this._databaseProvider);

  @override
  Future<void> addContactToLocalFavouriteList(ContactModel contactModel) async {
    final box = await _databaseProvider.contactBox;
    //check if the contact is already in the box
    // if yes, return
    if(box.containsKey(contactModel.name)){
      return;
    }

    box.add(contactModel);
    print("Contact added to favourite list");
  }

  @override
  Future<List<ContactModel>> getLocalFavouriteContacts() async {
    final box = await _databaseProvider.contactBox;
    return Future.value(box.values.toList());
  }
  
  @override
  Future<void> removeFavoriteContact(ContactModel contactModel) async {
    final box = await _databaseProvider.contactBox;
     // Find the index of the contact with the specified name
    final index = box.values.toList().indexWhere((item) => item.name == contactModel.name);
    if (index != -1) {
      // Delete the contact at the found index
      await box.deleteAt(index);
      print("Contact removed from favorite list");
    }
  }

  


  

  
  
  
}