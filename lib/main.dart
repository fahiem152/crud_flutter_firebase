import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:crud_flutter_firebase/models/user_model.dart';
import 'package:crud_flutter_firebase/pages/add_user_page.dart';
import 'package:crud_flutter_firebase/pages/users_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UsersPage(),
    );
  }
}
