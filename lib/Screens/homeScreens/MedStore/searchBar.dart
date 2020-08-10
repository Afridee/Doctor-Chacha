import 'package:doctor_chacha/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchBar extends StatefulWidget {

  final TextEditingController searchQuery;

  const searchBar({
    Key key,@required this.searchQuery,
  }) : super(key: key);

  @override
  _searchBarState createState() => _searchBarState();
}

class _searchBarState extends State<searchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff0f0f0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
          gradient: LinearGradient(
            colors: [
              primaryLight,
              primaryDark,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: widget.searchQuery,
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
      ),
    );
  }
}