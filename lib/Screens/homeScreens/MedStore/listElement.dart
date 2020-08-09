import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctor_chacha/Screens/homeScreens/MedStore/List_element_state.dart';

class listElement extends StatefulWidget {

  final String brandName;
  final String manufacturer;
  final String strength;
  final String dosageDescription;
  final String unit;
  final price;

  const listElement({
    Key key,@required this.brandName,@required this.manufacturer,@required this.strength,@required this.dosageDescription,@required this.price,@required this.unit,
  }) : super(key: key);

  @override
  _listElementState createState() => _listElementState();
}

class _listElementState extends State<listElement> {
  @override
  Widget build(BuildContext context) {
    listItemState LIS = new listItemState();

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
                      '৳'+widget.price.toString(),
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    ),
                  ],
                ),
              ),
              trailing: InkWell(
                onTap: () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: <Widget>[
                          Text('Added to cart',
                           style: TextStyle(
                             color: Color(0xff0088ba)
                           ),),
                          SizedBox(
                            width: 10,
                          ),
                          FaIcon(
                            FontAwesomeIcons.shoppingCart,
                            color: Color(0xff0088ba),
                            size: 20,
                          ),
                        ],
                      ),
                      backgroundColor: Color(0xff00ffed),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top:15.0),
                  child: FaIcon(
                    FontAwesomeIcons.cartPlus,
                    color: Color(0xff0088ba),
                    size: 25,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove_circle),
                  color: Color(0xff00ffed),
                  iconSize: 30,
                  onPressed: () {
                    LIS.deduct.call();
                  },
                ),
                Observer(builder: (context) {
                  return Text('${LIS.qty.value}',
                      style: TextStyle(fontSize: 20));
                }),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  color: Color(0xff00ffed),
                  iconSize: 30,
                  onPressed: () {
                    LIS.add.call();
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
