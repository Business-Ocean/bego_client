import 'package:flutter/material.dart';

class PinnedSearchBarApp extends StatefulWidget {
  const PinnedSearchBarApp({super.key});

  @override
  State<PinnedSearchBarApp> createState() => _PinnedSearchBarAppState();
}

class _PinnedSearchBarAppState extends State<PinnedSearchBarApp> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          floating:
              true, // We can also uncomment this line and set `pinned` to true to see a pinned search bar.
          title: SearchAnchor.bar(
            barHintText: 'Search',
            viewHintText: 'View Hint',
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<Widget>.generate(
                5,
                (int index) {
                  return ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text('Initial list item $index'),
                  );
                },
              );
            },
          ),
        ),
        // The listed items below are just for filling the screen
        // so we can see the scrolling effect.
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 100.0,
                  child: Card(
                    child: Center(child: Text('Card $index')),
                  ),
                );
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar(
              hintText: 'Hint',
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDelegate extends SearchDelegate<String> {
  List<String> data = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
  ];

  @override
  List<Widget> buildActions(BuildContext context) =>
      [IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: const Icon(Icons.chevron_left),
      onPressed: () => close(context, ''));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    var listToShow = data;
    if (query.isNotEmpty) {
      listToShow = data.where((e) => e.contains(query)).toList();
    }

    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (_, i) {
        var noun = listToShow[i];
        return ListTile(
          title: Text(noun),
          onTap: () => close(context, noun),
        );
      },
    );
  }
}
