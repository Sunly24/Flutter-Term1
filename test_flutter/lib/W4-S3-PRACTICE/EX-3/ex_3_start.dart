import 'package:flutter/material.dart';

List<String> images = [
  "assets/W4-S3/bird.jpg",
  "assets/W4-S3/bird2.jpg",
  "assets/W4-S3/insect.jpg",
  "assets/W4-S3/girl.jpg",
  "assets/W4-S3/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: () => {},
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: () => {},
              ),
            ),
          ],
        ),
        body: Image.asset(images[0]),
      ),
    ));
