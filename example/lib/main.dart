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
              // video urls
              // basic
              const Text('Package provided mp4 card'),
              const URLTile(
                url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              ),
              // customized
              const Text('Package provided mp4 card with customized card and preview AppBar'),
              URLTile(
                url: 'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
                customTile: Container(
                  color: Colors.blue,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('MP4 File', style: TextStyle(fontSize: 20),),
                    )),
                previewAppBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: const Text('Video Preview',
                      style: TextStyle(
                          fontFamily: 'SemiBold', fontSize: 18)),
                ),
              ),
              // image urls
              // basic
              const Text('Package provided image(pjg, jpeg, png) card'),
              const URLTile(
                url: 'https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/main_image_star-forming_region_carina_nircam_final-1280.jpg',
              ),
              // customized
              const Text('Package provided image(pjg, jpeg, png) card with customized height and preview AppBar'),
              const URLTile(
                url:
                    'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                imageHeight: 150,
                imageFit: BoxFit.fitWidth,
              ),
              const Text('Package provided image(pjg, jpeg, png) card with customized height and preview AppBar'),
              URLTile(
                url:
                'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                customTile: Container(
                  color: Colors.green,
                    child: const Text('User Image Tile', style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)),
              ),
              // pdf urls
              // basic
              const Text('Package provided pdf card'),
              const URLTile(
                url: 'https://www.africau.edu/images/default/sample.pdf',
              ),
              // customized
              const Text('Package provided pdf card with customized preview AppBar'),
              URLTile(
                url: 'https://www.africau.edu/images/default/sample.pdf',
                previewAppBar: AppBar(
                  title: const Text('Custom Title'),
                ),
              ),
              const Text('Package provided pdf card with customized card'),
              const URLTile(
                url: 'https://www.africau.edu/images/default/sample.pdf',
                customTile: Text('PDF File', style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
              ),
              // unsupported url
              const Text('Package provided card for unsupported url'),
              const URLTile(
                url: 'https://docs.google.com/document/d/1jryXhAXp35O4vtjv-vIPVNxu3t5UbgpcUMVEiiXwtWA/edit',
              ),
            ],
          ),
        ));
  }
}
