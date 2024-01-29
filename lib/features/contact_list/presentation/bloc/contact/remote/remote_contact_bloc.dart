import 'package:fav_contact_list/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usescases/get_contact_list.dart';
import 'remote_contact_event.dart';
import 'remote_contact_state.dart';

class RemoteContactBloc extends Bloc<RemoteContactEvent, RemoteContactState> {
  final GetContactListUseCase _getContactListUseCase;

  RemoteContactBloc (this._getContactListUseCase) : super(const RemoteContactLoading()){
    on <GetContacts>(onGetContacts);

  }

  void onGetContacts(GetContacts event, Emitter<RemoteContactState> emit) async {
  emit(const RemoteContactLoading());
  final result = await _getContactListUseCase(());
  if(result is DataSuccess && result.data != null){
    emit(RemoteContactLoaded(result.data!));
  }else if(result is DataFailed){
    emit(RemoteContactFailed(result.error!));
  }
}
 

}

