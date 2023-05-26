import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/pages/todo_list_details_page.dart';

class TodoListPage extends StatelessWidget {
  TodoListPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'nome.sobrenome@email.com',
                    icon: Icon(Icons.email),
                    labelStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    )),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  letterSpacing: 1,
                  color: Colors.redAccent,
                ),
                //onSubmitted: onSubmitedEmail,
              ),
              const Padding(padding: EdgeInsets.all(20)),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                    color: Colors.black87,
                  ),
                  labelText: 'Senha',
                  hintText: 'senha',
                  icon: Icon(Icons.password),
                ),
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.redAccent,
                    fontSize: 15,
                    letterSpacing: 2),
                //onSubmitted: onSubmitedPassword,
                obscureText: true,
              ),
              const Padding(padding: EdgeInsets.all(20)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoListDetails(),
                      ));
                },
                child: const Text('Entrar'),
              )
            ],
          ),
        ),
      ),
    );
  }


  void login() {
    if (kDebugMode) {
      String emailText = emailController.text;
      String passwordText = passwordController.text;
      print(emailText);
      print(passwordText);
      //Navigator.push(context, MaterialPageRoute(builder: (context) => const TodoListDetails(),));
      if (emailText == 'marcos.damasceno' && passwordText == 'Senha') {
        print('Usuário e senha correta!');
      } else {
        print('Usuário e senha incorreto!');
      }

      emailController.clear();
      passwordController.clear();
    }
  }

  void onSubmitedEmail(String email) {
    if (kDebugMode) {
      print(email);
    }
  }

  void onSubmitedPassword(String password) {
    if (kDebugMode) {
      print(password);
    }
  }
}

class RoutePageBuilderuilder {}
