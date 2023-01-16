import 'package:crud_flutter_firebase/models/user_model.dart';
import 'package:crud_flutter_firebase/pages/add_user_page.dart';
import 'package:crud_flutter_firebase/services/get_users_service.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: StreamBuilder<List<User>>(
          stream: readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went Wrong! :${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView(children: users.map(buildUser).toList());
            } else {
              return CircularProgressIndicator();
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUserPage(),
            ),
          );
        },
      ),
    );
  }

  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(
          child: Text(
            '${user.age}',
          ),
        ),
        title: Text(user.name),
        subtitle: Text(user.birthday.toIso8601String()),
      );
}
