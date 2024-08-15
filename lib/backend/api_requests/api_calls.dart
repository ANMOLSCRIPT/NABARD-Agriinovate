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

class PriceAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Price API',
      apiUrl:
          'https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=579b464db66ec23bdd000001cdc3b564546246a772a26393094f5645&offset=0&limit=all&format=csv&format=json',
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

  static List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
  static List<String>? state(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].state''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? district(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].district''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? market(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].market''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? commodity(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].commodity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? variety(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].variety''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? arrivalDate(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].arrival_date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? minPrice(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].min_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? maxPrice(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].max_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? modalPrice(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].modal_price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? createdDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.created_date''',
      ));
  static String? updatedDate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.updated_date''',
      ));
  static List<String>? orgHeading(dynamic response) => (getJsonField(
        response,
        r'''$.org''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? dataSource(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.source''',
      ));
  static String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title''',
      ));
  static List<String>? sector(dynamic response) => (getJsonField(
        response,
        r'''$.sector''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SampleDataCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'SampleData',
      apiUrl: 'https://anmolscript.github.io/SampleData/data.json',
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

  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? amount(dynamic response) => (getJsonField(
        response,
        r'''$[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? sender(dynamic response) => (getJsonField(
        response,
        r'''$[:].sender''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
