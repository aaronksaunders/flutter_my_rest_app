import 'package:flutter/material.dart';

class PersonDetailPage extends StatelessWidget {
  final person;

  PersonDetailPage(this.person);

  @override
  Widget build(BuildContext context) {
    var location = person['location'];
    return Scaffold(
      appBar: AppBar(
        title: Text("DETAIL PAGE"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Image.network(person['picture']['large']),
            Text(
              "${person['name']['first']} ${person['name']['last']}",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "${location['street']} ${location['city']}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}