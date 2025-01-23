import 'package:dio/dio.dart';

import '../constants/app_constants.dart';
import 'api_exceptions.dart';
import 'api_interceptors.dart';


/// A base class for API services
abstract class BaseApiService {
  final Dio _dio;

  BaseApiService()
      : _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)) {
    _dio.interceptors.add(ApiInterceptor()); // Add interceptors for each API service
  }

  /// Makes a GET request
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParameters);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Makes a POST request
  Future<dynamic> post(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Handles the response from the server
  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.data; // Return the response data if successful
    } else {
      throw ApiException('Unexpected error occurred', statusCode: response.statusCode);
    }
  }

  /// Handles API errors and throws custom exceptions
  ApiException _handleError(DioException error) {
    String message = 'An error occurred';
    int? statusCode = error.response?.statusCode;

    message = (error.type == DioExceptionType.unknown)?'Network Error':(error.response?.data['message'] ?? message);
    

    return ApiException(message, statusCode: statusCode);
  }
}
