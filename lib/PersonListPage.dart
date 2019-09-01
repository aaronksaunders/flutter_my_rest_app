import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'PersonList.dart';

class PersonListPage extends StatefulWidget {
  PersonListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PersonListPageState createState() => _PersonListPageState();
}

class _PersonListPageState extends State<PersonListPage> {
  Future<List<dynamic>> peopleList;

  Future<List<dynamic>> loadAllData() async {
    HttpClient http = HttpClient();
    try {
      // Use darts Uri builder
      var uri = Uri.http("randomuser.me", "/api", {'results': '10'});
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      return json.decode(responseBody)['results'];
    } catch (exception) {
      print(exception);
      return exception;
    }
  }

  @override
  initState() {
    super.initState();
    peopleList = loadAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<Object>(
          future: peopleList,
          builder: (context, snapshot) {
            if (snapshot.hasData == true) {
              return PersonList(snapshot.data);
            } else {
              return Container();
            }
          }),
    );
  }
}


