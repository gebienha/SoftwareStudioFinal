import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddTracker extends StatefulWidget {
  @override
  _AddTrackerState createState() => _AddTrackerState();
}

class _AddTrackerState extends State<AddTracker> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  String? _selectedCondition;
  final _descController = TextEditingController();
  final List<String> _conditions = [
    'Breakouts',
    'Acne',
    'Flaring',
    'Redness',
    'Dryness',
    'Oiliness'
  ];

  Future<void> _submitData() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    // Get current user
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    // Save to Firebase
    await FirebaseFirestore.instance.collection('skin_tracker').add({
      'date': _selectedDate,
      'condition': _selectedCondition,
      'description': _descController.text,
      'userId': user.uid, // Include the userId field
      'timestamp': FieldValue.serverTimestamp(),
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Skin Condition'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Condition'),
                      items: _conditions
                          .map((condition) => DropdownMenuItem(
                                child: Text(condition),
                                value: condition,
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCondition = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a condition';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: ListTile(
                      title: Text(
                        'Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                      trailing: Icon(Icons.calendar_today),
                      onTap: _presentDatePicker,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Add Condition'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                child: Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
}
