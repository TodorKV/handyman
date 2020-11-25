import 'package:flutter/material.dart';
import 'package:rapid_design/data/data.dart';
import 'package:rapid_design/witgets/fav_item.dart';

class InterExterScreen extends StatelessWidget {
  final show;

  const InterExterScreen({Key key, this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView(
        padding: const EdgeInsets.all(10),
        children: FAVOURS
            .map(
              (fav) => FavItem(
                fav.name,
                fav.imageUrl,
                fav.isInterior,
              ),
            )
            .where((element) => element.isInterior == show)
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
