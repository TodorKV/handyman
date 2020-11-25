import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWitget extends StatelessWidget {
  Widget child;
  CardWitget(this.child);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        //side: BorderSide(
        //  width: 5,
        //  color: Color.fromRGBO(95, 2, 31, 1),
        //),
      ),
      elevation: 4,
      child: child,
    );
  }
}
