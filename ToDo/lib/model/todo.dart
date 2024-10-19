class ToDo {
  String? id;
  String? todoText;
  late bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
       ToDo(id: '01', todoText: 'weak up', isDone: true),
       ToDo(id: '02', todoText: 'Morning Exercise',isDone: true),
      ToDo(id: '03', todoText: 'Go to college',isDone: true),
      ToDo(id: '04', todoText: 'Lunch',isDone: true),
      ToDo(id: '05', todoText: 'By Groceries',isDone: true),
      ToDo(id: '06', todoText: 'weak up', isDone: true),
      ToDo(id: '07', todoText: 'Morning Exercise',isDone: true),
      ToDo(id: '08', todoText: 'Go to college',isDone: true),
      ToDo(id: '09', todoText: 'Lunch',isDone: true),
      ToDo(id: '10', todoText: 'By Groceries',isDone: true)
    ];
  }
}
