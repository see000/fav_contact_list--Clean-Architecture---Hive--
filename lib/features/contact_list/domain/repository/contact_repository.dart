import '../../../../core/resources/data_state.dart';
import '../entities/contact_entity.dart';

abstract class ContactRepository {
  /// API ///
  Future<DataState<List<ContactEntity>>> getContacts();

  /// Local ///
  
  //Get all favourite contacts
  Future<List<ContactEntity>> getLocalFavouriteContacts();

  //Add contact to favourite list
  Future<void> addFavouriteContact(ContactEntity contactEntity);

  //Remove contact from favourite list
  Future<void> removeFavoriteContact(ContactEntity contactEntity);

}