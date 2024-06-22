import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'add_tracker.dart';
import 'info.dart';

class SkinTracker extends StatefulWidget {
  static const routeName = '/skin-tracker';

  @override
  _SkinTrackerState createState() => _SkinTrackerState();
}

class _SkinTrackerState extends State<SkinTracker> with TickerProviderStateMixin {
  static const _initialDelayTime = Duration(milliseconds: 200);
  static const _itemSlideTime = Duration(milliseconds: 800);
  static const _staggerTime = Duration(milliseconds: 200);
  static const _buttonDelayTime = Duration(milliseconds: 400);
  static const _buttonTime = Duration(milliseconds: 1200);

  late AnimationController _staggeredController;
  late List<Interval> _itemSlideIntervals;
  late Interval _buttonInterval;

  final Map<String, Color> conditionColors = {
    'Breakouts': Color(0xFF8AD6B7),
    'Acne': Color(0xFFC0DEA9),
    'Flaring': Color(0xFFA3CB8F),
    'Redness': Color(0xFFB3816E),
    'Dryness': Color(0xFFC7A26B),
    'Oiliness': Color(0xFFDED2AA),
  };

  final Map<String, IconData> conditionIcons = {
    'Breakouts': Icons.face,
    'Acne': Icons.warning,
    'Flaring': Icons.local_fire_department,
    'Redness': Icons.color_lens,
    'Dryness': Icons.opacity,
    'Oiliness': Icons.oil_barrel,
  };

  @override
  void initState() {
    super.initState();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _calculateAnimationDuration(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _staggeredController.forward();
    });

    _createAnimationIntervals();
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  void _openInfoOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => TutorialPage(),
    );
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
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Center(child: Text('Please sign in to view your skin conditions.'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Skin Condition Tracker'),
        actions: [
          IconButton(
            onPressed: _openInfoOverlay,
            icon: const Icon(Icons.info_rounded),
          ),
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
            .where('userId', isEqualTo: user.uid)
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('An error occurred: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No skin conditions added yet.'));
          }
          final documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) {
              var doc = documents[index];
              var condition = doc['condition'] as String?;
              var description = doc['description'] as String?;
              var date = (doc['date'] as Timestamp?)?.toDate();

              if (condition == null || description == null || date == null) {
                return ListTile(
                  title: Text('Invalid data'),
                  subtitle: Text('Please check the database.'),
                );
              }

              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: conditionColors[condition] ?? Colors.grey,
                  child: Icon(
                    conditionIcons[condition] ?? Icons.help,
                    color: Colors.white,
                  ),
                ),
                title: Text(condition),
                subtitle: Text('${DateFormat.yMd().format(date)}\n$description'),
                isThreeLine: true,
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteRecord(context, doc.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
