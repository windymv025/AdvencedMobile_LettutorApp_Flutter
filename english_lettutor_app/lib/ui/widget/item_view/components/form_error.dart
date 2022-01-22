import 'package:english_lettutor_app/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String?> errors;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    // if (errors == null || errors.isEmpty) {
    //   return const SizedBox.shrink();
    // } else {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index]!)),
    );
    // }
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.assetsIconsError,
          height: 14,
          width: 14,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(error),
      ],
    );
  }
}
