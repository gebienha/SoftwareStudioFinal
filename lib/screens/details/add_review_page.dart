import 'package:flutter/material.dart';

class AddReviewScreen extends StatefulWidget {
  static String routeName = "/add_review";

  const AddReviewScreen({Key? key}) : super(key: key);

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  int _rating = 0;
  String _selectedUsagePeriod = '1 day';
  bool _isOtherSelected = false;
  final TextEditingController _otherUsageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _otherUsageController.dispose();
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Review"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Your Review",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _reviewController,
              decoration: const InputDecoration(
                labelText: "Review",
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    color: index < _rating ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Usage Period",
                border: OutlineInputBorder(),
              ),
              value: _selectedUsagePeriod,
              items: ['1 day', '1 week', '2 weeks', '3 weeks', 'Other']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedUsagePeriod = value!;
                  _isOtherSelected = _selectedUsagePeriod == 'Other';
                });
              },
            ),
            const SizedBox(height: 20),
            if (_isOtherSelected)
              TextField(
                controller: _otherUsageController,
                decoration: const InputDecoration(
                  labelText: "Specify Usage Period",
                  border: OutlineInputBorder(),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty && _reviewController.text.isNotEmpty && _rating > 0) {
                  final usagePeriod = _isOtherSelected ? _otherUsageController.text : _selectedUsagePeriod;
                  final newReview = {
                    'name': _nameController.text,
                    'comment': _reviewController.text,
                    'rating': _rating,
                    'usagePeriod': usagePeriod,
                    'image': 'assets/images/user-placeholder.png', // Placeholder image
                  };

                  Navigator.pop(context, newReview);
                }
              },
              child: const Text("Submit Review"),
            ),
          ],
        ),
      ),
    );
  }
}
