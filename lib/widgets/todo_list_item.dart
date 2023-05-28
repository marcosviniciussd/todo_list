import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';

class TodoItemList extends StatelessWidget {
  const TodoItemList({
    Key? key,
    required this.todo,
    required this.onDelete,
  }) : super(key: key);

  final Todo todo;
  final Function(Todo) onDelete;

  void deleteTodo(BuildContext context) {
    onDelete(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Slidable(
        //key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 2,
              onPressed: deleteTodo,
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Deletar',
            ),
            /*SlidableAction(
              // An action can be bigger than the others.
              flex: 2,
              onPressed: doNothing,
              backgroundColor: const Color(0xFF58D8B5),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Editar',
            ),*/
          ],
        ),
        child: Container(
          //margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(16),
          //color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                //todo.dateTime.toString(),
                DateFormat('dd/MM/yyyy - HH:mm . EEE.').format(todo.dateTime),
                //DateFormat('dd/MM/yyyy - HH:mm . EEE).format(todo.dateTime),
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                todo.title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
