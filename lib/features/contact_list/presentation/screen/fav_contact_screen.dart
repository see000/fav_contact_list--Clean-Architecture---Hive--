import 'package:fav_contact_list/custom_router.dart';
import 'package:fav_contact_list/features/contact_list/presentation/bloc/contact/local/local_contact_state.dart';
import 'package:fav_contact_list/features/contact_list/presentation/widgets/contact_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/contact_entity.dart';
import '../bloc/contact/local/local_contact_bloc.dart';
import '../bloc/contact/local/local_contact_event.dart';

class FavContactScreen extends StatefulWidget {
  const FavContactScreen({super.key});

  @override
  State<FavContactScreen> createState() => _FavContactScreenState();

}

class _FavContactScreenState extends State<FavContactScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocalContactBloc>(context).add(const GetFavouriteContacts());
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<LocalContactBloc, LocalContactState>(
        builder: (context, state) {
      if (state is LocalContactLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is LocalContactLoaded && state.contacts!.isNotEmpty) {
        return _buildFavouriteListTile(context, state.contacts!);
      } else  if(state is LocalContactLoaded && state.contacts!.isEmpty){
        return const Center(child: Text('Your favourite list is empty'));
      }else{
        return const Center(child: Text('Oops..Something went wrong'));
      }
    });
  }


}

Widget _buildFavouriteListTile(
    BuildContext context, List<ContactEntity> contacts) {
  return ListView.builder(
    itemCount: contacts.length,
    itemBuilder: (context, i) {
      return Dismissible(
        key: Key(contacts[i].name!),
        confirmDismiss: (direction) {
          if (direction == DismissDirection.endToStart) {
            return Future.value(true);
          } else {
            return Future.value(false);
          }
        },
        onDismissed: (direction){
          if(direction == DismissDirection.endToStart){
            BlocProvider.of<LocalContactBloc>(context).add(RemoveFavouriteContact(contacts[i]));
            //show snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${contacts[i].name} removed from favourite list'),
                duration: const Duration(seconds: 1),
              ),
            );
          
          }else{
            return;
          }
          
        },
        
        child: 
   
        InkWell(
          onTap: () => CustomRouter.navigateToProfileScreen(context, contacts[i]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: ContactProfileImage(
                    contactEntity: contacts[i],
                  
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 3,
                  child: Text(contacts[i].name!, style: const TextStyle(fontSize: 16),),),
              ],
            ),
          ),
        ),
      );
    },
  );
}
