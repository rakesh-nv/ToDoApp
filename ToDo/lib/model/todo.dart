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
      ToDo(id: '01', todoText: 'weak up'),
      ToDo(id: '02', todoText: 'Exercise for 30 minutes'),
      ToDo(id: '03', todoText: 'Plan your meals'),
      ToDo(id: '04', todoText: 'plan for the day'),
      ToDo(id: '05', todoText: 'top priority task'),
      ToDo(id: '06', todoText: 'Check your emails'),
      ToDo(id: '07', todoText: 'Read for personal growth'),
      ToDo(id: '08', todoText: 'Plan for Dinner'),
      ToDo(id: '09', todoText: 'Dinner'),
      ToDo(id: '10', todoText: 'Set tomorrows goals')
    ];
  }
}
