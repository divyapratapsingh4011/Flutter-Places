import 'package:flutter/material.dart';
import '../providers/great_places.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routename);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (ctx, greatplaces, ch) => greatplaces.items.length == 0
            ? ch
            : ListView.builder(
                itemCount: greatplaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatplaces.items[i].image),
                  ),
                  title: Text(greatplaces.items[i].title),
                  onTap: () {},
                ),
              ),
        child: Center(
          child: Text('Got no places yet,start adding some!'),
        ),
      ),
    );
  }
}
