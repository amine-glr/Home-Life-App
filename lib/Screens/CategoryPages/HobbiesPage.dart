import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_life/Components/bottomNavBar.dart';
import 'package:home_life/Screens/CategoryPages/Components/PagesAppBar.dart';
import 'package:home_life/Screens/CategoryPages/Components/ProductList.dart';


class HobbiesPage extends StatefulWidget {
  final CollectionReference _productRef= FirebaseFirestore.instance.collection("Products");
  @override
  _HobbiesPageState createState() => _HobbiesPageState();
}

class _HobbiesPageState extends State<HobbiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(),
      body: Container(
        child: Stack(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: widget._productRef.get(),
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
                      top: 108.0,
                      bottom: 12.0,
                    ),
                    children: snapshot.data.docs.map((document) {
                      return ProductList(
                        title: document.data()['name'],
                        imageUrl: document.data()['image'],
                        price: "\$${document.data()['price']}",
                        productId: document.id,
                        productRef: widget._productRef,
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
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
