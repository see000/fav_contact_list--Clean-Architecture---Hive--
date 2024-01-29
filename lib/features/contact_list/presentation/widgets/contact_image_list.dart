import 'package:fav_contact_list/features/contact_list/presentation/widgets/contact_profile_image.dart';
import 'package:flutter/material.dart';

import '../../../../custom_router.dart';
import '../../domain/entities/contact_entity.dart';

class ContactImageList extends StatelessWidget {
  final List<ContactEntity> contactList;

  const ContactImageList({super.key, required this.contactList,});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return ContactProfileImage(contactEntity: contactList[i], 
        onTap:(){
           CustomRouter.navigateToProfileScreen(context, contactList[i]);
        } );
      },
      separatorBuilder: (context, count) => const SizedBox(width: 10),
      itemCount: contactList.length,
    );
  }
}
