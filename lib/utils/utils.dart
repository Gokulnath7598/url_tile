class Utils {
  // extract the file name from url
  static String fileNameFromURL(
      {required String url, required String fileType}) {
    if (fileType == '') {
      url = 'UnSupported File Type';
    } else {
      String temp = url.substring(url.lastIndexOf('/') + 1);
      url = temp.substring(0, temp.indexOf('.$fileType') + 4);
    }
    return url;
  }

  // extract the file name from url
  static String fileExtensionFromURL({required String url}) {
    String extension = url.split(".").last;
    return extension;
  }

  // supported image formats
  static List<String> supportedImageExtensions = [
    'jpg',
    'jpeg',
    'png',
    'gif',
    'webp',
    'bmp',
    'wbmp',
    'heic',
  ];

  // supported video formats
  static List<String> supportedVideoExtensions = [
    'mp4',
    'mov',
    'mkv',
    'flv',
    'webm',
  ];

  // supported audio formats
  static List<String> supportedAudioExtensions = [
    'mp3',
    'flac',
    'wav',
    'aac',
    'm4a',
  ];
}
