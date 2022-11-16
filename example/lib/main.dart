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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
              URLTile(
                url:
                    'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                preview: true,
                imageHeight: 100,
                imageFit: BoxFit.fitHeight,
              ),
              const SizedBox(
                height: 10,
              ),
              URLTile(
                url: 'https://source.unsplash.com/user/c_v_r/1900x800',
                preview: false,
                imageFit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 10,
              ),
              URLTile(
                url: 'https://source.unsplash.com/user/c_v_r/1900x800',
                imageBorderRadius: const BorderRadius.all(Radius.circular(12)),
                doubleTapZoomableImage: false,
                imageViewBGColor: Colors.white,
                imageViewCloseButtonColor: Colors.black,
              ),
              URLTile(url: 'https://www.africau.edu/images/default/sample.pdf'),
              URLTile(
                url: 'https://www.africau.edu/images/default/sample.pdf',
                pdfViewAppBar: AppBar(
                  title: const Text('Custom Title'),
                ),
              ),
              URLTile(
                url: 'https://source.unsplash.com/user/c_v_r/1900x800',
                customImageTile: Image.network('https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg'),
              ),
              URLTile(
                url: 'https://www.africau.edu/images/default/sample.pdf',
                customPDFTile: const Text('PDF File'),
              ),
              URLTile(
                pdfBoxDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25)
                ),
                url: 'https://www.africau.edu/images/default/sample.pdf',
                pdfIcon: Icon(Icons.picture_as_pdf,size: 50,color: Colors.green,),
              ),
            ],
          ),
        ));
  }
}
