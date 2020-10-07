import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../Constants.dart';
import 'package:flutter/material.dart';
import 'cartStateManagement.dart';
import 'cartListElementFunctionality.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class cartListItem extends StatefulWidget {
  final String brandName;
  final int qty;
  final double price;
  final cartStateClass CS;

  const cartListItem({
    Key key,
    @required this.brandName,
    @required this.qty,
    @required this.price,
    @required this.CS,
  }) : super(key: key);

  @override
  _cartListItemState createState() => _cartListItemState();
}

class _cartListItemState extends State<cartListItem> {

  cartStateClass CIS;

  @override
  void initState() {
    CIS = new cartStateClass();
    widget.CS.updateTotalCost('add', widget.price.toDouble()*widget.qty.toDouble());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            child: ListTile(
              subtitle: Text(
                widget.price.toString() + ' x ' + widget.qty.toString(),
                style: TextStyle(color: Colors.green),
              ),
              isThreeLine: true,
              title: Text(
                widget.brandName + ' x ' + widget.qty.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
       Expanded(
         flex: 2,
         child: Container(
           child: Row(
             children: <Widget>[
               Container(
                 child: IconButton(
                   color: primaryDark,
                   icon: Icon(Icons.add_circle),
                   onPressed: () {
                     bool updated = add(widget.brandName, widget.qty);
                     if(updated){
                       widget.CS.updateTotalCost('add', widget.price.toDouble());
                     }
                   },
                 ),
               ),
               Container(
                 child: IconButton(
                   color: primaryDark,
                   icon: Icon(Icons.remove_circle),
                   onPressed: () async{
                     final DocumentReference  cartItem = Firestore.instance.document('users/${widget.CS.userID}/cart/${widget.brandName}');
                     bool updated = remove(widget.brandName, widget.qty);
                     if(updated){
                       widget.CS.updateTotalCost('deduct', widget.price.toDouble());
                     }
                   },
                 ),
               )
             ],
           ),
         ),
       ),
      ],
    );
  }
}
