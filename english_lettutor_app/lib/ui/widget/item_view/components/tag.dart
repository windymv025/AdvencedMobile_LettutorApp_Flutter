import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tag extends StatefulWidget {
  const Tag({
    Key? key,
    required this.label,
    this.canPress = false,
    this.focus = false,
  }) : super(key: key);
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void onTagPressListener() {
    setState(() {
      if (widget.canPress) {
        _isSelected = !_isSelected;
        _textStyle = _isSelected ? chipStyleOn : chipStyleOff;
        _buttonStyle = _isSelected ? tagButtonStyleOn : tagButtonStyleOff;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TeacherDTO teacherDTO = context.watch<TeacherDTO>();

    if (teacherDTO.getSpecialities().contains(widget.label) || widget.focus) {
      _isSelected = true;
      _textStyle = chipStyleOn;
      _buttonStyle = tagButtonStyleOn;
    } else {
      _isSelected = false;
      _textStyle = chipStyleOff;
      _buttonStyle = tagButtonStyleOff;
    }
    return Container(
      child: ElevatedButton(
        onPressed: () {
          onTagPressListener();
          if (_isSelected) {
            if (widget.label == kAllTeachers) {
              teacherDTO.clearSpecialities();
            } else {
              teacherDTO.addSpeciality(widget.label);
            }
          } else {
            teacherDTO.removeSpeciality(widget.label);
          }
        },
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
