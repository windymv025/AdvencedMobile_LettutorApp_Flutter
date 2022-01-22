import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiItemSelectField extends StatefulWidget {
  const MultiItemSelectField(
      {Key? key,
      required this.items,
      required this.onConfirm,
      required this.icon,
      this.initialValue,
      this.validator,
      this.onTap,
      this.title,
      this.buttonText})
      : super(key: key);
  final List<String> items;
  final List<String>? initialValue;
  final String? Function(List<Object?>?)? validator;
  final void Function(List<Object?>) onConfirm;
  final dynamic Function(Object?)? onTap;
  final String? title;
  final String? buttonText;
  final IconData icon;
  @override
  _MultiItemSelectFieldState createState() => _MultiItemSelectFieldState();
}

class _MultiItemSelectFieldState extends State<MultiItemSelectField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: kMainBlueColor),
      ),
      child: MultiSelectBottomSheetField(
        validator: widget.validator,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
        ),
        initialChildSize: 0.6,
        maxChildSize: 0.85,
        listType: MultiSelectListType.LIST,
        searchable: true,
        buttonText: Text(widget.buttonText ?? "",
            style:
                TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7))),
        title: Text(
          widget.title ?? "",
          style: titleBlueStyle,
        ),
        buttonIcon: Icon(
          widget.icon,
          color: Colors.grey,
        ),
        initialValue: widget.initialValue,
        items: widget.items.map((e) => MultiSelectItem<String>(e, e)).toList(),
        onConfirm: widget.onConfirm,
        cancelText: Text(S.current.cancel),
        confirmText: const Text("OK"),
        chipDisplay: MultiSelectChipDisplay(
          chipColor: kMainBlueColor,
          textStyle: chipStyleOn,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
