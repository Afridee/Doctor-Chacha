import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_chacha/models/doctorModel.dart';
import 'doctorListTile.dart';
import 'package:flutter/material.dart';

class doctorList extends StatefulWidget {
  final String subCatergory;

  const doctorList({Key key, @required this.subCatergory}) : super(key: key);

  @override
  _doctorListState createState() => _doctorListState();
}

class _doctorListState extends State<doctorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Choose your doctor',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.white,
            ]),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Doctors').where('categoryTags',arrayContains: widget.subCatergory)
              .orderBy('rating', descending: true)
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
              return ListView.separated(
                separatorBuilder: (_, index) => Divider(),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return DoctorListTile(
                      doctorInfo: DoctorModel.fromJson(
                          snapshot.data.documents[index].data()));
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
