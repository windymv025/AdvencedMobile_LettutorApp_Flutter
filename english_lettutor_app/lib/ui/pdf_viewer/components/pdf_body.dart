import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFBody extends StatefulWidget {
  const PDFBody(
      {Key? key,
      required this.url,
      required this.controller,
      this.onPageChanged})
      : super(key: key);
  final String url;
  final PdfViewerController controller;
  final PdfPageChangedCallback? onPageChanged;

  @override
  _PDFBodyState createState() => _PDFBodyState();
}

class _PDFBodyState extends State<PDFBody> {
  @override
  Widget build(BuildContext context) {
    try {
      return SfPdfViewer.network(
        widget.url,
        controller: widget.controller,
        onPageChanged: widget.onPageChanged,
      );
    } on Exception {
      return Center(
        child: Text(
          S.current.error_loading_PDF,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }
  }
}
