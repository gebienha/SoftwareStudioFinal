import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/screens/skintracker/add_tracker.dart';

class SkinTracker extends StatelessWidget {
  static const routeName = '/skin-tracker';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skin Condition Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddTracker(),
              ));
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('skin_tracker')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final skinData = snapshot.data!.docs;
          return ListView.builder(
            itemCount: skinData.length,
            itemBuilder: (ctx, index) {
              final data = skinData[index];
              final date = (data['date'] as Timestamp).toDate();
              final condition = data['condition'];

              return ListTile(
                title: Text(condition),
                subtitle: Text(DateFormat.yMd().format(date)),
              );
            },
          );
        },
      ),
    );
  }
}
