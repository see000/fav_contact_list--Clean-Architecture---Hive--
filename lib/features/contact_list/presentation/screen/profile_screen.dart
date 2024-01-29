import 'package:fav_contact_list/custom_router.dart';
import 'package:fav_contact_list/features/contact_list/presentation/bloc/contact/local/local_contact_state.dart';
import 'package:fav_contact_list/features/contact_list/presentation/widgets/contact_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/country_code_service.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/contact_entity.dart';
import '../bloc/contact/local/local_contact_bloc.dart';
import '../bloc/contact/local/local_contact_event.dart';

class ProfileScreen extends StatelessWidget {
  final ContactEntity contactEntity;
  const ProfileScreen({super.key, required this.contactEntity});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => sl<LocalContactBloc>(),
      child:  Scaffold(
          appBar: _buildAppBar(context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, contactEntity),
              _buildContactInfo('Email', contactEntity.email!),
              _buildContactInfo('State', contactEntity.state!),
              _buildContactInfo('Country', CountryCodeService.getCountryName(contactEntity.country!)),
            ],
          ),
        )
    );
  }
}

AppBar _buildAppBar (BuildContext context){
  return AppBar(
    title: const Text('Profile Overview'),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: (){
        CustomRouter.navigateBack(context);
      },
    )
  );
}

Widget _buildHeader (BuildContext context,ContactEntity contactEntity, ) {
  bool isInitialized = false;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    child: Center(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: -20,
                top: -10,
                child: BlocBuilder<LocalContactBloc, LocalContactState>(
                  builder: (context, state) {
                    if(isInitialized == false){
                       BlocProvider.of<LocalContactBloc>(context).add(const GetFavouriteContacts());
                       isInitialized = true;
                    }
                           
                    bool isFavourite = false;
                    if(state is LocalContactLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is LocalContactLoaded && state.contacts!.isNotEmpty) {
                      for (var contact in state.contacts!) {
                        if (contact.name == contactEntity.name) {
                          isFavourite = true;
                          break;
                        }
                      }
                    }
                    return IconButton(
                      icon: Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red ,
                        size: 25,
                      ),
                      onPressed: (){
                        isFavourite ? BlocProvider.of<LocalContactBloc>(context).add(RemoveFavouriteContact(contactEntity)) :
                        BlocProvider.of<LocalContactBloc>(context).add(AddFavouriteContact(contactEntity));
                      },
                    );
                  }
                ),
              ),
              ContactProfileImage(contactEntity: contactEntity, height: 150, width: 150, ),
              
            ],
          ),
          const SizedBox(height: 10,),
          Text(contactEntity.name!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ],
      ),
    ),
  );
}

Widget _buildContactInfo (String title, String value) {
  return Padding(
    padding: const EdgeInsets.only( left: 20.0, top: 5),
    child: Wrap(
      direction: Axis.vertical,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        Text(value),
      ],
    ),
  );
}