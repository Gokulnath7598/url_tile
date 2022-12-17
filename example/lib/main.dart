import 'package:flutter/material.dart';
import 'package:url_tile/url_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'URL Tile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'URL Tile Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              // image urls
              // basic
              const Text(
                'Package provided image(pjg, jpeg, png, bmp, wbmp, gif, webp) card',
                style: TextStyle(fontSize: 20),
              ),
              // jpg
              const Text(
                'jpg',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/download.jpeg',
              ),
              // jpeg
              const Text(
                'jpeg',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/main_image_star-forming_region_carina_nircam_final-1280.jpg',
              ),
              // png
              const Text(
                'png',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/100-1009816_png-images-buttons-download-red-download-button-png.png',
              ),
              // wbmp
              const Text(
                'wbmp',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/download-_1_.wbmp',
              ),
              // webp
              const Text(
                'webp',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/ezgif.com-gif-maker.webp',
              ),
              // gif
              const Text(
                'gif',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/5eeea355389655.59822ff824b72.gif',
              ),
              // bmp
              const Text(
                'bmp',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/pexels-pixabay-247615.bmp',
              ),
              // HEIC
              const Text(
                'HEIC',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/IMG_4151.HEIC',
              ),
              // customized
              const Text(
                  'Package provided image(pjg, jpeg, png) card with customized height and preview AppBar'),
              const URLTile(
                url:
                    'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                imageHeight: 150,
                imageFit: BoxFit.fitWidth,
              ),
              const Text(
                  'Package provided image(pjg, jpeg, png) card with customized height and preview AppBar'),
              URLTile(
                url:
                    'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                customTile: Container(
                    color: Colors.green,
                    child: const Text(
                      'User Image Tile',
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    )),
              ),
              // video urls
              // basic
              const Text(
                'Package provided video card',
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'mp4',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              ),
              const Text(
                'mov',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/One+Piece++The+Greatest+Story+Ever+Told%E3%80%8CASMV%E3%80%8D.mov',
              ),
              const Text(
                'mkv',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/One+Piece+The+Greatest+Story+Ever+Told%E3%80%8CASMV.mkv',
              ),
              const Text(
                'flv',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/ONE+PIECE+AMVASMV+THE+PIRATE+KING++Monkey+D.+Luffy.flv',
              ),
              const Text(
                'webm',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/One+Piece+The+Greatest+Story+Ever+Told%E3%80%8CASMV.webm',
              ),
              // customized
              const Text(
                  'Package provided mp4 card with customized card and preview AppBar'),
              URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/Onepiece.mp4',
                customTile: Container(
                    color: Colors.blue,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'MP4 File',
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                previewAppBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: const Text('Video Preview',
                      style: TextStyle(fontFamily: 'SemiBold', fontSize: 18)),
                ),
              ),
              // pdf urls
              // basic
              const Text('Package provided pdf card'),
              const URLTile(
                url: 'https://www.africau.edu/images/default/sample.pdf',
              ),
              // customized
              const Text(
                  'Package provided pdf card with customized preview AppBar'),
              URLTile(
                url: 'https://www.africau.edu/images/default/sample.pdf',
                previewAppBar: AppBar(
                  title: const Text('Custom Title'),
                ),
              ),
              const Text('Package provided pdf card with customized card'),
              const URLTile(
                url: 'https://www.africau.edu/images/default/sample.pdf',
                customTile: Text(
                  'PDF File',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              // audio url
              const Text('Package provided card for audio url'),
              const Text(
                'mp3',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
              ),
              const Text(
                'flac',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/Luffys_Baka_Song_(getmp3.pro).flac',
              ),
              const Text(
                'wav',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/Luffys_Baka_Song_(getmp3.pro).wav',
              ),
              const Text(
                'aac',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/One_piece_Rumbar_Kaizoku_Binks_n_(getmp3.pro).aac',
              ),
              const Text(
                'm4a',
                style: TextStyle(fontSize: 16),
              ),
              const URLTile(
                url:
                    'https://flutter-coe.s3.us-east-2.amazonaws.com/One_piece_Rumbar_Kaizoku_Binks_n_(getmp3.pro).m4a',
              ),
              // unsupported url
              const Text('Package provided card for unsupported url'),
              const URLTile(
                url:
                    'https://docs.google.com/document/d/1jryXhAXp35O4vtjv-vIPVNxu3t5UbgpcUMVEiiXwtWA/edit',
              ),
            ],
          ),
        ));
  }
}
