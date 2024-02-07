

import 'package:cloud_firestore/cloud_firestore.dart';

mixin class IdModel{
  String? id;
}

abstract class FirebaseBaseModel<T extends IdModel>{

  T fromJson(Map<String,dynamic> json);

  Map<String,dynamic> toJson();


  T? fromFirebase(DocumentSnapshot<Map<String,dynamic>> snapshot){
    final value = snapshot.data();
    if(value == null) {
      throw Exception("Data is null");
    }
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }

   
}