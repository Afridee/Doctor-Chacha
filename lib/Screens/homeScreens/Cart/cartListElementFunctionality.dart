import 'package:hive/hive.dart';

bool add(String itemName, int qty){

  try{

    Box<Map> cartBox = Hive.box<Map>("cart");

    cartBox.put(itemName, {
      'qty' : qty + 1,
      'productDetails' : cartBox.get(itemName)['productDetails']
    });

    return true;
  }catch(e){
    print(e);
    return false;
  }
}

bool remove(String itemName, int qty){

  try{

    Box<Map> cartBox = Hive.box<Map>("cart");



    if(qty==1){
      cartBox.delete(itemName);
    }else{
      cartBox.put(itemName, {
        'qty' : qty - 1,
        'productDetails' : (cartBox.get(itemName))['productDetails']
      });
    }

    return true;

  }catch(e){
    print(e);
    return false;
  }
}