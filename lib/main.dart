import 'package:fav_contact_list/config/theme.dart';
import 'package:fav_contact_list/features/contact_list/presentation/bloc/contact/remote/remote_contact_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/contact_list/presentation/bloc/contact/local/local_contact_bloc.dart';
import 'features/contact_list/presentation/bloc/contact/local/local_contact_event.dart';
import 'features/contact_list/presentation/bloc/contact/remote/remote_contact_bloc.dart';
import 'features/contact_list/presentation/screen/home_screen.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  initializedDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      
      home: MultiBlocProvider(
        providers: [
          BlocProvider<RemoteContactBloc>(
            create: (context) => sl()..add(const GetContacts()),
          ),
          BlocProvider<LocalContactBloc>(
            create: (context) => sl()..add(const GetFavouriteContacts()),
          ),
        ],
        child: const HomeScreen(),
      ),
  
    );

  }
}


