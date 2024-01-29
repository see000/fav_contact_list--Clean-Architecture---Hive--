import 'package:fav_contact_list/core/util/country_code_service.dart';
import 'package:fav_contact_list/features/contact_list/presentation/bloc/contact/remote/remote_contact_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/contact_entity.dart';
import '../bloc/contact/remote/remote_contact_bloc.dart';
import '../bloc/contact/remote/remote_contact_state.dart';
import '../widgets/contact_image_list.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteContactBloc, RemoteContactState>(
        builder: (context, state) {
      
      if (state is RemoteContactLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is RemoteContactLoaded &&
          state.contactList!.isNotEmpty) {
        return Scaffold(
          body: _buildContactList(state.contactList!),
        );
      } else if (state is RemoteContactFailed) {
        return  Center(child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Failed to get contacts! \n${state.error!.error}'),
            TextButton(
              onPressed: () {
                context.read<RemoteContactBloc>().add(const GetContacts());
              },
              child: const Text('Retry'),
            )
          ],
        ));
      } else {
        return const Center(child: Text('Opps something went wrong'));
      }
    });
  }
}

Widget _buildContactList(List<ContactEntity> contactList) {
  List<ContactEntity> unitedStateContactList = [];
  List<ContactEntity> remainingContacts = [];

  for (var contact in contactList) {
    if (contact.country == Country.unitedStates) {
      unitedStateContactList.add(contact);
    } else {
      remainingContacts.add(contact);
    }
  }

  return Column(
    children: [
      if(unitedStateContactList.isNotEmpty)
      SizedBox(
        height: 150,
        child: _buildContactListWithTitle('From US',unitedStateContactList)),
      SizedBox(
        height: 150,
        child: _buildContactListWithTitle(
            'Other Countries', remainingContacts),
      )
    ],
  );
}

Widget _buildContactListWithTitle(
    String? title, List<ContactEntity> contactList) {
  return Padding(
    padding: const EdgeInsets.only( left:10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
          Flexible( fit: FlexFit.loose,child: ContactImageList(contactList: contactList,)),
         
      ],
    ),
  );
}
