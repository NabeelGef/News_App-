import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/data.dart';

// import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final Article articles;
  const Details({super.key, required this.articles});

  @override
  State<Details> createState() => _DetailsState();
}

bool showWidget = false;

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.blue[50],
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Title : ${widget.articles.title}',
                  style: const TextStyle(fontSize: 20),
                )),
            Container(
                padding: const EdgeInsets.all(10),
                child: Image(
                  image: NetworkImage(widget.articles.urlToImage),
                )),
            Card(
                elevation: 5,
                color: Colors.blue[100],
                child: Text('Description : ${widget.articles.description}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[500], border: Border.all(width: 2)),
              width: double.infinity,
              child: Text(
                "Name : ${widget.articles.source!.name}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showWidget = !showWidget;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Show Content"),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
            Visibility(
              visible: showWidget,
              child: const Text("Content : ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Visibility(
              visible: showWidget,
              child: Text(widget.articles.content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Visibility(
                visible: showWidget,
                child: const Text('url : ',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            Visibility(
              visible: showWidget,
              child: InkWell(
                onTap: () {
                  launchUrl(Uri.parse(widget.articles.url));
                },
                child: Text(
                  widget.articles.url,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue[800],
                      fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
