import 'dart:collection';
import 'package:flutter/material.dart';

import '../models/task.dart';
import './task_list_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({@required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView(children: buildChildrenList());
  }

  List buildChildrenList() => tasks.map((t) => TaskListItem(task: t)).toList();
}
