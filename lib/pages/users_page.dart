import 'package:crud_flutter_firebase/models/user_model.dart';
import 'package:crud_flutter_firebase/pages/add_user_page.dart';
import 'package:crud_flutter_firebase/pages/update_user_page.dart';
import 'package:crud_flutter_firebase/services/delete_user_service.dart';
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
              return Center(
                child: CircularProgressIndicator(),
              );
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

  Widget buildUser(User user) => Container(
        margin: EdgeInsets.all(12),

        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                '${user.age}',
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name),
                Text(user.birthday.toIso8601String()),
              ],
            ),
            Spacer(),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateUserPage(
                          user: user,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    deleteUser(user);
                  },
                ),
              ],
            ),
          ],
        ),
        //
      );
}
