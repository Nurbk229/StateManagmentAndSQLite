import 'package:flutter/material.dart';
import 'package:tababar/task_model.dart';


Future<bool> deleteItem(BuildContext context, Task task) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to Delete Task ?"),
          actions: [
            FlatButton(
              child: Text("Yes"),
              onPressed: () async {
                Navigator.pop(context);
                return true;
              },
            ),
            FlatButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}


