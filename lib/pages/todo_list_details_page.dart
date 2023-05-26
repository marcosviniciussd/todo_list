import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TodoListDetails extends StatefulWidget {
  const TodoListDetails({Key? key}) : super(key: key);

  @override
  State<TodoListDetails> createState() => _TodoListDetailsState();
}

class _TodoListDetailsState extends State<TodoListDetails> {
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                      todos.add(task);
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
                child: ListView(shrinkWrap: true, children: [
                  for (String todo in todos)
                    ListTile(
                      title: Text(todo),
                      subtitle: const Text('15/06/2023'),
                      leading: const Icon(Icons.save),
                      onTap: () {
                        if (kDebugMode) {
                          print('Tarefa: $todo');
                        }
                      },
                    ),
                ]),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Você possui 0 tarefas pendentes',
                      style: TextStyle(
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
                    onPressed: () {},
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
    );
  }
}
