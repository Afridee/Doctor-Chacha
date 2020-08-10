import 'package:doctor_chacha/Screens/homeScreens/MedStore/listElement.dart';
import 'package:doctor_chacha/Screens/homeScreens/MedStore/listElementState.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_chacha/Screens/homeScreens/MedStore/searchLogic.dart';
import 'package:doctor_chacha/Animation/FadeAnimation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class theListPart extends StatefulWidget {
  final TextEditingController searchQuery;

  const theListPart({
    Key key,
    @required this.searchQuery,
  }) : super(key: key);

  @override
  _theListPartState createState() => _theListPartState();
}

class _theListPartState extends State<theListPart> {
  String query = '';

  @override
  void initState() {
    widget.searchQuery.addListener(() {
      setState(() {
        query = widget.searchQuery.text;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff0f0f0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: StreamBuilder(
          stream: Firestore.instance
              .collection('medicines&medkits')
              .orderBy('brandName')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData && snapshot.data != null) {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return search(
                          context,
                          query,
                          snapshot.data.documents[index]['brandName'] +
                              snapshot.data.documents[index]['manufacturer']+
                              snapshot.data.documents[index]['dosageDescription'])
                      ? FadeAnimation(
                          2,
                          listElement(
                              brandName: snapshot.data.documents[index]
                                  ['brandName'],
                              manufacturer: snapshot.data.documents[index]
                                  ['manufacturer'],
                              strength: snapshot.data.documents[index]
                                  ['strength'],
                              dosageDescription: snapshot.data.documents[index]
                                  ['dosageDescription'],
                              price: snapshot.data.documents[index]['price'],
                              unit: snapshot.data.documents[index]['unit']),
                        )
                      : Container();
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
