import 'package:flutter/material.dart';
import '../common/size_fit.dart';
import '../common/int_extension.dart';
import '../common/double_extension.dart';


class CustomSearchDelegate extends SearchDelegate<String> {

  @override
  String get searchFieldLabel => '请输入食物名称进行搜索';

  @override
  TextStyle get searchFieldStyle => TextStyle(
    fontSize: 15.px,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  @override
  TextInputType get keyboardType => TextInputType.text;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: theme.primaryColor,
      primaryIconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: theme.textTheme.copyWith(
        headline6: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: '清除输入的文字',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: '返回',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    print(query);
    return ListView(
      children: [
        ListTile(title: Text('Result 01')),
        ListTile(title: Text('Result 02')),
        ListTile(title: Text('Result 03')),
        ListTile(title: Text('Result 04')),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text('suggest 01')),
        ListTile(title: Text('suggest 02')),
        ListTile(title: Text('suggest 03')),
        ListTile(title: Text('suggest 04')),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Container(
      width: 328.px,
      height: 36.px,
      margin: EdgeInsets.only(
        top: 32.px,
        left: 24.px,
        right: 24.px,
        bottom: 24.px,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.px),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              // offset: Offset(0, 1)
            )
          ]),
      child: TextField(),
    );
  }
}
