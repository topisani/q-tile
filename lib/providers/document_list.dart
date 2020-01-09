import 'dart:collection';
import 'package:flutter/material.dart';
import '../models/document.dart';

class DocumentList extends ChangeNotifier {
  final List<Document> _documents = [
    Document(title: 'Finish the app'),
    Document(title: 'Write a blog post'),
    Document(title: 'Share with community'),
  ];

  get allDocuments => UnmodifiableListView(_documents);

  void addDocument(Document d) {
    _documents.add(d);
    notifyListeners();
  }

  void deleteDocument(Document d) {
    _documents.remove(d);
    notifyListeners();
  }
}
