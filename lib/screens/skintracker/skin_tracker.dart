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
        title: Text('Skin Condition Tracker', style: TextStyle(color: Theme.of(context).colorScheme.onBackground)),
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
            return Center(child: Text('An error occurred: ${snapshot.error}', style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onPrimaryContainer)));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No skin conditions added yet.', style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.onPrimaryContainer)));
          }
          
          final skinData = snapshot.data!.docs;

          return AnimatedList(
            key: GlobalKey<AnimatedListState>(),
            initialItemCount: skinData.length,
            itemBuilder: (ctx, index, animation) {
              final data = skinData[index];
              final date = (data['date'] as Timestamp).toDate();
              final condition = data['condition'];
              final description = data['description'];
              final id = data.id;

              Color? backgroundColor = conditionColors[condition];
              IconData? conditionIcon = conditionIcons[condition];

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
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // color: Colors.grey[200], // Set card background to light gray
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    child: Dismissible(
                      key: ValueKey(id),
                      background: Container(color: Colors.red),
                      onDismissed: (direction) {
                        _deleteRecord(context, id);
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: backgroundColor,
                          child: Icon(conditionIcon, color: Theme.of(context).colorScheme.secondaryContainer),
                        ),
                        title: Text(
                          condition,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondaryContainer,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(DateFormat.yMd().format(date), style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer)),
                            SizedBox(height: 5),
                            Text(description, style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer)),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.onPrimaryContainer),
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
