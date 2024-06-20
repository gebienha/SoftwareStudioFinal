import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'state/filters_notifier.dart';
import 'package:provider/provider.dart';

class FiltersPage extends StatefulWidget{
  static const String routeName = "/filter";
  const FiltersPage({
    super.key,
  });

  @override
  State<FiltersPage> createState() => _FiltersPage();
}

class _FiltersPage extends State<FiltersPage> with SingleTickerProviderStateMixin {
  static const _productTitles = [
    'All Skin Type',
    'Oily Skin',
    'Dry Skin',
    'Combination Skin',
  ];

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 400);
  static const _staggerTime = Duration(milliseconds: 100);
  static const _buttonDelayTime = Duration(milliseconds: 200);
  static const _buttonTime = Duration(milliseconds: 800);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _productTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  late AnimationController _staggeredController;
  late List<Interval> _itemSlideIntervals;
  late Interval _buttonInterval;

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    _itemSlideIntervals = [];
    for (var i = 0; i < _productTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime = Duration(milliseconds: (_productTitles.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ..._buildListItems(),
        const Spacer(),
      ],
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < _productTitles.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: _buildFilterItem(context, i),
        ),
      );
    }
    return listItems;
  }

  Widget _buildFilterItem(BuildContext context, int index) {
    final filtersNotifier = Provider.of<FiltersNotifier>(context);
    final filter = Filter.values[index];

    return SwitchListTile(
      value: filtersNotifier.filters[filter]!,
      onChanged: (isChecked) {
        filtersNotifier.setFilter(filter, isChecked);
      },
      title: Text(
        _productTitles[index],
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      subtitle: Text(
        'Only include product/s for ${_productTitles[index]}.',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      activeColor: kPrimaryColor,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }

  
}
