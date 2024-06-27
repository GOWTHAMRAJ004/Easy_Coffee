import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String uid;
  //the user id gets from the databaseserver
  DatabaseServices({required this.uid});
  //these will store all data of collection also retriving data from database\
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brew');
  /*using these we can store or remove or update collection using
  thes (brewcollection) variable the brew defines the collection name
   */
//creating the user parameter at default value in the form
  Future UpdateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugar': sugars, 'name': name, 'strength': strength});
  }

  //getting the collection of brew in the form of stream and it will give a snapshort
  Stream<QuerySnapshot> get brew {
    return brewCollection.snapshots();
  }
}
