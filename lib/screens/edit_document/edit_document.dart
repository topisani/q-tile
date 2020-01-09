import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

import 'package:lyric_notes/models/document.dart';

class EditDocumentScreen extends StatelessWidget {
  final Document document;

  EditDocumentScreen({@required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Edit Document")),
        body: DocumentBodyEdit(document: document));
  }
}

class DocumentBodyEdit extends StatefulWidget {
  final Document document;

  DocumentBodyEdit({Key key, this.document}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DocumentBodyEditState();
}

class _DocumentBodyEditState extends State<DocumentBodyEdit> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.document.body);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            maxLines: null,
          ),
        ),
      ],
    );
  }
}


