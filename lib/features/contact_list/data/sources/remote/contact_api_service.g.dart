// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ContactApiService implements ContactApiService {
  _ContactApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://randomuser.me/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<ContactModel>>> getContacts({
    required String includeFields,
    int? limitUpTo,
    String? seed = kContactApiSeed,
  }) async {

    bool networkConnected = await NetworkService.isInternetConnected();
    if(!networkConnected){
      throw DioException(requestOptions: RequestOptions(), error: 'No Internet Connection');
    }

    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'inc': includeFields,
      r'results': limitUpTo,
      r'seed': seed,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<List<ContactModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/1.4',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = ContactModel.fromJsonList(_result.data!['results']);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
