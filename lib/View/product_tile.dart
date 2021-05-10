import 'package:bikroy_app/Model/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            height: 295,
            child: Image.network(
              product.img,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 4.0, right: 4.0),
              color: Color(0xFFfffcf7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  customText(product.product, 16.0, true, false),
                  customText('৳' + product.price, 14.0, true, true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customText(String text, double fsize, bool bold, bool green) {
    if (text.length >= 32) {
      text = text.substring(0, 32) + '....';
    }
    return Expanded(
        child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: (bold) ? FontWeight.bold : FontWeight.normal,
                  fontSize: fsize,
                  color: (green) ? Color(0xFF009878) : Colors.black),
            )));
  }
}
