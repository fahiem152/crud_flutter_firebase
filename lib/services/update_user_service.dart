import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter_firebase/models/user_model.dart';

void updateUser(User user) async {
  // Referance to Document
  final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);
  final json = user.toJson();
  // create document and write data to firebase
  await docUser.update(json);
}
