import "package:hive_flutter/hive_flutter.dart";

import '../../../../../core/util/country_code_service.dart';
import '../../model/contact.dart';


// This is a hive database provider that will provide the database instance to the repository
class DatabaseProvider {
  static const String contactBoxName = "contact"; // name of the box
  bool _isInitialized = false;
  // Singleton instance of the DatabaseProvider
  static final DatabaseProvider _instance =
      DatabaseProvider._privateConstructor();

  DatabaseProvider._privateConstructor();

  // Private constructor for the singleton pattern
  factory DatabaseProvider() {
    return _instance;
  }

  // Instance of the ContactModel box collection
  late Box<ContactModel> _contactBox;

  Future init() async {
    // Initialize Hive
    
    await Hive.initFlutter();
    

    // Register adapter
    if(!Hive.isAdapterRegistered(1)){
      Hive.registerAdapter(ContactModelAdapter());
    }
    if(!Hive.isAdapterRegistered(2)){
      Hive.registerAdapter(CountryAdapter());
    }
    
    await Hive.openBox<ContactModel>(contactBoxName);
    _isInitialized = true;
    
  }

  // Getter for the ContactModelBox property
 Future<Box<ContactModel>> get contactBox async {
    // If the ContactModel box collection is not created, create and return it

    if (!_isInitialized) {
      await init();
    }

    if (Hive.isBoxOpen(contactBoxName) == false) {
      _contactBox = await Hive.openBox(contactBoxName);
      return _contactBox;
    } else {
      _contactBox = Hive.box<ContactModel>(contactBoxName);
      return _contactBox;
    }
  }




}