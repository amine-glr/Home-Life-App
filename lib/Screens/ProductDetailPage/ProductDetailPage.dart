import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_life/Components/RoundedButton.dart';

import 'package:home_life/Screens/ProductDetailPage/Components/DetailPageAppBar.dart';
import 'package:home_life/Screens/Tabs/ShoppingBasket.dart';



class ProductDetailPage extends StatefulWidget {
  final String productId;
  final CollectionReference productRef;

  ProductDetailPage({
    this.productId, this.productRef,
});


  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailPageAppBar(),
      body: Stack(
        children: [
          FutureBuilder(
            future:widget.productRef.doc(widget.productId).get(),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }
                if(snapshot.connectionState== ConnectionState.done){
                  Map<String, dynamic> documentData = snapshot.data.data();
                  return ListView(
                    children: [
                      Image.network(
                        "${documentData['image']}",
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                           top: 24,
                          bottom: 4,
                          left: 24,
                          right: 24
                      ),
                        child: Text(
                          "${documentData['name']} ",
                          style: GoogleFonts.getFont(
                            'Source Serif Pro',
                            textStyle:TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical:4,
                          horizontal: 24,
                        ),
                        child: Text(
                          "${documentData['price']} TL",
                          style: GoogleFonts.getFont(
                            'Source Serif Pro',
                            textStyle:TextStyle(
                              color: Colors.redAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical:4,
                          horizontal: 24,
                        ),
                        child: Text(
                          "${documentData['desc']} ",
                          style: GoogleFonts.getFont(
                            'Source Serif Pro',
                            textStyle:TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        child: FlatButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> ShoppingBasket(),
                              ),
                            );
                          },
                          color: Colors.cyan ,
                          child: Text ("Add to Card"),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ],
                  );
                }
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              }
          ),
        ],
      ),

    );
  }
}
