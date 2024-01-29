// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code_service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryAdapter extends TypeAdapter<Country> {
  @override
  final int typeId = 2;

  @override
  Country read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Country.australia;
      case 1:
        return Country.brazil;
      case 2:
        return Country.canada;
      case 3:
        return Country.switzerland;
      case 4:
        return Country.germany;
      case 5:
        return Country.denmark;
      case 6:
        return Country.spain;
      case 7:
        return Country.finland;
      case 8:
        return Country.france;
      case 9:
        return Country.greatBritain;
      case 10:
        return Country.ireland;
      case 11:
        return Country.india;
      case 12:
        return Country.iran;
      case 13:
        return Country.mexico;
      case 14:
        return Country.netherlands;
      case 15:
        return Country.norway;
      case 16:
        return Country.newZealand;
      case 17:
        return Country.serbia;
      case 18:
        return Country.turkey;
      case 19:
        return Country.ukraine;
      case 20:
        return Country.unitedStates;
      case 21:
        return Country.unknown;
      default:
        return Country.australia;
    }
  }

  @override
  void write(BinaryWriter writer, Country obj) {
    switch (obj) {
      case Country.australia:
        writer.writeByte(0);
        break;
      case Country.brazil:
        writer.writeByte(1);
        break;
      case Country.canada:
        writer.writeByte(2);
        break;
      case Country.switzerland:
        writer.writeByte(3);
        break;
      case Country.germany:
        writer.writeByte(4);
        break;
      case Country.denmark:
        writer.writeByte(5);
        break;
      case Country.spain:
        writer.writeByte(6);
        break;
      case Country.finland:
        writer.writeByte(7);
        break;
      case Country.france:
        writer.writeByte(8);
        break;
      case Country.greatBritain:
        writer.writeByte(9);
        break;
      case Country.ireland:
        writer.writeByte(10);
        break;
      case Country.india:
        writer.writeByte(11);
        break;
      case Country.iran:
        writer.writeByte(12);
        break;
      case Country.mexico:
        writer.writeByte(13);
        break;
      case Country.netherlands:
        writer.writeByte(14);
        break;
      case Country.norway:
        writer.writeByte(15);
        break;
      case Country.newZealand:
        writer.writeByte(16);
        break;
      case Country.serbia:
        writer.writeByte(17);
        break;
      case Country.turkey:
        writer.writeByte(18);
        break;
      case Country.ukraine:
        writer.writeByte(19);
        break;
      case Country.unitedStates:
        writer.writeByte(20);
        break;
      case Country.unknown:
        writer.writeByte(21);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
