import 'package:fav_contact_list/core/util/country_code_service.dart';
import 'package:fav_contact_list/features/contact_list/domain/entities/contact_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'contact.g.dart';

@HiveType(typeId: 1)
class ContactModel extends ContactEntity {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? state;
  @HiveField(2)
   Country? country;
  @HiveField(3)
   String? email;
  @HiveField(4)
  String? contactProfileUrl;

  ContactModel({
    required  this.name,
    required this. email,
    required this. state,
    required this. country,
    required this. contactProfileUrl,
  }) : super(
          name: name,
          email: email,
          state: state,
          country: country,
          contactProfileUrl: contactProfileUrl,
        );

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      name: json['name']['title'] +
          ' ' +
          json['name']['first'] +
          ' ' +
          json['name']['last'],
      email: json['email'],
      state: json['location']['state'],
      country: CountryCodeService.convertCountryCodeToCountryEnum(json['nat']),
      contactProfileUrl: json['picture']['large'],
    );
  }

  factory ContactModel.fromEntity(ContactEntity contactEntity) {
    return ContactModel(
      name: contactEntity.name,
      email: contactEntity.email,
      state: contactEntity.state,
      country: contactEntity.country,
      contactProfileUrl: contactEntity.contactProfileUrl,
    );
  }

  static List<ContactModel> fromJsonList(List<dynamic> jsonList) {
    List<ContactModel> contactList = [];
    for (var element in jsonList) {
      contactList.add(ContactModel.fromJson(element));
    }
    return contactList;
  }
}
