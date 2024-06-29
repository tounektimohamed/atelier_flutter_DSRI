import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GallerieDetailsPage extends StatefulWidget {
  final String keyword;

  GallerieDetailsPage(this.keyword);

  @override
  State<GallerieDetailsPage> createState() => GallerieDetailsPageState();
}

class GallerieDetailsPageState extends State<GallerieDetailsPage> {
  int currentPage = 1;
  int size = 10;
  late int totalPages;
  ScrollController _scrollController = ScrollController();
  List<dynamic> hits = [];
  var galleryData;

  @override
  void initState() {
    super.initState();
    getGalleryData(widget.keyword);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          currentPage++;
          getGalleryData(widget.keyword);
        }
      }
    });
  }

  void getGalleryData(String keyword) {
    print("Gallery de $keyword");
    String url =
        "https://pixabay.com/api/?key=44687245-370c54cc31880e12db935fd61&q=$keyword&page=$currentPage&per_page=$size";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        galleryData = json.decode(resp.body);
        hits.addAll(galleryData['hits']);
        totalPages = (galleryData['totalHits'] / size).ceil();
        print(hits);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: totalPages == 0
            ? Text('Pas de résultats')
            : Text("${widget.keyword} - Page $currentPage/$totalPages"),
      ),
      body: galleryData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: hits.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              hits[index]['tags'],
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        child: Image.network(
                          hits[index]['webformatURL'],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
