import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/core/constants/app_routes.dart';

@RoutePage()
class Selectandregister extends StatefulWidget {
  const Selectandregister({super.key});

  @override
  State<Selectandregister> createState() => _SelectandregisterState();
}

class _SelectandregisterState extends State<Selectandregister> {
  final List<String> _titles = [
    "Individual",
    "Book Store",
    "Library",
    "Book Club",
    "Publisher",
    "Educator"
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'BOI-POKA',
              style: TextStyle(
                  fontFamily: "Playfair Display",
                  fontWeight: FontWeight.w500,
                  fontSize: 40),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'I want to join as an...',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 5.0),
              itemBuilder: (context, index) {
                return Card(
                  shape: const CircleBorder(),
                  elevation: 5.0,
                  child: IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        _selectedIndex == index
                            ? const Color.fromARGB(255, 132, 225, 215)
                            : const Color.fromARGB(255, 223, 221, 221),
                      ),
                    ),
                    onPressed: () {
                      _selectedIndex = index;
                      setState(() {});
                    },
                    icon: Text(
                      _titles[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 45,
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                context.pushRoute(
                  PageRouteInfo(
                    AppRoutes.signup,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 232, 27)),
              child: const Text(
                'REGISTER',
                style: TextStyle(
                  fontFamily: "Playfair Display",
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            height: 45,
            width: 160,
            child: ElevatedButton(
                onPressed: () {
                  context.pushRoute(
                    PageRouteInfo(
                      AppRoutes.signin,
                    ),
                  );
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    255,
                    232,
                    27,
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontFamily: "Playfair Display",
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
