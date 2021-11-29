import 'package:english_lettutor_app/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar(
      {Key? key, required this.onTextChanged, required this.onIconPressed})
      : super(key: key);
  final ValueChanged<String>? onTextChanged;
  final VoidCallback? onIconPressed;
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(right: 10),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 20,
            color: kPrimaryColor.withOpacity(0.23),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              onChanged: widget.onTextChanged,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: kPrimaryColor.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          IconButton(
              onPressed: widget.onIconPressed,
              icon: const Icon(Icons.search_rounded)),
        ],
      ),
    );
  }
}
