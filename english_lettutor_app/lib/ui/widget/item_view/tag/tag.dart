import 'package:english_lettutor_app/utilities/styles.dart';
import 'package:flutter/material.dart';

class Tag extends StatefulWidget {
  const Tag({Key? key, required this.label, this.canPress = false, this.focus = false})
      : super(key: key);
  final bool canPress;
  final String label;
  final bool focus;

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  var _textStyle = Styles.chipStyleOff;
  var _buttonStyle = Styles.tagButtonStyleOff;
  var _isSelected = false;

  void onTagPressListener() {
    setState(() {
      if (widget.canPress) {
        _isSelected = !_isSelected;
        _textStyle = _isSelected ? Styles.chipStyleOn : Styles.chipStyleOff;
        _buttonStyle =
            _isSelected ? Styles.tagButtonStyleOn : Styles.tagButtonStyleOff;
      }
      //TODO
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.focus){
      _isSelected = true;
      _textStyle = Styles.chipStyleOn;
      _buttonStyle = Styles.tagButtonStyleOn;
    }

    return Container(
      child: ElevatedButton(
        onPressed: onTagPressListener,
        child: Text(
          widget.label,
          style: _textStyle,
        ),
        style: _buttonStyle,
      ),
      padding: const EdgeInsets.all(5),
      height: 40,
    );
  }
}
