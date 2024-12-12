import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/presentation/custom_widgets/cards.dart';
import 'package:sample_app/presentation/custom_widgets/radar_chart.dart';
import 'package:sample_app/presentation/views/profile/widgets/inner_circle.dart';

@RoutePage()
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.arrow_back_ios),
        title: const Text(
          'MEERA',
        ),
        actions: [
          TextButton(
            style: const ButtonStyle(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InnerCircle(),
                ),
              );
            },
            child: const Text(
              'INNER CIRCLE',
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 5),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Row(
                            children: [
                              Text(
                                'MEERA DATTA',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                  text: "220\n",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                                TextSpan(
                                  text: 'IN HER CIRCLES',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )
                              ]),
                            ),
                            const SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                            ),
                            RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                  text: "04\n",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                                TextSpan(
                                  text: 'READING BUDDY\nMATCHES',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )
                              ]),
                            ),
                            const SizedBox(
                              height: 30,
                              child: VerticalDivider(
                                thickness: 2,
                                color: Colors.black,
                              ),
                            ),
                            RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                  text: "40K\n",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                                TextSpan(
                                  text: 'KARMA POINTS',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10),
                                )
                              ]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 15, 12, 15),
              child: Row(
                children: [
                  Text(
                    'YOUR READING PERSONA',
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: ReadingPersonaChart(),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Container(
                height: 50,
                color: Colors.yellow.shade900,
                child: const Center(
                  child: Text(
                    'OPEN TO CURATION HELP',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Container(
                height: 50,
                color: Colors.yellow.shade900,
                child: const Center(
                  child: Text(
                    'OPEN FOR ORGANISING BOOK CLUB',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    'Books loaned',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCard(),
                    CustomCard(),
                    CustomCard(),
                    CustomCard(),
                    CustomCard(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    'Books borrowed',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCard(),
                    CustomCard(),
                    CustomCard(),
                    CustomCard(),
                    CustomCard(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    'Books taken on rent',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomCard(),
                  CustomCard(),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    'Book clubs you might be interested in',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const SingleChildScrollView(
                child: Row(
                  children: [
                    CustomCard(),
                    CustomCard(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    'Book clubs you are part of',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const SingleChildScrollView(
                child: Row(
                  children: [
                    CustomCard(),
                    CustomCard(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
