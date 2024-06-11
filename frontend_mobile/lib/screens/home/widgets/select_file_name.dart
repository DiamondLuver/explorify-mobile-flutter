import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/common/colors.dart';

class SelectFileButton extends StatelessWidget {
  const SelectFileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 1,
      dashPattern: const [6, 6],
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: const Radius.circular(24),
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => pickMedia(), 
        child: SizedBox(
          height: 80,
          // decoration: BoxDecoration(
          //   color: AppColor.primary,
          //   borderRadius: BorderRadius.circular(48),
          // ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.folder_open_rounded,
                color: AppColor.secondary,
                size: 32,
              ),
              const SizedBox(width: 16),
              Text(
                "Select File",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColor.secondary),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future pickMedia() async {
    var dio = Dio();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'], // Restrict to PDF files only);
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = file.path.split('/').last;
      String filePath = file.path;

      FormData data = FormData.fromMap({
        'x-apikey': 'apikey',
        'file': await MultipartFile.fromFile(filePath, filename: fileName),
      });

      var response =
          dio.post("", data: data, onSendProgress: (int sent, int total) {
        print("$sent, $total");
      });
    }
    // showLoadingDialog(context);

    // final picker = ImagePicker();
    // try {
    //   final media = await picker.pickMultipleMedia();
    //   onFileSelected(media);
    // } catch (e) {
    //   showInfoSnackBar(context, "Some media/files cannot be selected !");
    // } finally {
    //   // close loading dialog
    //   Navigator.pop(context);
    // }
  }
}
