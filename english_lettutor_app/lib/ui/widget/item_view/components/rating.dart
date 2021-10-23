import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  const Rating(
      {Key? key,
      required this.onRatingUpdate,
      required this.rating,
      this.isEnable = false})
      : super(key: key);
  final VoidCallback? onRatingUpdate;
  final double rating;
  final bool isEnable;
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    if (widget.rating > 0.0) {
      if (widget.isEnable) {
        return RatingBar.builder(
          initialRating: widget.rating,
          minRating: 1,
          itemSize: 20,
          direction: Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            widget.onRatingUpdate;
          },
        );
      } else {
        return RatingBarIndicator(
          rating: widget.rating,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemCount: 5,
          itemSize: 20.0,
          unratedColor: Colors.amber.withAlpha(80),
          direction: Axis.horizontal,
          itemPadding: const EdgeInsets.symmetric(horizontal: 0),
        );
      }
    } else {
      return const Text(
        "No reviews yet",
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
      );
    }
  }
}
