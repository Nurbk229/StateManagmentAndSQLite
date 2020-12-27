import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tababar/task_model.dart';
import 'package:provider/provider.dart';
import 'database_provider.dart';
import 'deleteItem.dart';

class TasksWidget extends StatelessWidget {
  Task task;

  TasksWidget(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteItem(context, task).then((value) {
                    Provider.of<ProviderDatabase>(context).deleteTask(task.id);
                  });
                }),
            Text(this.task.taskName),
            Checkbox(
                value: task.isComplete,
                onChanged: (value) {
                  this.task.isComplete = value;
                  Provider.of<ProviderDatabase>(context, listen: false)
                      .updateTask(this.task);
                })
          ],
        ),
      ),
    );
  }
}
