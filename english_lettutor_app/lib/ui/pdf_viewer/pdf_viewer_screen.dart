import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/helper/keyboard.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/ui/pdf_viewer/components/pdf_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewScreen extends StatefulWidget {
  static const String routeName = '/pdf_view_screen_route';
  const PDFViewScreen({Key? key}) : super(key: key);

  @override
  _PDFViewScreenState createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PDFViewScreen> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  final TextEditingController _textEditingController = TextEditingController();
  bool _isSearching = false;
  PdfTextSearchResult? _searchResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String url = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                controller: _textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: S.current.search,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(7),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onSubmitted: (value) => search(value),
              )
            : const Text('PDF View'),
        actions: [
          Visibility(
            visible: !_isSearching,
            child: IconButton(
              tooltip: S.current.search,
              icon: const Icon(Icons.search_rounded),
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
            ),
          ),
          Visibility(
            visible: _isSearching,
            child: IconButton(
              tooltip: S.current.cancel,
              icon: const Icon(
                Icons.clear_rounded,
              ),
              onPressed: () {
                setState(() {
                  _isSearching = false;
                  _searchResult?.clear();
                });
              },
            ),
          ),
          Visibility(
            visible: _searchResult?.hasResult ?? false,
            child: IconButton(
              tooltip: S.current.previous,
              icon: const Icon(
                Icons.keyboard_arrow_up_rounded,
              ),
              onPressed: () {
                _searchResult?.previousInstance();
              },
            ),
          ),
          Visibility(
            visible: _searchResult?.hasResult ?? false,
            child: IconButton(
              tooltip: S.current.next,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
              ),
              onPressed: () {
                _searchResult?.nextInstance();
              },
            ),
          ),
        ],
      ),
      body: PDFBody(
        url: url,
        controller: _pdfViewerController,
        onPageChanged: (page) {
          setState(() {});
        },
      ),
      floatingActionButton: _pdfViewerController.pageNumber != 1
          ? FloatingActionButton(
              onPressed: () {
                _pdfViewerController.firstPage();
              },
              child: const Icon(
                Icons.arrow_circle_up_rounded,
                size: 32,
              ),
              backgroundColor: kMainBlueColor,
            )
          : null,
    );
  }

  void search(String text) async {
    _searchResult?.clear();
    KeyboardUtil.hideKeyboard(context);
    if (text.isEmpty) {
      return;
    }
    _searchResult = await _pdfViewerController.searchText(text);
    setState(() {});
  }
}
