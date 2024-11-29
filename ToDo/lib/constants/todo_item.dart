// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';

import '../model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo toDo;
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem({
    super.key,
    required this.toDo,
    required this.onDeleteItem,
    this.onToDoChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(toDo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          toDo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: toDo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
              padding: const EdgeInsets.all(5),
              onPressed: () {
                debugPrint('clicked on delete');
                onDeleteItem(toDo.id);
              },
              icon: const Icon(
                color: Colors.white,
                size: 25,
                Icons.delete,
              )),
        ),
      ),
    );
  }
}
