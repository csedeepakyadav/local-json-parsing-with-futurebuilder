import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:futurebuilder/models/AlbumModel.dart';

class StateManager with ChangeNotifier {
  StateManager() {
    
  }

  Future _loadLocalJson() async {
    return await rootBundle.loadString('assets/jsondata/localjson.json');
  }

  Future fetchJson() async {
    String jsonString = await _loadLocalJson();
    final jsonResponse = json.decode(jsonString);

    List<AlbumModel> _albumlist = [];
    for (var item in jsonResponse) {
      AlbumModel album = new AlbumModel.fromJson(item);
      _albumlist.add(album);
    }

    return _albumlist;
  }
}
