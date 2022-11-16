library url_tile;

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class URLTile extends StatefulWidget {
  // accepts image & pdf urls
  String url;

  // boolean for enabling and disabling on click preview {default true}
  bool preview;

  // Image
  // image Tile properties
  // image Tile height
  double? imageHeight;

  // image Tile width
  double? imageWidth;

  // image Tile border radius {default 0}
  BorderRadius? imageBorderRadius;

  // image Tile fit {default BoxFit.fill}
  BoxFit? imageFit;

  // image preview options
  // dismiss image view on swipe {default false}
  bool swipeDismissibleImage;

  // zoom image on double tap {default true}
  bool doubleTapZoomableImage;

  // image view back ground color {default black}
  Color imageViewBGColor;

  // image view back ground color {default white}
  Color imageViewCloseButtonColor;

  // even with all this customization you can't achieve your view use a custom widget
  Widget? customImageTile;

  // PDF

  // custom app bar for pdf view page
  AppBar? pdfViewAppBar;
  //pdf box decoration properties {default 12 radius and black12 color applied}
  BoxDecoration? pdfBoxDecoration;
  //pdf box content padding {default padding vertical 8}
  EdgeInsets? pdfBoxContentPadding;
  //pdf Icon Widget {default pdf Icon with size 40 color red}
  Widget? pdfIcon;
  //pdf name Text Style {default font size 16 color black}
  TextStyle? pdfNameTextStyle;

  // even with all this customization you can't achieve your view use a custom widget
  Widget? customPDFTile;

  URLTile(
      {Key? key,
      required this.url,
      this.preview = true,
      this.pdfViewAppBar,
      this.imageHeight,
      this.imageWidth,
      this.imageBorderRadius,
      this.swipeDismissibleImage = false,
      this.doubleTapZoomableImage = true,
      this.imageViewBGColor = Colors.black,
      this.imageViewCloseButtonColor = Colors.white,
      this.imageFit = BoxFit.fill,
      this.pdfBoxDecoration,
      this.pdfBoxContentPadding,
      this.pdfIcon,
      this.pdfNameTextStyle,
      this.customImageTile,
      this.customPDFTile})
      : super(key: key);

  @override
  State<URLTile> createState() => _URLTileState();
}

class _URLTileState extends State<URLTile> {
  @override
  Widget build(BuildContext context) {
    return widget.url.contains('.pdf')
        ? InkWell(
            onTap: (widget.preview)
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PDFViewerFromUrl(
                          url: widget.url,
                          appBar: widget.pdfViewAppBar ??
                              AppBar(
                                backgroundColor: Colors.black,
                                title: const Text('PDF View',
                                    style: TextStyle(
                                        fontFamily: 'SemiBold', fontSize: 18)),
                              ),
                        ),
                      ),
                    );
                  }
                : () {},
            child: widget.customPDFTile ??
                Container(
                  decoration: widget.pdfBoxDecoration ?? const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Padding(
                    padding: widget.pdfBoxContentPadding ?? const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        widget.pdfIcon ?? const Icon(
                          Icons.picture_as_pdf_outlined,
                          color: Colors.red,
                          size: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            fileNameFromURL(widget.url),
                            style: widget.pdfNameTextStyle ?? const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          )
        : InkWell(
            onTap: (widget.preview)
                ? () {
                    final imageProvider = Image.network(widget.url).image;
                    showImageViewer(
                      closeButtonColor: widget.imageViewCloseButtonColor,
                      backgroundColor: widget.imageViewBGColor,
                      swipeDismissible: widget.swipeDismissibleImage,
                      doubleTapZoomable: widget.doubleTapZoomableImage,
                      context,
                      imageProvider,
                    );
                  }
                : () {},
            child: widget.customImageTile ??
                ClipRRect(
                  borderRadius: widget.imageBorderRadius ??
                      const BorderRadius.all(Radius.circular(0)),
                  child: Image.network(
                    widget.url,
                    height: widget.imageHeight,
                    width: widget.imageWidth,
                    fit: widget.imageFit,
                  ),
                ));
  }
}

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url, required this.appBar})
      : super(key: key);

  final String? url;
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const PDF().fromUrl(
        url!,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}

String fileNameFromURL(String url) {
  String temp = url.substring(url.lastIndexOf('/') + 1);
  url = temp.substring(0, temp.indexOf('.pdf') + 4);
  return url;
}
