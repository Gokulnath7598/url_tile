library url_tile;

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:url_tile/preview_cards/file_name_card.dart';
import 'package:url_tile/preview_pages/audio_player/audio_player.dart';
import 'package:url_tile/preview_pages/pdf_viewer/pdf_viewer.dart';
import 'package:url_tile/preview_pages/video_player/video_player.dart';
import 'package:url_tile/utils/utils.dart';

class URLTile extends StatefulWidget {
  /// accepts image, audio, video & pdf urls
  final String url;

  /// Image
  ///
  /// image Tile properties
  /// image Tile height
  final double? imageHeight;

  /// image Tile width
  final double? imageWidth;

  /// image Tile border radius {default 12}
  final BorderRadius? imageBorderRadius;

  /// image Tile fit {default BoxFit.fill}
  final BoxFit? imageFit;

  /// image preview options
  /// dismiss image view on swipe {default false}
  final bool swipeDismissibleImage;

  /// zoom image on double tap {default true}
  final bool doubleTapZoomableImage;

  /// PDF

  /// custom app bar for pdf view page & Video player page
  final AppBar? previewAppBar;

  /// even with all this customization you can't achieve your view use you own custom widget
  final Widget? customTile;

  const URLTile(
      {Key? key,
      required this.url,
      this.previewAppBar,
      this.imageHeight,
      this.imageWidth,
      this.imageBorderRadius,
      this.swipeDismissibleImage = false,
      this.doubleTapZoomableImage = true,
      this.imageFit = BoxFit.fill,
      this.customTile})
      : super(key: key);

  @override
  State<URLTile> createState() => _URLTileState();
}

class _URLTileState extends State<URLTile> {
  @override
  Widget build(BuildContext context) {
    /// to get extension from the url
    String extension = Utils.fileExtensionFromURL(url: widget.url);
    /// return widgets and onTap functions based on the file extension type
    return widget.url.contains('.pdf')
        ? InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFViewerPage(
                    url: widget.url,
                    appBar: widget.previewAppBar ??
                        AppBar(
                          backgroundColor: Colors.black,
                          title: const Text('PDF View',
                              style: TextStyle(
                                  fontFamily: 'SemiBold', fontSize: 18)),
                        ),
                  ),
                ),
              );
            },
            child: widget.customTile ??
                fileNameCard(url: widget.url, fileType: 'pdf'))
        : (Utils.supportedVideoExtensions.contains(extension.toLowerCase()))
            ? InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(
                        url: widget.url,
                        appBar: widget.previewAppBar ??
                            AppBar(
                              backgroundColor: Colors.black,
                              title: const Text('Video Player',
                                  style: TextStyle(
                                      fontFamily: 'SemiBold', fontSize: 18)),
                            ),
                      ),
                    ),
                  );
                },
                child: widget.customTile ??
                    fileNameCard(url: widget.url, fileType: extension),
              )
            : (Utils.supportedAudioExtensions.contains(extension.toLowerCase()))
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AudioPlayerPage(
                            url: widget.url,
                            appBar: widget.previewAppBar ??
                                AppBar(
                                  backgroundColor: Colors.black,
                                  title: const Text('Audio Player',
                                      style: TextStyle(
                                          fontFamily: 'SemiBold',
                                          fontSize: 18)),
                                ),
                          ),
                        ),
                      );
                    },
                    child: fileNameCard(url: widget.url, fileType: extension))
                : (Utils.supportedImageExtensions
                        .contains(extension.toLowerCase()))
                    ? InkWell(
                        onTap: () {
                          final imageProvider = Image.network(widget.url).image;
                          showImageViewer(
                            context,
                            imageProvider,
                            useSafeArea: true,
                            swipeDismissible: widget.swipeDismissibleImage,
                            doubleTapZoomable: widget.doubleTapZoomableImage,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: widget.customTile ??
                              ClipRRect(
                                borderRadius: widget.imageBorderRadius ??
                                    const BorderRadius.all(Radius.circular(12)),
                                child: Image.network(
                                  widget.url,
                                  height: widget.imageHeight,
                                  width: widget.imageWidth,
                                  fit: widget.imageFit,
                                ),
                              ),
                        ))
                    : fileNameCard(url: widget.url, fileType: '');
  }
}
