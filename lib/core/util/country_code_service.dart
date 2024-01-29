import 'package:hive_flutter/hive_flutter.dart';
part 'country_code_service.g.dart';

@HiveType(typeId: 2)
enum Country {
  @HiveField(0)
  australia,
  @HiveField(1)
  brazil,
  @HiveField(2)
  canada,
  @HiveField(3)
  switzerland,
  @HiveField(4)
  germany,
  @HiveField(5)
  denmark,
  @HiveField(6)
  spain,
  @HiveField(7)
  finland,
  @HiveField(8)
  france,
  @HiveField(9)
  greatBritain,
  @HiveField(10)
  ireland,
  @HiveField(11)
  india,
  @HiveField(12)
  iran,
  @HiveField(13)
  mexico,
  @HiveField(14)
  netherlands,
  @HiveField(15)
  norway,
  @HiveField(16)
  newZealand,
  @HiveField(17)
  serbia,
  @HiveField(18)
  turkey,
  @HiveField(19)
  ukraine,
  @HiveField(20)
  unitedStates,
  @HiveField(21)
  unknown,
}

class CountryCodeService {
  const CountryCodeService();

  static Country convertCountryCodeToCountryEnum(String countryCode) {
    countryCode = countryCode.toLowerCase();
    switch (countryCode) {
      case 'au':
        return Country.australia;
      case 'br':
        return Country.brazil;
      case 'ca':
        return Country.canada;
      case 'ch':
        return Country.switzerland;
      case 'de':
        return Country.germany;
      case 'dk':
        return Country.denmark;
      case 'es':
        return Country.spain;
      case 'fi':
        return Country.finland;
      case 'fr':
        return Country.france;
      case 'gb':
        return Country.greatBritain;
      case 'ie':
        return Country.ireland;
      case 'in':
        return Country.india;
      case 'ir':
        return Country.iran;
      case 'mx':
        return Country.mexico;
      case 'nl':
        return Country.netherlands;
      case 'no':
        return Country.norway;
      case 'nz':
        return Country.newZealand;
      case 'rs':
        return Country.serbia;
      case 'tr':
        return Country.turkey;
      case 'ua':
        return Country.ukraine;
      case 'us':
        return Country.unitedStates;
      default:
        return Country.unknown;
    }
  }

  static String getCountryName(Country country) {
    switch (country) {
      case Country.australia:
        return 'Australia';
      case Country.brazil:
        return 'Brazil';
      case Country.canada:
        return 'Canada';
      case Country.switzerland:
        return 'Switzerland';
      case Country.germany:
        return 'Germany';
      case Country.denmark:
        return 'Denmark';
      case Country.spain:
        return 'Spain';
      case Country.finland:
        return 'Finland';
      case Country.france:
        return 'France';
      case Country.greatBritain:
        return 'Great Britain';
      case Country.ireland:
        return 'Ireland';
      case Country.india:
        return 'India';
      case Country.iran:
        return 'Iran';
      case Country.mexico:
        return 'Mexico';
      case Country.netherlands:
        return 'Netherlands';
      case Country.norway:
        return 'Norway';
      case Country.newZealand:
        return 'New Zealand';
      case Country.serbia:
        return 'Serbia';
      case Country.turkey:
        return 'Turkey';
      case Country.ukraine:
        return 'Ukraine';
      case Country.unitedStates:
        return 'United States';
      default:
        return 'Unknown';
    }
  }
}
