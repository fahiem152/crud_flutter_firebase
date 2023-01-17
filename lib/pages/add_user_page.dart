import 'package:crud_flutter_firebase/models/user_model.dart';
import 'package:crud_flutter_firebase/services/create_user_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    InputDecoration decoration(String label) => InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        );
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Add User',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameController,
            decoration: decoration('Name'),
          ),
          const SizedBox(
            height: 24,
          ),
          TextField(
            controller: ageController,
            decoration: decoration('Age'),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            padding: const EdgeInsets.all(8),
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
                  dateController.text == '' ? 'Birthday' : dateController.text,
                ),
                IconButton(
                  icon: const Icon(
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
                      setState(() {
                        dateController.text = formatDate;
                      });
                    } else {
                      print('Date is not selected');
                    }
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          ElevatedButton(
            onPressed: () {
              final user = User(
                name: nameController.text,
                age: int.parse(ageController.text),
                birthday: DateTime.parse(dateController.text),
              );
              createUSer(user);
            },
            child: const Text(
              'Create',
            ),
          )
        ],
      ),
    );
  }
}
