import 'package:flutter/material.dart';

import 'PersonDetailPage.dart';

class PersonList extends StatelessWidget {
  final List personList;
  PersonList(this.personList);

  @override
  Widget build(BuildContext context) {
    print(personList);
    return ListView.builder(
      // Must have an item count equal to the number of items!
      itemCount: personList.length,
      // A callback that will return a widget.
      itemBuilder: (context, int) {
        // layout row
        var person = personList[int];
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => showDetailPage(person, context),
              child: Row(children: [
                Image.network(person['picture']['large']),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "${person['name']['first']} ${person['name']['last']}"),
                ),
              ]),
            ));
      },
    );
  }

  showDetailPage(person, context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        // builder methods always take context!
        builder: (context) {
          return PersonDetailPage(person);
        },
      ),
    );
  }
}