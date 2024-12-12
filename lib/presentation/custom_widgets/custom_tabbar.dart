import "package:flutter/material.dart";
import "package:sample_app/core/constants/app_colors.dart";

class CustomTabbar extends StatelessWidget {
  const CustomTabbar(
      {super.key,
      required this.tabs,
      required this.indicatorColor,
      required this.labelColor,
      required this.screens});
  final List<String> tabs;
  final Color indicatorColor;
  final Color labelColor;
  final List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    final double tabLabelPadding = 10;
    final Color indicatorColor = AppColors.primaryColor;
    final Color labelColor = Colors.white;

    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: TabBar(
              isScrollable: tabs.length > 3 ? true : false,
              indicator: BoxDecoration(color: indicatorColor),
              labelPadding: EdgeInsets.all(tabLabelPadding),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: labelColor,
              indicatorColor: indicatorColor,
              dividerColor: Colors.transparent,
              onTap: (int value) {
                selectedIndex = value;
              },
              tabs: List.generate(
                tabs.length,
                (int index) => Text(tabs[index]),
              ).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: screens,
            ),
          ),
        ],
      ),
    );
  }
}
