import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  const searchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff00ffed),
            Color(0xff0088ba),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {},
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: InputBorder.none,
              hintText: "Find a medicine or medical kit...",
              hintStyle: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}