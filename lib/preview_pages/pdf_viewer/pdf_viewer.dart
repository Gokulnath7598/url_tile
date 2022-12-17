import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

///PDFViewerPage
///
/// accepts url and appBar for the page
/// uses flutter_cached_pdfview
class PDFViewerPage extends StatelessWidget {
  const PDFViewerPage({Key? key, required this.url, required this.appBar})
      : super(key: key);

  ///video url
  final String url;

  ///appBar for the page
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
