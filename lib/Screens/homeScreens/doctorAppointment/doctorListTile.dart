import 'package:doctor_chacha/Screens/homeScreens/doctorAppointment/doctorDescription.dart';

import '../../../models/doctorModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorListTile extends StatelessWidget {

  final DoctorModel doctorInfo;

  const DoctorListTile({
    Key key,@required this.doctorInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorInfo.doctorName,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    doctorInfo.categoryTags.toString().replaceAll('[', '').replaceAll(']', ''),
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  width: MediaQuery.of(context).size.width / 2,
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 14, color: Colors.black54
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Gender: ',
                            style: TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: doctorInfo.male? 'male' : 'female',
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          )
                        ]
                    ),
                  ),
                ),
                RatingBar(
                  unratedColor: Colors.grey,
                  ignoreGestures: true,
                  initialRating: doctorInfo.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            IconButton(icon: Icon(Icons.arrow_forward_rounded, size: 30,), onPressed: (){
              var route = new MaterialPageRoute(
                builder: (BuildContext context) => new doctorDescription(doctorModel: doctorInfo),
              );
              Navigator.of(context).push(route);
            })
          ],
        ));
  }
}
