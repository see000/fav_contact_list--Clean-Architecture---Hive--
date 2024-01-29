import 'package:flutter/material.dart';

import 'features/contact_list/domain/entities/contact_entity.dart';
import 'features/contact_list/presentation/screen/profile_screen.dart';

class CustomRouter {

   static void navigateToProfileScreen(BuildContext context, ContactEntity contactEntity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen( contactEntity: contactEntity),
      ),
    );
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}