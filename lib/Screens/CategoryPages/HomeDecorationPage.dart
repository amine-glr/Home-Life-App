

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_life/Screens/CategoryPages/Components/PagesAppBar.dart';




class HomeDecorationPage extends StatefulWidget {

  @override
  _HomeDecorationPageState createState() => _HomeDecorationPageState();
}
final CollectionReference _productRef= FirebaseFirestore.instance.collection("DecProducts");



class _HomeDecorationPageState extends State<HomeDecorationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(
      ),
      body: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
              future: _productRef.get(),
              builder: (context,snapshot){
            if(snapshot.hasError){
              return Scaffold(
                body: Center(
                  child: Text("Error: ${snapshot.error}"),
                ),
              );
            }

            if(snapshot.connectionState== ConnectionState.done){
              return ListView(
                padding: EdgeInsets.only(
                  top:110,
                  bottom: 12,
                ),
                children: snapshot.data.docs.map((document){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 350,
                    margin: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 350,
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "${document.data()['image']}",
                            fit: BoxFit.fill,
                          ),
                      ),
                        ),
                        Positioned(
                          bottom: 0,
                            left:0,
                            right: 0,
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${document.data()['name']}",
                                    style: GoogleFonts.getFont(
                                    'Source Serif Pro',
                                    textStyle:TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),),
                                  Text("${document.data()['price']}TL", style: GoogleFonts.getFont(
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
                  );
                }).toList(),
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
