import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tag extends StatefulWidget {
  const Tag(
      {Key? key,
      required this.label,
      this.canPress = false,
      this.focus = false})
      : super(key: key);
  final bool canPress;
  final String label;
  final bool focus;

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  var _textStyle = chipStyleOff;
  var _buttonStyle = tagButtonStyleOff;
  var _isSelected = false;
  late TeacherDTO teacherDTO;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    teacherDTO = Provider.of<TeacherDTO>(context);
  }

  void onTagPressListener() {
    setState(() {
      if (widget.canPress) {
        _isSelected = !_isSelected;
        _textStyle = _isSelected ? chipStyleOn : chipStyleOff;
        _buttonStyle = _isSelected ? tagButtonStyleOn : tagButtonStyleOff;
        teacherDTO.addSpeciality(widget.label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.focus) {
      _isSelected = true;
      _textStyle = chipStyleOn;
      _buttonStyle = tagButtonStyleOn;
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
      margin: const EdgeInsets.only(top: 5, right: 5),
      height: 25,
    );
  }
}
