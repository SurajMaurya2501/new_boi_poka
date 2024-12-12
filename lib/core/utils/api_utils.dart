import "dart:developer";

import "package:dio/dio.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:sample_app/data/datasources/secure_storage_impl.dart";

class ApiUtils {
  ApiUtils() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          // Add the Authorization header with token to each request

          if (/*await jwtController.checkJwtExpiry() */ true) {
            final String? token = await _storage.readJwtToken();
            if (token != null) {
              options.headers["Authorization"] = "Bearer $token";
            }

            return handler
                .next(options); // Pass the request to the next interceptor
          }
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler
              .next(response); // Pass the response to the next handler
        },
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          // Handle token refresh on 401 error
          if (error.response?.statusCode == 401) {
            try {
              final String? newToken = await _refreshToken();
              if (newToken != null) {
                await _storage.saveSecureData("jwt_token", newToken);
                error.requestOptions.headers["Authorization"] =
                    "Bearer $newToken";
                final Response response =
                    await dio.fetch(error.requestOptions); // Retry the request
                return handler.resolve(response); // Resolve with the response
              }
            } catch (e) {
              return handler.reject(error); // Reject if token refresh fails
            }
          }
          return handler.next(error); // Continue with the error if not a 401
        },
      ),
    );
  }

  final Dio dio = Dio();
  final SecureStorage _storage = SecureStorage();

  Future<dynamic> getApi(
      {required String baseUrl,
      required String path,
      Map<String, String>? query}) async {
    try {
      final Uri uri = Uri.https(baseUrl, path, query);
      log("Uri - ${uri.toString()}");
      final Response response = await dio.getUri(uri, options: Options());
      return getResponseWithStatusCode(response: response);
    } catch (e) {
      throw Exception("Error Occured While Fetching Api:$e");
    }
  }

  Future<dynamic> postApi(
      {required String path,
      required Map<String, dynamic> data,
      String? baseUrl,
      Map<String, String>? query}) async {
    try {
      baseUrl = baseUrl ?? dotenv.env["BaseUrl"]!;
      final Uri uri = Uri.http(baseUrl, path, query);
      final Response response = await dio.postUri(
        uri,
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          }, // Optional: Custom headers
        ),
      );
      return getResponseWithStatusCode(response: response);
    } catch (e) {
      throw Exception("Error Occured While Calling Post Api:$e");
    }
  }

  Future<dynamic> putApi(
      {required String path,
      required Map<String, dynamic> data,
      String? baseUrl,
      Map<String, String>? query}) async {
    try {
      baseUrl = baseUrl ?? dotenv.env["BaseUrl"]!;
      final Uri uri = Uri.http(baseUrl, path, query);
      final Response response = await dio.putUri(
        uri,
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          }, // Optional: Custom headers
        ),
      );
      return getResponseWithStatusCode(response: response);
    } catch (e) {
      throw Exception("Error Occurred While Calling PUT Api: $e");
    }
  }

  Future<dynamic> patchApi(
      {required String path,
      required Map<String, dynamic> data,
      String? baseUrl,
      Map<String, String>? query}) async {
    try {
      baseUrl = baseUrl ?? dotenv.env["BaseUrl"]!;
      final Uri uri = Uri.http(baseUrl, path, query);
      final Response response = await dio.patchUri(
        uri,
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          }, // Optional: Custom headers
        ),
      );
      return getResponseWithStatusCode(response: response);
    } catch (e) {
      throw Exception("Error Occurred While Calling PATCH Api: $e");
    }
  }

  Future<dynamic> deleteApi(
      {required String path,
      Map<String, dynamic>? data,
      String? baseUrl,
      Map<String, String>? query}) async {
    try {
      baseUrl = baseUrl ?? dotenv.env["BaseUrl"]!;
      final Uri uri = Uri.http(baseUrl, path, query);
      final Response response = await dio.deleteUri(
        uri,
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          }, // Optional: Custom headers
        ),
      );
      return getResponseWithStatusCode(response: response);
    } catch (e) {
      throw Exception("Error Occurred While Calling DELETE Api: $e");
    }
  }

  dynamic getResponseWithStatusCode({required Response<dynamic> response}) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data; // Success
      case 400:
        throw Exception("Bad request. Please check your input.");
      case 401:
        throw Exception("Unauthorized. Please log in again.");
      case 403:
        throw Exception("Forbidden. You do not have access.");
      case 404:
        throw Exception("Resource not found.");
      case 408:
        throw Exception("Request timed out. Please try again.");
      case 500:
        throw Exception("Internal server error. Please try again later.");
      case 502:
      case 503:
      case 504:
        throw Exception("Service unavailable. Please try again later.");
      default:
        throw Exception("Unexpected error: ${response.statusCode}");
    }
  }

  Future<String?> _refreshToken() async => "new_token";
}
