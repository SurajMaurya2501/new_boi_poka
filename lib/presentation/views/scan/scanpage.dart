import 'package:auto_route/auto_route.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/controller/scan_books_controller.dart';
import 'package:sample_app/core/constants/app_routes.dart';
import 'package:sample_app/presentation/custom_widgets/custom_snackbar.dart';
import 'package:sample_app/presentation/provider/book_details_provider.dart';
import 'package:sample_app/presentation/routes/app_router.gr.dart';
import 'package:sample_app/presentation/views/scan/widgets/custom_image_text.dart';
import 'package:sample_app/presentation/views/scan/widgets/custom_isbn_input_box.dart';

class ScanPage extends ConsumerWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isbnController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 250,
            decoration: BoxDecoration(color: Colors.grey.shade100, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(
                  10,
                  10,
                ),
              ),
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'PHOTOS OF YOUR LIBRARY',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomImageText(
                        controller: isbnController,
                        img: 'assets/images/education.png',
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) => CustomIsbnInputBox(
                              isbnController: isbnController,
                            ),
                          );
                          if (isbnController.text.trim().isNotEmpty) {
                            final bookData = await _fetchAndNavigate(
                                isbnController.text.trim(), context);

                            //Storing and passing data to BookDetailsRiverPod to
                            //Call Api for getting details of searchedBook
                            ref.read(isbnProvider.notifier).state =
                                isbnController.text.trim();
                            ref.read(titleProvider.notifier).state =
                                bookData!['title'];
                            ref.read(authorsProvider.notifier).state =
                                bookData['authors'];
                            isbnController.clear();
                          }
                        },
                        text: 'Enter ISBN Number'),
                    const SizedBox(
                      height: 180,
                      child: VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                    ),
                    CustomImageText(
                      img: 'assets/images/barcode.png',
                      onTap: () async {
                        String? scannedISBN = await openBarcodeScanner();
                        if (scannedISBN != null && scannedISBN.isNotEmpty) {
                          await _fetchAndNavigate(scannedISBN, context);
                        }
                      },
                      text: 'Scan Barcode',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>?> _fetchAndNavigate(
      String isbn, BuildContext context) async {
    final scanBooksController = ScanBooksController();
    final bookDetails = await scanBooksController.getBookDetails(isbn);
    if (bookDetails != null) {
      // isbnController.clear();
      context.pushRoute(
        PageRouteInfo(
          AppRoutes.bookDetails,
          args: BookDetailsRouteArgs(
            bookDetails: bookDetails,
            isbnNumber: isbn,
          ),
        ),
      );
    } else {
      customSnackbarMsg(
          textToShow: "No book details found for ISBN: $isbn",
          durationInMilliseconds: 4000,
          context: context);
    }
    return bookDetails;
  }

  Future<String?> openBarcodeScanner() async {
    try {
      var result = await BarcodeScanner.scan();
      return result.rawContent;
    } catch (e) {
      return null;
    }
  }
}

// @RoutePage()
// class ScanPage extends StatefulWidget {
//   const ScanPage({super.key});

//   @override
//   _ScanPageState createState() => _ScanPageState();
// }

// class _ScanPageState extends State<ScanPage> {
//   final isbnController = TextEditingController();

//   @override
//   void dispose() {
//     isbnController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.all(10.0),
//             height: 250,
//             decoration: BoxDecoration(color: Colors.grey.shade100, boxShadow: [
//               BoxShadow(
//                 color: Colors.grey,
//                 blurRadius: 5,
//                 offset: Offset(
//                   10,
//                   10,
//                 ),
//               ),
//             ]),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.add,
//                     ),
//                     const SizedBox(width: 6),
//                     const Text(
//                       'PHOTOS OF YOUR LIBRARY',
//                       style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     CustomImageText(
//                         controller: isbnController,
//                         img: 'assets/images/education.png',
//                         onTap: () async {
//                           await showISBNInputDialog();
//                           if (isbnController.text.trim().isNotEmpty) {
//                             await _fetchAndNavigate(
//                                 isbnController.text.trim(), context);
//                           }
//                         },
//                         text: 'Enter ISBN Number'),
//                     const SizedBox(
//                       height: 180,
//                       child: VerticalDivider(
//                         color: Colors.grey,
//                         thickness: 2,
//                       ),
//                     ),
//                     CustomImageText(
//                       img: 'assets/images/barcode.png',
//                       onTap: () async {
//                         String? scannedISBN = await openBarcodeScanner();
//                         if (scannedISBN != null && scannedISBN.isNotEmpty) {
//                           await _fetchAndNavigate(scannedISBN, context);
//                         }
//                       },
//                       text: 'Scan Barcode',
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
