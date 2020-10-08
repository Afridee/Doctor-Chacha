import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../../../Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/doctorModel.dart';
import 'package:flutter/cupertino.dart';

import 'Map/directionToDoctor.dart';

class doctorDescription extends StatefulWidget {
  final DoctorModel doctorModel;

  const doctorDescription({Key key, @required this.doctorModel})
      : super(key: key);

  @override
  _doctorDescriptionState createState() => _doctorDescriptionState();
}

class _doctorDescriptionState extends State<doctorDescription> {
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
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: primaryDark,
              child: ClipOval(
                child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                        widget.doctorModel.male
                            ? 'assets/images/maleDoctor.png'
                            : 'assets/images/femaleDoctor.png',
                        fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.doctorModel.doctorName,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
            ),
            Center(
              child: RatingBar(
                unratedColor: Colors.grey,
                ignoreGestures: true,
                initialRating: widget.doctorModel.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25.0,
                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.doctorModel.rating.toString(),
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Gender: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: widget.doctorModel.male ? 'male' : 'female',
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        )
                      ]),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Area of expertise: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: widget.doctorModel.categoryTags.toString().replaceAll('[', '').replaceAll(']', ''),
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        )
                      ]),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Address: ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: widget.doctorModel.address,
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        )
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.phoneSquareAlt),
                      color: primaryDark,
                      iconSize: 60,
                      onPressed: () async {
                        await FlutterPhoneDirectCaller.callNumber(widget.doctorModel.phoneNumber);
                      },
                    ),
                    Text('Call', style: TextStyle(
                      fontSize: 20
                    ),)
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.directions),
                      color: primaryDark,
                      iconSize: 60,
                      onPressed: () async {
                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) => new directionToDoctor(doctorLocation: widget.doctorModel.location.geopoint),
                        );
                        Navigator.of(context).push(route);
                      },
                    ),
                    Text('Show directions', style: TextStyle(
                        fontSize: 20
                    ),)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
