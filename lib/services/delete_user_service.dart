import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter_firebase/models/user_model.dart';

Future deleteUser(User user) async {
  final docRef = FirebaseFirestore.instance.collection('users').doc(user.id);
  await docRef.delete();
}
