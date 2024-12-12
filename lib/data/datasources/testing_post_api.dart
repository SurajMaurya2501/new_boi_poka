import "package:sample_app/core/utils/api_utils.dart";

class TestingPostApi {
  final ApiUtils apiUtils = ApiUtils();
  Future<dynamic> getPostData() async => await apiUtils.postApi(
        baseUrl: 'jsonplaceholder.typicode.com',
        path: "/posts/",
        data: {"email": "alex@gmail.com", "password": "alex1234"});
}
