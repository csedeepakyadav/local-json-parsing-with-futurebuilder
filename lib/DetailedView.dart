import 'package:flutter/material.dart';
import 'package:futurebuilder/models/AlbumModel.dart';

class DetailedView extends StatelessWidget {
  final AlbumModel album;
  DetailedView({this.album});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(album.albumId.toString()),
        centerTitle: true,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Image.network(
                album.thumbnailUrl,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                album.title,
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              FlatButton(
                onPressed: () {
                  print(album.url);
                },
                child: Text(
                  'Go To WebSite',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              )
            ],
          )),
    );
  }
}
