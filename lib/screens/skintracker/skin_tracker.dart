import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/screens/skintracker/add_tracker.dart';

class SkinTracker extends StatefulWidget {
  static const routeName = '/skin-tracker';

  @override
  _SkinTrackerState createState() => _SkinTrackerState();
}

class _SkinTrackerState extends State<SkinTracker>
    with TickerProviderStateMixin {
  static const _initialDelayTime = Duration(milliseconds: 200); // Adjusted initial delay
  static const _itemSlideTime = Duration(milliseconds: 800); // Adjusted item slide time
  static const _staggerTime = Duration(milliseconds: 200); // Adjusted stagger time
  static const _buttonDelayTime = Duration(milliseconds: 400); // Adjusted button delay
  static const _buttonTime = Duration(milliseconds: 1200); // Adjusted button time

  late AnimationController _staggeredController;
  late List<Interval> _itemSlideIntervals;
  late Interval _buttonInterval;

  // Define a map of conditions to colors
  final Map<String, Color> conditionColors = {
  'Breakouts': Color(0xFF8AD6B7), // Change hexadecimal to Color object
  'Acne': Color(0xFFCEE9DB), // Change hexadecimal to Color object
  'Flaring': Color(0xFF1A6B52), // Change hexadecimal to Color object
  'Redness': Color(0xFFC6E7FF), // Change hexadecimal to Color object
  'Dryness': Color(0xFF4C6359), // Change hexadecimal to Color object
  'Oiliness': Color(0xFF0D6B58), // Change hexadecimal to Color object
};

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _calculateAnimationDuration(),
    );
    _staggeredController.forward();
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  void _createAnimationIntervals() {
    _itemSlideIntervals = [];
    for (var i = 0; i < conditionColors.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _calculateAnimationDuration().inMilliseconds,
          endTime.inMilliseconds / _calculateAnimationDuration().inMilliseconds,
          curve: Curves.easeInOut,
        ),
      );
    }

    final buttonStartTime = _initialDelayTime +
        (_staggerTime * conditionColors.length) +
        _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _calculateAnimationDuration().inMilliseconds,
      buttonEndTime.inMilliseconds / _calculateAnimationDuration().inMilliseconds,
      curve: Curves.easeInOut,
    );
  }

  Duration _calculateAnimationDuration() {
    return _initialDelayTime +
        (_staggerTime * conditionColors.length) +
        _buttonDelayTime +
        _buttonTime;
  }

  void _deleteRecord(BuildContext context, String id) async {
    await FirebaseFirestore.instance.collection('skin_tracker').doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Skin condition deleted.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

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

          if (skinData.isEmpty) {
            return Center(
              child: Text(
                'No skin condition records found.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return AnimatedList(
            key: GlobalKey<AnimatedListState>(),
            initialItemCount: skinData.length,
            itemBuilder: (ctx, index, animation) {
              final data = skinData[index];
              final date = (data['date'] as Timestamp).toDate();
              final condition = data['condition'];
              final description = data['description']; // Retrieve description
              final id = data.id;

              // Determine background color based on condition
              Color? backgroundColor = conditionColors[condition];

              // Delay animation for each item
              final itemAnimation = Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _staggeredController,
                  curve: Interval(
                    _itemSlideIntervals[index].begin,
                    _itemSlideIntervals[index].end,
                    curve: Curves.easeInOut,
                  ),
                ),
              );

              return SizeTransition(
                sizeFactor: itemAnimation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: backgroundColor ?? Colors.white, // Default to white if color not found
                    ),
                    child: Dismissible(
                      key: ValueKey(id),
                      background: Container(color: Colors.red),
                      onDismissed: (direction) {
                        _deleteRecord(context, id);
                      },
                      child: ListTile(
                        title: Text(
                          condition,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Adjust text color if needed
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(DateFormat.yMd().format(date)),
                            SizedBox(height: 5),
                            Text(description), // Display description
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteRecord(context, id),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
