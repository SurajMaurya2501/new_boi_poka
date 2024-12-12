import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:sample_app/data/datasources/testing_post_api.dart";


@RoutePage()
class ApiPostScreen extends StatefulWidget {
  const ApiPostScreen({super.key});

  @override
  State<ApiPostScreen> createState() => _ApiPostScreenState();
}

class _ApiPostScreenState extends State<ApiPostScreen> {
  final TestingPostApi testingPostApi = TestingPostApi();
  dynamic data = [];
  bool isLoading = true;

  @override
  void initState() {
    testingPostApi.getPostData().then(
      (value) {
        data = value;
        isLoading = false;
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text(
          "Api Post",
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Email - ${data['email']}",
                  ),
                  Text(
                    "Password - ${data['password']}",
                  ),
                ],
              ),
            ),
    );

}
