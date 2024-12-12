import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/presentation/custom_widgets/cards.dart';

@RoutePage()
class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INNER CIRCLE'),
      ),
      body: const Column(
        children: [
          Row(
            children: [
              CustomCard(),
              CustomCard(),
              CustomCard(),
            ],
          ),
          Row(
            children: [
              CustomCard(),
              CustomCard(),
              CustomCard(),
            ],
          ),
          Row(
            children: [
              CustomCard(),
              CustomCard(),
              CustomCard(),
            ],
          ),
          Row(
            children: [
              CustomCard(),
              CustomCard(),
              CustomCard(),
            ],
          ),
        ],
      ),
    );
  }
}
