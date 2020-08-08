import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class listElement extends StatelessWidget {
  const listElement({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            ListTile(
              isThreeLine: true,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Napa Extra, net wt.200g, 12 pcs\nManufacturer: Square',
                  style: TextStyle(
                      fontWeight: FontWeight.w700
                  ),),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('৳ 50', style: TextStyle(
                    color: Colors.green,
                    fontSize: 20
                ),),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.cartPlus,
                color: Colors.blue,
                size: 25,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove_circle),
                  color: Color(0xff0088ba),
                  iconSize: 30,
                  onPressed: (){},
                ),
                Text(
                    '3',
                    style: TextStyle(
                        fontSize: 20
                    )
                ),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  color: Color(0xff0088ba),
                  iconSize: 30,
                  onPressed: (){},
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}