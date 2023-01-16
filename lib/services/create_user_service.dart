import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter_firebase/models/user_model.dart';

Future createUSer(User user) async {
  // Referance to Document
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  user.id = docUser.id;

  /// static data
  // final user = User(
  //   id: docUser.id,
  //   name: name,
  //   age: 21,
  //   birthday: DateTime(2000, 8, 30),
  // );

  final json = user.toJson();
  // create document and write data to firebase
  await docUser.set(json);
}
