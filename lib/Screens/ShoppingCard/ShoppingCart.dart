

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:home_life/Components/bottomNavBar.dart';

import 'package:home_life/FirebaseServices.dart';
import 'file:///D:/works/flutter/home_life/lib/Screens/ShoppingCard/CardAppBar.dart';




class ShoppingBasket extends StatefulWidget {
  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  FirebaseServices _firebaseServices = FirebaseServices();

  User _user =FirebaseAuth.instance.currentUser;

  Future _delete(String productId){
    return _firebaseServices.usersRef.doc(_user.uid).collection("Cart").doc(productId).delete();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CardAppBar(),
      body: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _firebaseServices.usersRef.doc(_firebaseServices.getUserId())
                .collection("Cart").get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              // Collection Data ready to display
              if (snapshot.connectionState == ConnectionState.done) {
                // Display the data inside a list view
                return ListView(
                  padding: EdgeInsets.only(
                    top: 24.0,
                    bottom: 12.0,
                  ),
                  children: snapshot.data.docs.map((document) {
                    return FutureBuilder(
                      future: _firebaseServices.usersRef.doc(_firebaseServices.getUserId()).collection("Cart").doc(document.id).get(),

                      builder: (context, productSnap) {

                        if(productSnap.hasError) {
                          return Container(
                            child: Center(
                              child: Text("${productSnap.error}"),
                            ),
                          );
                        }

                        if(productSnap.connectionState == ConnectionState.done) {
                          Map _productMap = productSnap.data.data();

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 24.0,
                            ),
                            child: Dismissible(
                              key: Key(_productMap.toString()),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction){
                                setState(() {
                                  _delete(document.id);
                                });
                                },
                              background: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20,),
                                decoration: BoxDecoration(
                                  color: Colors.pink[50],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Icon(Icons.cancel_outlined),

                                  ],
                                ),

                              ),

                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 90,
                                    height: 90,
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                      child: Image.network(
                                        "${_productMap['image']}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 16.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${_productMap['name']}",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black38,
                                              fontWeight:
                                              FontWeight.w600),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets
                                              .symmetric(
                                            vertical: 4.0,
                                          ),
                                          child: Text(
                                            "${_productMap['price']}",
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.deepOrangeAccent,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                        ),



                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          );

                        }

                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              }

              // Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),




        ],
      ),
      bottomNavigationBar: BottomNavBar(),




    );
  }
}