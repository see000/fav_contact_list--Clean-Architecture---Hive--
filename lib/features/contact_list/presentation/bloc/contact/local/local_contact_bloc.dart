import 'package:fav_contact_list/features/contact_list/domain/usescases/add_favourite_contact.dart';
import 'package:fav_contact_list/features/contact_list/domain/usescases/get_favourite_contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usescases/remove_favourite_contact.dart';
import 'local_contact_event.dart';
import 'local_contact_state.dart';

class LocalContactBloc extends Bloc<LocalContactEvent, LocalContactState >{
  final GetFavouriteContactUseCase _getFavouriteContactUseCase;
  final AddFavouriteContactUseCase _addFavouriteContactUseCase;
  final RemoveFavouriteContactUseCase _removeFavouriteContactUseCase;
  

  LocalContactBloc(this._getFavouriteContactUseCase, this._addFavouriteContactUseCase, this._removeFavouriteContactUseCase) : super(const LocalContactLoading()){
    on<GetFavouriteContacts>(onGetLocalFavouriteContactList);
    on<AddFavouriteContact>(onAddFavoriteContact);
    on<RemoveFavouriteContact>(onRemoveFavoriteContact);
  
  }

  void onGetLocalFavouriteContactList(GetFavouriteContacts event , Emitter<LocalContactState> emit) async{
    emit(const LocalContactLoading());
      final localFavouritecontacts = await _getFavouriteContactUseCase.call(null);
      emit(LocalContactLoaded(localFavouritecontacts));
    
  }



   void onAddFavoriteContact(AddFavouriteContact event, Emitter<LocalContactState> emit) async {
    emit(const LocalContactLoading());
    await _addFavouriteContactUseCase.call(event.contactEntity);
    final localFavouritecontacts = await _getFavouriteContactUseCase.call(null);
    emit(LocalContactLoaded(localFavouritecontacts));
   
  }

  void onRemoveFavoriteContact(RemoveFavouriteContact event, Emitter<LocalContactState> emit) async {
    emit(const LocalContactLoading());
    await _removeFavouriteContactUseCase.call(event.contactEntity);
    final localFavouritecontacts = await _getFavouriteContactUseCase.call(null);
    emit(LocalContactLoaded(localFavouritecontacts));
    
    
   
  }



}