
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_life/Screens/ProductDetailPage/ProductDetailPage.dart';


class ProductList extends StatelessWidget {
  final String productId;
  final Function onPressed;
  final String imageUrl;
  final String title;
  final String price;
  final CollectionReference productRef;


  ProductList({
    this.productId, this.onPressed, this.imageUrl, this.title, this.price, this.productRef
});





  @override
  Widget build(BuildContext context) {

        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>ProductDetailPage( productId: productId, productRef: productRef,),
            ),);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            height: 350,
            margin: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
            child: Stack(
                fit: StackFit.loose,
                children: [
                  Positioned(
                    top: 40,
                    left: 0,
                    right: 0,
                    bottom: 60,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          "$imageUrl",
                          fit: BoxFit.fitHeight,
                          height: 350,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(title,
                            style: GoogleFonts.getFont(
                              'Source Serif Pro',
                              textStyle:TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),),
                          Text(price, style: GoogleFonts.getFont(
                            'Source Serif Pro',
                            textStyle:TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]
            ),
          ),
        );

  }
}

