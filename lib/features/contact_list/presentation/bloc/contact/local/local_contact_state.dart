import 'package:equatable/equatable.dart';

import '../../../../domain/entities/contact_entity.dart';

abstract class LocalContactState extends Equatable{
  final List<ContactEntity>? contacts;
  final Exception? exception;
  const LocalContactState({this.contacts, this.exception,});

  @override
  List<Object> get props => [];
}

class LocalContactLoading extends LocalContactState {
  const LocalContactLoading();
}

class LocalContactLoaded extends LocalContactState {

  const LocalContactLoaded(List<ContactEntity> contacts) : super(contacts: contacts);
}


