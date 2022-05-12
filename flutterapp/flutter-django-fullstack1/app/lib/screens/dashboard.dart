import 'package:app/api/api.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// ignore: camel_case_types

class dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: todoP.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    todoP.deleteTodo(todoP.todos[index]);
                  }),
              title: Text(
                todoP.todos[index].title??"waiting...",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                todoP.todos[index].description??"waiting...",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => HomePage()));
          }),
    );
  }
}
