## Features

A URLTile Widget which accepts image and pdf url Image Preview option with zoom option Pdf Preview
option

## Getting started

import 'package:url_tile/url_tile.dart';

## Usage

Included short and useful examples for package users. Add longer examples to `/example` folder.

URLTile(
    url: 'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg', 
    preview: true,
    imageHeight: 100, imageFit: 
    BoxFit.fitHeight,
),

URLTile(
    url: 'https://www.africau.edu/images/default/sample.pdf',
    pdfViewAppBar: AppBar(
    title: const Text('Custom Title'),
    ),
),