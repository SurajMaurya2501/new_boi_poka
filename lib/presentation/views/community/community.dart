import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: CommonAppBar(title: 'BP'),
        );
  }
}
