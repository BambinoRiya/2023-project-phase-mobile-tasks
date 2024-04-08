class Task {
  String? title;
  String? description;
  DateTime? dueDate;
  bool? status;

  Task(String? title, String? desc, DateTime? due, bool? stats) {
    title = title;
    description = desc;
    dueDate = due;
    status = stats;
  }
}

class TaskManager {
  List<Task> taskList = [];
  void addTask(Task task) {
    taskList.add(task);
  }

  void viewAll() {
    for (Task task in taskList) {
      print(
          "Title: ${task.title}, Description: ${task.description}, Due Date: ${task.dueDate}, Completed: ${task.status}");
    }
  }

  void viewCompleted(taskList) {
    for (Task task in taskList) {
      if (task.status == true) {
        print(task.title);
      }
    }
  }

  void viewPending(taskList) {
    for (Task task in taskList) {
      if (task.status == false) {
        print(task.title);
      }
    }
  }

  void delTask(int index) {
    if (index > -1 && index <= taskList.length) {
      taskList.removeAt(index);
    }
  }

  void editTask(int index, String? title, String? description,
      DateTime? dueDate, bool? status) {
    if (index > -1 && index <= taskList.length) {
      if (title != null) taskList[index].title = title;
      if (description != null) taskList[index].description = description;
      if (status != null) taskList[index].status = status;
      if (dueDate != null) taskList[index].dueDate = dueDate;
    }
  }
}

void main() {
  // Create a TaskManager instance
  TaskManager numberOne = TaskManager();

  Task task1 =
      Task("Task 1", "Description for Task 1", DateTime(2024, 4, 10), false);
  Task task2 =
      Task("Task 2", "Description for Task 2", DateTime(2024, 4, 15), true);
  Task task3 =
      Task("Task 3", "Description for Task 3", DateTime(2024, 4, 20), false);

  numberOne.addTask(task1);
  numberOne.addTask(task2);
  numberOne.addTask(task3);

  print("All Tasks:");
  numberOne.viewAll();

  print("\nCompleted Tasks:");
  numberOne.viewCompleted(numberOne.taskList);

  print("\nPending Tasks:");
  numberOne.viewPending(numberOne.taskList);

  numberOne.editTask(1, "Updated Task 2", "Updated description for Task 2",
      DateTime(2024, 4, 18), true);

  print("\nAll Tasks After Editing:");
  numberOne.viewAll();

  numberOne.delTask(0);

  print("\nAll Tasks After Deletion:");
  numberOne.viewAll();
}



// import 'dart:io';

// void main() {
//   var new_task = Task("Home Alone","a movie",DateTime(2024, 4, 1, 1, 3, 3, 0),false);
//   print(new_task.dueDate);

//   // stdout.write("Enter the number: ");
//   // String? number = stdin.readLineSync();
//   // print("$number a");

// }