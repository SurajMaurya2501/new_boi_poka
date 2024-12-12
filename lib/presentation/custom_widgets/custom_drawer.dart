import "package:flutter/material.dart";
import "package:sample_app/core/constants/app_typography.dart";

class CustomDrawer extends StatelessWidget {
  final Color backgroundColor;
  final List<Map<String, dynamic>> menuItems;
  final String userName;
  const CustomDrawer(
      {required this.backgroundColor,
      required this.menuItems,
      required this.userName,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: backgroundColor,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50,
                  ),
                  Text(
                    userName,
                    style: AppTypography.typo16WhiteRegular,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  padding: const EdgeInsets.all(5.0),
                  shrinkWrap: true,
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      leading: Icon(
                        menuItems[index]['icon'],
                        color: backgroundColor,
                      ),
                      title: Text(
                        menuItems[index]['item'],
                        style: TextStyle(color: backgroundColor),
                      ),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
