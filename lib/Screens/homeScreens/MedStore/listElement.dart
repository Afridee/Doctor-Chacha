import 'package:doctor_chacha/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctor_chacha/Screens/homeScreens/MedStore/listElementState.dart';
import 'package:doctor_chacha/widgets/snackBar.dart';
import 'package:doctor_chacha/Screens/homeScreens/MedStore/listElementFunctionality.dart';

class listElement extends StatefulWidget {
  final String brandName;
  final String manufacturer;
  final String strength;
  final String dosageDescription;
  final String unit;
  final price;

  const listElement({
    Key key,
    @required this.brandName,
    @required this.manufacturer,
    @required this.strength,
    @required this.dosageDescription,
    @required this.price,
    @required this.unit,
  }) : super(key: key);

  @override
  _listElementState createState() => _listElementState();
}

class _listElementState extends State<listElement> with SingleTickerProviderStateMixin{

  //Animation Controller for button:
  AnimationController _addButtonAnimationController;

  @override
  void initState() {
    //initializing animation controller
    _addButtonAnimationController = AnimationController(
        duration: Duration(milliseconds: 100),
        vsync: this,
        lowerBound: 0.0,
        upperBound: 0.7
    )..addListener((){
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //State Management for list Item:
    listStateClass LIS = new listStateClass();

    //For button animation:
    double scale = _addButtonAnimationController.value + 1;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            ListTile(
              isThreeLine: true,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.brandName,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manufacturer: ${widget.manufacturer}\nStrength: ${widget.strength}\nDosage description: ${widget.dosageDescription}\nUnit: ${widget.unit}',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    Text(
                      '৳' + widget.price.toString(),
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    ),
                  ],
                ),
              ),
              trailing: InkWell(
                onTap: () async{
                  //bounce animation:
                  await _addButtonAnimationController.forward();
                  _addButtonAnimationController.reverse();
                  //Add this Item to Cart:
                   addToCart(
                       context: context,
                       brandName: widget.brandName,
                       manufacturer: widget.manufacturer,
                       strength: widget.strength,
                       price: widget.price,
                       unit: widget.unit,
                       qty: LIS.qty);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Transform.scale(
                    scale: scale,
                    child: FaIcon(
                      FontAwesomeIcons.cartPlus,
                      color: primaryDark,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove_circle),
                  color: primaryLight,
                  iconSize: 30,
                  onPressed: () {
                    LIS.deduct();
                  },
                ),
                Observer(builder: (context) {
                  return Text('${LIS.qty}',
                      style: TextStyle(fontSize: 20));
                }),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  color: primaryLight,
                  iconSize: 30,
                  onPressed: () {
                    LIS.add();
                  },
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
