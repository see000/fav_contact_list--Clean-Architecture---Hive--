import 'package:dio/dio.dart';
import 'package:fav_contact_list/core/constants/contact_api/contact_api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/network/network_service.dart';
import '../../model/contact.dart';


part 'contact_api_service.g.dart';

/// '1.4' is the latest version of api
/// with seed, api will return same data set every time
/// to know more info : https://randomuser.me/documentation#seeds

@RestApi(baseUrl: kContactApiBaseUrl)
abstract class ContactApiService {

  factory ContactApiService(Dio dio) = _ContactApiService;
 
  @GET(kContactApiVersion)
  Future<HttpResponse<List<ContactModel>>> getContacts({
    @Query('inc') required String includeFields,
    @Query('results') int? limitUpTo,
    @Query('seed') String? seed = kContactApiSeed,
  });
}
