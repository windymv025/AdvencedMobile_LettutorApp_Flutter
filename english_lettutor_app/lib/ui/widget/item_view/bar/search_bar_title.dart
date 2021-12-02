import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar.dart';
import 'package:flutter/material.dart';

class SearchBarTitle extends StatefulWidget {
  const SearchBarTitle({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  _SearchBarTitleState createState() => _SearchBarTitleState();
}

class _SearchBarTitleState extends State<SearchBarTitle> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    var backgroundColor = isDark ? kDarkColor : kMainBlueColor;
    return Stack(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 25, top: 20, right: 25, bottom: 30),
          margin: const EdgeInsets.only(bottom: 25),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
          ),
          child: Container(
            color: backgroundColor,
            child: widget.child,
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SearchBar(
              onIconPressed: () {
                setState(() {});
              },
              onTextChanged: (value) {
                setState(() {});
              },
            )),
      ],
    );
  }
}
