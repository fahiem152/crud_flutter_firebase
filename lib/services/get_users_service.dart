import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter_firebase/models/user_model.dart';
import 'package:firebase_core/firebase_core.dart';

Stream<List<User>> readUser() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
