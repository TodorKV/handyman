import 'package:flutter/material.dart';

class FavItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isInterior;

  FavItem(this.name, this.imageUrl, this.isInterior);

  void selectCategory(BuildContext ctx) {
    //Navigator.of(ctx).pushNamed(
    //  TabsScreen.routeName,
    //  arguments: {
    //    'id': id,
    //    'title': title,
    //    'meditationUrl': meditationUrl,
    //    'diaryUrl': diaryUrl,
    //  },
    //);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Color.fromRGBO(184, 15, 10, 1),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Column(
          //alignment: Alignment.bottomRight,
          //fit: StackFit.expand,
          children: <Widget>[
            FittedBox(
              child: ClipRRect(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fitHeight,
                  height: 140,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
