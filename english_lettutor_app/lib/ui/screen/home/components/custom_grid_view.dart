import 'package:english_lettutor_app/ui/widget/item_list/tutor_item.dart';
import 'package:english_lettutor_app/ui/widget/item_view/no_data_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView(
      {Key? key, required this.columnRatio, required this.items})
      : super(key: key);

  final List<TutorItem>? items;
  final int columnRatio;

  @override
  Widget build(BuildContext context) {
    if (items == null || items!.isEmpty) {
      return const NoDataPage();
    }
    return StaggeredGridView.countBuilder(
      primary: false,
      crossAxisCount: items!.length,
      itemBuilder: (context, index) {
        return items![index];
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(columnRatio),
    );
  }
}
