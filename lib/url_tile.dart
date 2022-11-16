library url_tile;
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class URLTile extends StatelessWidget {
  String url;
  bool preview;
  URLTile({Key? key,required this.url, required this.preview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url.contains('.pdf')
        ? InkWell(
      onTap: (preview)
          ? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PDFViewerFromUrl(url: url),
          ),
        );
      }
          : () {},
      child: Container(
          margin:
          const EdgeInsets.only(bottom: 20, right: 10, left: 10),
          height: 60,
          width: double.maxFinite,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: pdfNameWithIconRow(url)),
    )
        : InkWell(
      onTap: (preview)
          ? () {
        final imageProvider = Image.network(url).image;
        showImageViewer(context, imageProvider,);
      }
          : () {},
      child: Container(
          margin: const EdgeInsets.all(20),
          height: 200,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.network(url, fit: BoxFit.fill))),
    );
  }
}

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url}) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('PDF View', style: TextStyle(fontFamily: 'SemiBold', fontSize: 18)),
      ),
      body: const PDF().fromUrl(
        url!,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}

Widget pdfNameWithIconRow(String url) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 10,),
        const Icon(
          Icons.picture_as_pdf_rounded,
          color: Colors.red,
          size: 40,
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Text(fileNameFromURL(url),
              style: const TextStyle(
                  fontFamily: 'SemiBold',
                  fontSize: 15,
                  color: Colors.black),),
        ),
      ],
    ),
  );
}

String fileNameFromURL(String url){
String temp = url.substring(url.lastIndexOf('/')+1);
url = temp.substring(0,temp.indexOf('.pdf')+4);
return url;
}