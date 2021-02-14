

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:home_life/Components/RoundedButton.dart';
import 'package:home_life/Components/bottomNavBar.dart';

import 'package:home_life/Constants/Constants.dart';

import 'package:home_life/Screens/ProductDetailPage/Components/DetailPageAppBar.dart';




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

  bool isFavorite=false;
  bool isAddCart=false;

  final CollectionReference _usersRef= FirebaseFirestore.instance.collection("Users");
   String _selectedImage;
   String _selectedName;
   String _selectedPrice;

  User _user =FirebaseAuth.instance.currentUser;

  Future _addToCart(){
    return _usersRef.doc(_user.uid).collection("Cart").doc(widget.productId).set(
        {"image": _selectedImage, "price": _selectedPrice, "name": _selectedName});
  }

  Future _addToFavorites(){
    return _usersRef.doc(_user.uid).collection("Favorites").doc(widget.productId).set(
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
                      SizedBox(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.network(
                            "${documentData['image']}",

                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top:20),
                        padding: EdgeInsets.only(top:20),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical:10,
                              ),
                              child: Text(
                                "${documentData['name']} ",
                                style: GoogleFonts.getFont(
                                  'Source Serif Pro',
                                  textStyle:TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:5,
                                horizontal: 20,
                              ),
                              child: Text(
                                "\$${documentData['price']} ",
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
                                vertical:5,
                                horizontal: 20,
                              ),
                              child: Text(
                                "${documentData['desc']} ",
                                style: GoogleFonts.getFont(
                                  'Source Serif Pro',
                                  textStyle: Constants.regularHeading,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top:20),
                        padding: EdgeInsets.only(top:20),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Row(
                          children:[
                            Padding(
                              padding: EdgeInsets.only(left: 30,right: 20),
                              child: IconButton(
                                iconSize: 36,
                                onPressed:  ()async{
                                  setState(() {
                                    isFavorite=true;
                                  });

                                  _selectedImage=  "${documentData['image']}";
                                  _selectedName=  "${documentData['name']} ";
                                  _selectedPrice="\$${documentData['price']} ";
                                  await _addToFavorites();

                                },
                                color: Colors.orange[800],
                                icon: Icon( isFavorite ?  Icons.bookmark: Icons.bookmark_border_outlined
                                ),
                              ),
                            ),
                            Container(
                              width: 250,
                              child: Padding(
                                padding: EdgeInsets.only( right: 5,),
                                child: RoundedButton(
                                  onPressed: () async{
                                    setState(() {
                                      isAddCart=true;
                                    });

                                    _selectedImage=  "${documentData['image']}";
                                    _selectedName=  "${documentData['name']} ";
                                    _selectedPrice="\$${documentData['price']} ";
                                    await _addToCart();
                                  },
                                  color: isAddCart ?  Colors.orange[800] : Colors.grey,
                                  text: "Add to Card",
                                ),
                              ),
                            ),

                          ]
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
      bottomNavigationBar: BottomNavBar(),

    );
  }
}
