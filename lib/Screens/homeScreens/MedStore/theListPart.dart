import 'package:doctor_chacha/Screens/homeScreens/MedStore/listElement.dart';
import 'package:doctor_chacha/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_chacha/Screens/homeScreens/MedStore/searchLogic.dart';
import 'package:doctor_chacha/Animation/FadeAnimation.dart';

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
          stream: FirebaseFirestore.instance
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
                          snapshot.data.documents[index].get('brandName') +
                              snapshot.data.documents[index].get('manufacturer') +
                              snapshot.data.documents[index].get('dosageDescription'))
                      ? FadeAnimation(
                          2,
                          listElement(
                            productModel: ProductModel.fromJson(snapshot.data.documents[index].data()),
                          ),
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
