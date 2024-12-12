import "package:dio/dio.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:sample_app/core/utils/api_utils.dart";

class JwtDatasource {
  final apiUtils = ApiUtils();

  Future<dynamic> getJwtData(String email, String password) async {
    final Response response = await apiUtils.getApi(
      baseUrl: dotenv.env["BaseUrl"]!,
      path: "",
    );
    return response;
  }
}
