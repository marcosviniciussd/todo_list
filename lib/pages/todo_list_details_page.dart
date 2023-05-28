import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class TodoListDetails extends StatefulWidget {
  const TodoListDetails({Key? key}) : super(key: key);

  @override
  State<TodoListDetails> createState() => _TodoListDetailsState();
}

class _TodoListDetailsState extends State<TodoListDetails> {
  final TextEditingController todoController = TextEditingController();

  List<Todo> todos = [];

  Todo? deletedTodo;
  int? deletedTodoPos;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Listagem de tarefas'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Ex.: Estudar programação',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        String task = todoController.text;
                        Todo newTodo =
                            Todo(title: task, dateTime: DateTime.now());
                        todos.add(newTodo);
                        setState(() {});
                        todoController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF58D8B5),
                        disabledBackgroundColor: Colors.grey,
                        padding: const EdgeInsets.all(14),
                        //side: const BorderSide(color: Colors.greenAccent),
                        //fixedSize: const Size(80, 60),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black54,
                      ),
                      //const Text('+', style: TextStyle(fontSize: 40),),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.all(10)),
                //const SizedBox(height: 20),
                Flexible(
                  //fit: FlexFit.tight,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Todo todo in todos)
                        TodoItemList(
                          todo: todo,
                          onDelete: onDelete,
                        ),
                      /*ListTile(
                        title: Text(todo),
                        subtitle: const Text('15/06/2023'),
                        leading: const Icon(Icons.save),
                        onTap: () {
                          if (kDebugMode) {
                            print('Tarefa: $todo');
                          }
                        },
                      ),*/
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Você possui ${todos.length} tarefas pendentes',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: showDeleteTodosConfirmationDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF58D8B5),
                        disabledBackgroundColor: Colors.grey,
                        padding: const EdgeInsets.all(14),
                      ),
                      child: const Text(
                        'Limpar Tarefas',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedTodoPos = todos.indexOf(todo);

    setState(() {
      todos.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white70,
        duration: const Duration(seconds: 5),
        content: Text(
          'Tarefa ${todo.title} foi removida com sucesso!',
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),
        ),
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: const Color(0xFF58D8B5),
          onPressed: () {
            setState(() {
              todos.insert(deletedTodoPos!, deletedTodo!);
            });
          },
        ),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar Tarefas?'),
        content: const Text('Você tem certeza que deseja limpar todas as tarefas?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF58D8B5),
            ),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              deleteAllTodos();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
            ),
            child: const Text('Limpar tudo'),
          ),
        ],
      ),
    );
  }

  void deleteAllTodos() {
    setState(() {
      todos.clear();
    });
  }
}
