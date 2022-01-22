import 'package:english_lettutor_app/constants/assets.dart';
import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset(Assets.assetsImagesNoDataFound),
        height: 130,
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
