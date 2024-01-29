import 'package:dio/dio.dart';
import 'package:fav_contact_list/core/resources/data_state.dart';

import '../../../../core/network/network_service.dart';
import '../../domain/entities/contact_entity.dart';
import '../../domain/repository/contact_repository.dart';
import '../model/contact.dart';
import '../sources/local/contact_favourite_box_service.dart';
import '../sources/remote/contact_api_service.dart';

 class ContactRepositoryImpl implements ContactRepository {

  final ContactApiService _contactApiService;
  final ContactFavouriteBoxService _contactFavouriteBoxService;
  const ContactRepositoryImpl(this._contactApiService, this._contactFavouriteBoxService);
  /// if limitUpTo is null, it will return 15 contacts by default
  /// By editing the seed, each time different contacts will be returned 
  /// same seed will return same contacts in same order
  @override
  Future<DataState<List<ContactModel>>> getContacts({int? limitUpTo}) async {
    List<String> lIncludeFields = ['name','email','location','nat','picture'];
    limitUpTo ??= 15;

      bool networkConnected = await NetworkService.isInternetConnected();
      if(!networkConnected){
        
        final error = DioException(requestOptions: RequestOptions(), error: 'No Internet Connection');
        return DataFailed(error);
      }
      final result = await _contactApiService.getContacts(includeFields: lIncludeFields.join(','),limitUpTo: limitUpTo);


    if(result.response.statusCode == 200){
      return DataSuccess(result.data);
    }else{
      return DataFailed(
        DioException(
          requestOptions: result.response.requestOptions,
          response: result.response,
          error: result.response.statusMessage,
        )
      );
    }
  }
  
  @override
  Future<void> addFavouriteContact(ContactEntity contactEntity) async {
    _contactFavouriteBoxService.addContactToLocalFavouriteList(ContactModel.fromEntity(contactEntity) );
  }
  
  @override
  Future<List<ContactModel>> getLocalFavouriteContacts() async {
    return await _contactFavouriteBoxService.getLocalFavouriteContacts();
  }
  


 @override
  Future<void> removeFavoriteContact(ContactEntity contactEntity) {
    return _contactFavouriteBoxService.removeFavoriteContact(ContactModel.fromEntity(contactEntity));
  }

}