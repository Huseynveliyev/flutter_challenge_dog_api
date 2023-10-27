import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // options.baseUrl = ApiConfigs.baseUrl;
    String queryParamteres = '';
    for (String key in options.queryParameters.keys) {
      queryParamteres +=
          '?$key=${options.queryParameters[key]}${options.queryParameters[key] != options.queryParameters.keys.last ? '' : '& '}';
    }
    if (kDebugMode) {
      log(
        name: '  Request ',
        '''
${('Url       : [${options.method}] ${options.baseUrl}${options.path}$queryParamteres')}
${('Data      : ${options.data}')}
${('Token     : ${options.headers["Authorization"]}')}
${('Language  : ${options.headers["Accept-Language"]}')}
''',
      );
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      log(name: '   Error  ', '''
${('StatusCode: ${err.response?.statusCode}')}
${('StatusMsg : ${err.response?.statusMessage}')}
${('Message   : ${err.message}')}
${('Type      : ${err.type}')}
${('Data      : ${err.response?.data}')}
${('Headers   : ${err.response?.headers}')}
''');
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      log(name: ' Response ', '''
${('Url       : [${response.requestOptions.method}] ${response.requestOptions.path}')}
${('StatusCode: ${response.statusCode}')}
${('StatusMsg : ${response.statusMessage}')}
${('Data      : ${prettyJson(response.data)}')}
''');
    }
    super.onResponse(response, handler);
  }
}

String prettyJson(dynamic input) {
  if (input is! String) {
    input = json.encode(input);
  }
  if (input.length < 5) return '';
  if (input[0] != '{') return input;
  const decoder = JsonDecoder();
  const encoder = JsonEncoder.withIndent('  ');

  var object = decoder.convert(input);
  var prettyString = encoder.convert(object);
  return prettyString;
}