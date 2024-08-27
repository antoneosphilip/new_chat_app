// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_friend_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _SearchFriendApiService implements SearchFriendApiService {
  _SearchFriendApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://syncord.koyeb.app';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AddFriendResponseModel> addFriend(
      AddFriendBodyModel addFriendBodyModel) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(addFriendBodyModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddFriendResponseModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/FriendShip/Send-request',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = AddFriendResponseModel.fromJson(_result.data!);
    return _value;
  }

  @override
  Future<List<SearchFriendModel>> searchFriend(String searchKey) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'search': searchKey};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<SearchFriendModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/FriendShip/Search',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var _value = _result.data!
        .map((dynamic i) =>
            SearchFriendModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return _value;
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
