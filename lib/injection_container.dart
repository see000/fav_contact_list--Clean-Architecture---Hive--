import 'package:dio/dio.dart';
import 'package:fav_contact_list/features/contact_list/data/repository/contact_repository_impl.dart';
import 'package:fav_contact_list/features/contact_list/data/sources/local/database_provider.dart';
import 'package:fav_contact_list/features/contact_list/data/sources/remote/contact_api_service.dart';
import 'package:fav_contact_list/features/contact_list/domain/repository/contact_repository.dart';
import 'package:fav_contact_list/features/contact_list/domain/usescases/get_contact_list.dart';
import 'package:fav_contact_list/features/contact_list/presentation/bloc/contact/remote/remote_contact_bloc.dart';
import 'package:get_it/get_it.dart';
import 'features/contact_list/data/sources/local/contact_favourite_box.dart';
import 'features/contact_list/data/sources/local/contact_favourite_box_service.dart';
import 'features/contact_list/domain/usescases/add_favourite_contact.dart';
import 'features/contact_list/domain/usescases/get_favourite_contact.dart';
import 'features/contact_list/domain/usescases/remove_favourite_contact.dart';
import 'features/contact_list/presentation/bloc/contact/local/local_contact_bloc.dart';

final sl = GetIt.instance;

Future<void> initializedDependencies() async{

  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<DatabaseProvider>(DatabaseProvider());
  sl.registerSingleton<ContactFavouriteBoxService>(ContactFavouriteBox(sl()));
  sl.registerSingleton<ContactApiService>(ContactApiService(sl()));
  sl.registerSingleton<ContactRepository>(ContactRepositoryImpl(sl(),sl()));
  sl.registerSingleton<GetContactListUseCase>(GetContactListUseCase(sl()));

  sl.registerFactory<RemoteContactBloc>(() => RemoteContactBloc(sl()));

  //local contact bloc
  sl.registerSingleton<GetFavouriteContactUseCase >(GetFavouriteContactUseCase (sl()));
  sl.registerSingleton<AddFavouriteContactUseCase  >(AddFavouriteContactUseCase  (sl()));
  sl.registerSingleton<RemoveFavouriteContactUseCase>(RemoveFavouriteContactUseCase(sl()));
  sl.registerFactory<LocalContactBloc>(() => LocalContactBloc(sl(),sl(),sl()));
  
}