import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/contact_entity.dart';

class ContactProfileImage extends StatelessWidget {
  final ContactEntity contactEntity;
  final double height;
  final double width;
  final VoidCallback? onTap;
  
  const ContactProfileImage({
    super.key, 
    required this.contactEntity,
    this.height = 100,
    this.width = 100,
    this.onTap

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
      
        imageUrl: contactEntity.contactProfileUrl!,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        ),
        height: height,
        width: width,
      ),
    );
  }

}