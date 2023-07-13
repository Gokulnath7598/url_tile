## Features

A URLTile Widget which accepts image(jpg,jpeg,png,gif,webp,bmp,wbmp,heic), pdf, video(mp4,mov,mkv,flv,webm), audio(mp3,flac,wav,aac,m4a) url with Image Preview option with zoom, Pdf Preview
option and video and audio player option.


https://github.com/Gokulnath7598/url_tile/assets/52779423/e9bd4c2f-bbe3-4866-9c53-ba6c3fcfb83e


## Getting started

import 'package:url_tile/url_tile.dart';

## Usage

Included short and useful examples for package users. Add longer examples to `/example` folder.

const URLTile(
    url: 'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg', 
    preview: true,
    imageHeight: 100, imageFit: 
    BoxFit.fitHeight,
),

const URLTile(
    url: 'https://www.africau.edu/images/default/sample.pdf',
    pdfViewAppBar: AppBar(
    title: const Text('Custom Title'),
    ),
),

const URLTile(
    url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
),
