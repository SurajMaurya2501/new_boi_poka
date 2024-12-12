import 'package:flutter/material.dart';
import 'package:sample_app/core/utils/api_utils.dart';

class DismissibleListScreen extends StatefulWidget {
  const DismissibleListScreen({super.key});

  @override
  State<DismissibleListScreen> createState() => _DismissibleListScreenState();
}

class _DismissibleListScreenState extends State<DismissibleListScreen> {
  dynamic apiData = [];
  final apiUtilsController = ApiUtils();
  bool isLoading = true;

  @override
  void initState() {
    apiUtilsController
        .getApi(baseUrl: "jsonplaceholder.typicode.com", path: "/todos/")
        .then(
      (value) {
        apiData = value;
        isLoading = false;
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dismissble Screen",
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              // print("Direction - ")
            },
            key: Key(
              index.toString(),
            ),
            child: ListTile(
              title: Text("Sample"),
              leading: Text("1"),
            ),
          );
        },
      ),
    );
  }
}
