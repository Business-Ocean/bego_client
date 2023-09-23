import 'package:flutter/material.dart';

class TabBarExample extends StatelessWidget {
  const TabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Primary and secondary TabBar'),
          bottom: const TabBar(
            dividerColor: Colors.transparent,
            tabs: <Widget>[
              Tab(
                text: 'Flights',
                icon: Icon(Icons.flight),
              ),
              Tab(
                text: 'Trips',
                icon: Icon(Icons.luggage),
              ),
              Tab(
                text: 'Explore',
                icon: Icon(Icons.explore),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            NestedTabBar('Flights'),
            NestedTabBar('Trips'),
            NestedTabBar('Explore'),
          ],
        ),
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar.secondary(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'Overview'),
            Tab(text: 'Specifications'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(child: Text('${widget.outerTab}: Overview tab')),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(
                    child: Text('${widget.outerTab}: Specifications tab')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('Day'),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month'),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Year'),
            icon: Icon(Icons.calendar_today)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}
