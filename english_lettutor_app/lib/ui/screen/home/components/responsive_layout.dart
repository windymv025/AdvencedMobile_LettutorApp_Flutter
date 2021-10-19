import 'package:english_lettutor_app/ui/widget/item_list/tutor_item.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

import 'custom_grid_view.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({Key? key, required this.items}) : super(key: key);
  final List<TutorItem>? items;

  @override
  _ResponsiveLayoutState createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        if (dimens.maxWidth <= kMobileBreakpoint) {
          return CustomGridView(
            columnRatio: 12,
            items: widget.items,
          );
        } else if (dimens.maxWidth > kMobileBreakpoint &&
            dimens.maxWidth <= kTabletBreakpoint) {
          return CustomGridView(
            items: widget.items,
            columnRatio: 6,
          );
        } else if (dimens.maxWidth > kTabletBreakpoint &&
            dimens.maxWidth <= kDesktopBreakPoint) {
          return CustomGridView(
            items: widget.items,
            columnRatio: 4,
          );
        } else {
          return CustomGridView(
            columnRatio: 3,
            items: widget.items,
          );
        }
      },
    );
  }
}
