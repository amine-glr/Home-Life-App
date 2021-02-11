

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:home_life/Constants/Constants.dart';

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

  final CollectionReference _usersRef= FirebaseFirestore.instance.collection("Users");
   String _selectedImage;
   String _selectedName;
   String _selectedPrice;

  User _user =FirebaseAuth.instance.currentUser;

  Future _addToCart(){
    return _usersRef.doc(_user.uid).collection("Cart").doc(widget.productId).set(
        {"image": _selectedImage, "price": _selectedPrice, "name": _selectedName});
  }

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
                            textStyle: Constants.regularHeading,
                          ),

                        ),
                      ),
                      SizedBox(
                        width: 20,
                        child: FlatButton(
                          onPressed: () async{
                            _selectedImage=  "${documentData['image']}";
                            _selectedName=  "${documentData['name']} ";
                            _selectedPrice="${documentData['price']} TL";
                            await _addToCart();
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
