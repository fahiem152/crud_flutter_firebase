import 'package:crud_flutter_firebase/models/user_model.dart';
import 'package:crud_flutter_firebase/services/create_user_service.dart';
import 'package:crud_flutter_firebase/services/get_users_service.dart';
import 'package:crud_flutter_firebase/services/update_user_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpdateUserPage extends StatefulWidget {
  final User user;
  const UpdateUserPage({super.key, required this.user});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController =
        TextEditingController(text: widget.user.birthday.toIso8601String());
    _nameController = TextEditingController(text: widget.user.name);
    _ageController = TextEditingController(text: widget.user.age.toString());
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration(String label) => InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        );
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Update User',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: _nameController,
            decoration: decoration('Name'),
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
            controller: _ageController,
            decoration: decoration('Age'),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.all(8),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _dateController.text == ''
                      ? 'Birthday'
                      : _dateController.text,
                ),
                IconButton(
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.blue,
                  ),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      String formatDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formatDate);
                      setState(() {
                        _dateController.text = formatDate;
                      });
                    } else {
                      print('Date is not selected');
                    }
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 28,
          ),
          ElevatedButton(
            onPressed: () {
              final user = User(
                id: widget.user.id,
                name: _nameController.text,
                age: int.parse(_ageController.text),
                birthday: DateTime.parse(_dateController.text),
              );
              updateUser(user);
              Navigator.pop(context);
            },
            child: Text(
              'Update User',
            ),
          )
        ],
      ),
    );
  }
}
