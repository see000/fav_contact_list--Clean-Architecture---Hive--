import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fav_contact_list/features/contact_list/domain/entities/contact_entity.dart';

abstract class RemoteContactState extends Equatable {
  final List<ContactEntity>? contactList;
  final DioException? error;
  final bool? isFavourite;

  const RemoteContactState({this.contactList, this.error, this.isFavourite});


  @override
  List<Object> get props => [];
}

class RemoteContactLoading extends RemoteContactState {
  const RemoteContactLoading();
}

class RemoteContactLoaded extends RemoteContactState {
  const RemoteContactLoaded(List<ContactEntity> contactList) : super(contactList: contactList);
}

class RemoteContactFailed extends RemoteContactState{
  const RemoteContactFailed(DioException error) :super(error: error);
}



