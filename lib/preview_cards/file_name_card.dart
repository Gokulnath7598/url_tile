import 'package:flutter/material.dart';

import '../utils/utils.dart';

Widget fileNameCard({required String url, required String fileType}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              fileType == 'pdf'
                  ? Icons.picture_as_pdf_sharp
                  : (Utils.supportedVideoExtensions.contains(fileType.toLowerCase()))
                      ? Icons.video_collection_sharp
                      : Icons.image_not_supported_sharp,
              color: Colors.red,
              size: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                Utils.fileNameFromURL(url: url, fileType: fileType),
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
