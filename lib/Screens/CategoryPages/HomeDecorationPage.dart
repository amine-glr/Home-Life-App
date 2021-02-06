import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_life/Screens/Components/PagesAppBar.dart';


class HomeDecorationPage extends StatelessWidget {
  final CollectionReference _productsRef= FirebaseFirestore.instance.collection("Products");
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(),
      body: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
            future: _productsRef.get( ),
            builder: (context, snapshot){
              if(snapshot.hasError){
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }
              if(snapshot.connectionState == ConnectionState.done){
                return ListView(
                    children: snapshot.data.docs.map((document){
                      return Column(
                        children: [
                          Text("Name: ${document.data()['name']}"),
                          Image.network(
                            "${document.data()['image']}"
                          ),
                        ],
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


