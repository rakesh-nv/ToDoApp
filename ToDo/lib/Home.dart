import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';

import 'constants/todo_item.dart';
import 'model/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _handleToDoChange(ToDo todo) {
      setState(() {
        todo.isDone = !todo.isDone;
      });
    }

    void _deleteToDoItem(String id) {
      setState(() {
        todosList.removeWhere((item) => item.id == id);
      });
    }

    void _addToDoItem(String toDo) {
      setState(
        () {
          todosList.add(
            ToDo(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              todoText: toDo,
            ),
          );
        },
      );
      todoController.clear();
    }

    void _runFilter(String enterdKeyword) {
      List<ToDo> result = [];
      if (enterdKeyword.isEmpty) {
        result = todosList;
      } else {
        result = todosList
            .where((item) => item.todoText!
                .toLowerCase()
                .contains(enterdKeyword.toLowerCase()))
            .toList();
      }
      setState(() {
        _foundToDo = result;
      });
    }

    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Icon(
            //     Icons.menu,
            //     size: 30,
            //     color: tdBlack,
            //   ),
            // ),
            const Text('Todo App'),
            // profinle
            InkWell(
              onTap: () {
                print("hi");
              },
              child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: tdBlack,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        width: 200,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 80,
              child: DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.person),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('Rakesh'),
                    )
                  ],
                ),
              ),
            ),
            ListTile(title: const Text('Login'), onTap: () {}),
            ListTile(title: const Text('Register'), onTap: () {}),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //search box
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    child: TextField(
                      onChanged: (value) => _runFilter(value),
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.only(left: 30),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 50,
                            bottom: 20,
                          ),
                          // color: Colors.blue,
                          child: const Text(
                            'All ToDos',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: tdBlack,
                            ),
                          ),
                        ),
                        for (ToDo todo in _foundToDo)
                          TodoItem(
                            toDo: todo,
                            onToDoChanged: _handleToDoChange,
                            onDeleteItem: _deleteToDoItem,
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: Container(
                      // color: Colors.orange,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 60,
                              margin: const EdgeInsets.only(
                                right: 9,
                              ),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3))
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TextField(
                                controller: todoController,
                                decoration: const InputDecoration(
                                    hintText: 'Add new todo item',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              debugPrint('hello');
                              _addToDoItem(todoController.text);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.all(15),
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
