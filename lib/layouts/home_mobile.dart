import 'package:flutter/material.dart';

import 'package:lyric_notes/screens/edit_document/edit_document.dart';
import 'package:lyric_notes/models/document.dart';

class HomeLayoutMobile extends StatefulWidget {
  @override
  createState() => _HomeLayoutMobileState();
}

class _HomeLayoutMobileState extends State<HomeLayoutMobile>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return EditDocumentScreen(
      document: Document(
        title: "TestDocument",
        body: "The body of this document",
      ),
    );
  }
}
