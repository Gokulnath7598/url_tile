class Utils {
  // extract the file name from url
  static String fileNameFromURL({required String url, required String fileType}) {
    if(fileType == ''){
      url = 'UnSupported File Type';
    }
    else{
      String temp = url.substring(url.lastIndexOf('/') + 1);
      url = temp.substring(0, temp.indexOf('.$fileType') + 4);
    }
    return url;
  }
}
