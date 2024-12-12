import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/core/constants/app_routes.dart';

@RoutePage()
class InnerCircle extends StatefulWidget {
  const InnerCircle({super.key});

  @override
  State<InnerCircle> createState() => _InnerCircleState();
}

class _InnerCircleState extends State<InnerCircle> {
  final List<String> contacts = [
    'AATSI DESAI',
    'AATSI DESAI',
    'AATSI DESAI',
    'AATSI DESAI',
    'AATSI DESAI',
    'AATSI DESAI',
    'AATSI DESAI',
    'AATSI DESAI',
  ];

  late List<bool> isSelected;

  bool isAllSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = List<bool>.filled(contacts.length, false);
  }

  void toggleSelectAll(bool? value) {
    setState(() {
      isAllSelected = value ?? false;
      isSelected = List<bool>.filled(contacts.length, isAllSelected);
    });
  }

  void toggleSelectIndividual(int index, bool? value) {
    setState(() {
      isSelected[index] = value ?? false;
      isAllSelected = isSelected.every((selected) => selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INNER CIRCLE'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildSectionTitle('INVITATIONS'),
                  const Divider(thickness: 1),
                  _buildInvitationTile(),
                  const Divider(thickness: 1),
                  const SizedBox(
                    height: 25,
                  ),
                  _buildSectionTitleWithSelectAll(),
                  const Divider(thickness: 1),
                  _buildContactsList(),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAllSelected = false;
                      isSelected = List<bool>.filled(contacts.length, false);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: const Text('DESELECT'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.pushRoute(
                      PageRouteInfo(
                        AppRoutes.invite,
                      ),
                    );
                   
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: const Text('INVITE'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitleWithSelectAll() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'INVITE CONTACTS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Row(
              children: [
                const Text('Select All'),
                Checkbox(
                  value: isAllSelected,
                  onChanged: toggleSelectAll,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvitationTile() {
    return ListTile(
      leading: const Icon(Icons.person),
      title: const Text('AATSI DESAI'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.check_circle_outline, color: Colors.green),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.cancel_sharp, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildContactsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(contacts[index]),
              trailing: Checkbox(
                value: isSelected[index],
                onChanged: (value) => toggleSelectIndividual(index, value),
              ),
            ),
            const Divider(thickness: 1),
          ],
        );
      },
    );
  }
}
