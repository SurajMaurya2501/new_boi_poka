import 'package:flutter/material.dart';
import 'package:sample_app/presentation/custom_widgets/common_appbar.dart';
import 'package:sample_app/presentation/views/mylibrary/ebook.dart';

class Mylibrary extends StatefulWidget {
  const Mylibrary({super.key});

  @override
  State<Mylibrary> createState() => _MylibraryState();
}

class _MylibraryState extends State<Mylibrary> {
  final List<Map<String, String>> items = [
    {'text1': 'Learning from tomorrow', 'text2': 'EDES,BART'},
    {'text1': 'Learning from tomorrow', 'text2': 'EDES,BART'},
    {'text1': 'Learning from tomorrow', 'text2': 'EDES,BART'},
    {'text1': 'Learning from tomorrow', 'text2': 'EDES,BART'},
    {'text1': 'Learning from tomorrow', 'text2': 'EDES,BAnRT'},
    {'text1': 'Learning from tomorrow', 'text2': 'EDES,BART'},
    {'text1': 'Learning from tomorrow', 'text2': 'EDES,BART'},
    {'text1': 'Learning from tomorrow', 'text2': 'EDES,BART'},
    {'text1': 'Learning from tomorrow', 'text2': 'EDES,BART'},
    {'text1': 'Learning from tomorrow', 'text2': 'EDES,BART'},
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'BP'),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text('Physical'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text('E-Book'),
              ),
            ],
          ),
          if (selectedIndex == 0)
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  bool showIcon = index == 3 || index == 5;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 60,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index]['text1'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  items[index]['text2'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (showIcon)
                            const Icon(Icons.done, color: Colors.grey),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          if (selectedIndex == 1)
            const Expanded(
              child: Ebook(),
            ),
        ],
      ),
    );
  }
  
}
