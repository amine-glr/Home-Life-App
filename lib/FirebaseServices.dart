import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices{
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirebaseAuth _firebaseAuth= FirebaseAuth.instance;

  String getUserId(){
    return _firebaseAuth.currentUser.uid;
  }

  final CollectionReference usersRef= FirebaseFirestore.instance.collection("Users");

  final CollectionReference cartProductRef= FirebaseFirestore.instance.collection("Users");





}