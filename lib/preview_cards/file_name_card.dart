import 'package:flutter/material.dart';
import '../utils/utils.dart';

///fileNameCard
///
/// accepts the file url and extension
/// Returns a Widget with file name and basic ICon based and file type
/// Shows a broken icon for unsupported url/file extension with warning
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
                  : (Utils.supportedAudioExtensions
                          .contains(fileType.toLowerCase()))
                      ? Icons.audio_file_sharp
                      : (Utils.supportedVideoExtensions
                              .contains(fileType.toLowerCase()))
                          ? Icons.video_collection_sharp
                          : Icons.image_not_supported_sharp,
              color: Colors.red,
              size: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (fileType != 'pdf' &&
                          !Utils.supportedAudioExtensions
                              .contains(fileType.toLowerCase()) &&
                          !Utils.supportedVideoExtensions
                              .contains(fileType.toLowerCase()) &&
                          !Utils.supportedImageExtensions
                              .contains(fileType.toLowerCase()))
                      ? const Text(
                          'UnSupported url/extension',
                          style: TextStyle(
                              color: Colors.red, fontSize: 14),
                        )
                      : const SizedBox(height: 0),
                  Text(
                    Utils.fileNameFromURL(url: url),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
