import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as qrScanner;

class AddToCart extends StatefulWidget {
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: FlatButton(onPressed: (){
      qrScanner.scan().then((data){
        if(data!=null&&data.length>0){
          // sending the qr data to firestore
          Firestore.instance.collection("Carts").document("cartID").setData({
            "products":[data]
          },merge: true);
        }
    });

    }, child: Text("Add to Cart")),),);
  }
}
