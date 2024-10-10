import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';

import 'constants/todo_item.dart';
import 'model/todo.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(
                Icons.menu,
                size: 30,
                color: tdBlack,
              ),
            ),
            Container(
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
            )
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
                    child: const TextField(
                      decoration: InputDecoration(
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
                        for (ToDo todo in todosList)
                          TodoItem(
                            toDo: todo,
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
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                              child: const Padding(
                                padding: EdgeInsets.all(9),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Add new todo item',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                debugPrint('hello');
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
                              ))
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
