import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchBarTitle extends StatefulWidget {
  const SearchBarTitle({Key? key, required this.size, this.child})
      : super(key: key);
  final Size size;
  final Widget? child;

  @override
  _SearchBarTitleState createState() => _SearchBarTitleState();
}

class _SearchBarTitleState extends State<SearchBarTitle> {
  @override
  Widget build(BuildContext context) {
    Size size = widget.size;
    double height =
        widget.child == null ? size.height * 0.15 : size.height * 0.35;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: height,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            height: height - 25,
            decoration: const BoxDecoration(
              color: kMainBlueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Container(
              color: kMainBlueColor,
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
      ),
    );
  }
}
