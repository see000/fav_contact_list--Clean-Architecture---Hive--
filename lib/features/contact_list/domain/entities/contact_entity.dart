

import '../../../../core/util/country_code_service.dart';

abstract class ContactEntity {
  final String? name;
  final String? state;
  final Country? country;
  final String? email;
  final String? contactProfileUrl;

   ContactEntity({
    required this.name,
    required this.state,
    required this.country,
    required this.email,
    required this.contactProfileUrl,
  });

  // convert to ContactModel

}