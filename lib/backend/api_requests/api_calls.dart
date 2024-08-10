import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class WeatherAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Weather API',
      apiUrl:
          'https://api.weatherapi.com/v1/current.json?key=c40e8faa15f843a99ae41737240808&q=New Delhi&aqi=yes',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? weatherLocation(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.location.name''',
      ));
  static String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.location.localtime''',
      ));
  static double? tempCelcius(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.current.temp_c''',
      ));
  static double? tempFahrenheit(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.current.temp_f''',
      ));
  static String? weatherCondition(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.current.condition.text''',
      ));
  static double? windmph(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.current.wind_mph''',
      ));
  static double? windkph(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.current.wind_kph''',
      ));
  static String? windDirection(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.current.wind_dir''',
      ));
  static double? precipitationMM(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.current.precip_mm''',
      ));
  static dynamic airQuality(dynamic response) => getJsonField(
        response,
        r'''$.current.air_quality''',
      );
  static int? humidity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.current.humidity''',
      ));
  static String? weatherImage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.current.condition.icon''',
      ));
}

class NewsAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'News API',
      apiUrl:
          'https://newsdata.io/api/1/news?apikey=pub_504741a6520c46ca634a2a223a0228d92de2f&q=Agriculture&country=bd,cn,in,id,us&language=en,hi,ta,te,ur&category=domestic,environment,food,other,politics',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? newsTitle(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? newsLink(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? newsAuthor(dynamic response) => getJsonField(
        response,
        r'''$.results[:].creator''',
        true,
      ) as List?;
  static List<String>? newsDescription(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? newsDate(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].pubDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? newsImage(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].image_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? newsIcon(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].source_icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? newsLanguage(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].language''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? newsCountry(dynamic response) => getJsonField(
        response,
        r'''$.results[:].country''',
        true,
      ) as List?;
  static List? newsCategory(dynamic response) => getJsonField(
        response,
        r'''$.results[:].category''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
