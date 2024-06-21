import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AddTracker extends StatefulWidget {
  @override
  _AddTrackerState createState() => _AddTrackerState();
}

class _AddTrackerState extends State<AddTracker> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  String? _selectedCondition;
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

    // Save to Firebase
    await FirebaseFirestore.instance.collection('skin_tracker').add({
      'date': _selectedDate,
      'condition': _selectedCondition,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Date: ${DateFormat.yMd().format(_selectedDate)}',
                ),
                trailing: Icon(Icons.calendar_today),
                onTap: _presentDatePicker,
              ),
              DropdownButtonFormField<String>(
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Add Condition'),
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
