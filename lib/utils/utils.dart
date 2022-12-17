class Utils {
  ///url functions
  ///
  /// accepts file url
  /// extract the file name from url
  /// split the url find the last/ and extract the file name from there
  static String fileNameFromURL({required String url}) {
    String temp = url.substring(url.lastIndexOf('/') + 1);
    url = temp;
    return url;
  }

  /// extract the file extension from url
  ///
  /// accepts file url
  /// split the url and find the last . and extract the extension from there
  static String fileExtensionFromURL({required String url}) {
    String extension = url.split(".").last;
    return extension;
  }

  ///supported extensions
  ///
  /// supported image formats
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

  /// supported video formats
  static List<String> supportedVideoExtensions = [
    'mp4',
    'mov',
    'mkv',
    'flv',
    'webm',
  ];

  /// supported audio formats
  static List<String> supportedAudioExtensions = [
    'mp3',
    'flac',
    'wav',
    'aac',
    'm4a',
  ];
}
