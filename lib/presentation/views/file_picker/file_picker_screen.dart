import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/core/constants/app_colors.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  bool isImageAvail = false;
  File? selectedFile;
  List<File>? selectedFileList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "File Picker Screen",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: singleFilePickerScreen(),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Multiple File Picker",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                if (selectedFileList != null)
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 250,
                    width: double.infinity,
                    child: GridView.builder(
                        itemCount: selectedFileList!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 4,
                            childAspectRatio: 0.8),
                        itemBuilder: (context, index) {
                          return Image.file(
                            selectedFileList![index],
                            fit: BoxFit.cover,
                          );
                        }),
                  ),
                InkWell(
                  onTap: () {
                    pickFile().whenComplete(
                      () {
                        setState(() {});
                      },
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 50,
                    // padding: EdgeInsets.all(
                    //   10.0,
                    // ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Pick File",
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget singleFilePickerScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Single File Picker",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(
              width: 2,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          child: Text(
            "Selected Image",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            pickFile().whenComplete(
              () {
                setState(() {});
              },
            );
          },
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(
                5.0,
              ),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Pick File",
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future pickFile() async {
    isImageAvail = false;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result != null && result.files.length == 1) {
      isImageAvail = true;
      selectedFile = File(result.files.single.path!);
    } else if (result != null && result.files.length > 1) {
      isImageAvail = true;
      selectedFileList = result.paths
          .map(
            (path) => File(path!),
          )
          .toList();
    }
  }
}
