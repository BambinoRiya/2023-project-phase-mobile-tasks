class Task{
  String? title;
  String? description;
  DateTime? dueDate;
  bool? status;


  Task(String? tit, String? desc, DateTime? due, bool? stats){
    title = tit;
    description = desc;
    dueDate = due;
    status = stats;

  }}

class TaskManager{
  List<Task> task_list = [];
  void addTask(Task task){
    task_list.add(task);
  }

  void viewAll(){
    for (Task task in task_list){
      print("Title: ${task.title}, Description: ${task.description}, Due Date: ${task.dueDate}, Completed: ${task.status}");
    }
  }

  void viewCompleted(task_list){
      for (Task task in task_list){
        if (task.status == true){
          print(task.title)
        }
      }
    }

  void viewPending(task_list){
    for (Task task in task_list){
      if (task.status == false){
        print(task.title)
      }
    }

  }

  void delTask(int index, task_list){
    if (0<= int index <= task_list.length){
      task_list.removeAt(index);
    }

  }

  void editTask(int index, String? title, String? description, DateTime? dueDate,bool? status){
    if (0<= int index <= task_list.length){
      if (title != null) task_list[index].title = title;
      if (description!=null) task_list[index].description = description;
      if (status !=null) task_list[index].status = status;
      if (dueDate != null)task_list[index].dueDate = dueDate;
    }

  }
}


void main() {
  // Create a TaskManager instance
  TaskManager numberOne = TaskManager();

  // Create some test tasks
  Task task1 = Task("Task 1", "Description for Task 1", DateTime(2024, 4, 10), false);
  Task task2 = Task("Task 2", "Description for Task 2", DateTime(2024, 4, 15), true);
  Task task3 = Task("Task 3", "Description for Task 3", DateTime(2024, 4, 20), false);

  // Add tasks to the task list
  numberOne.addTask(task1);
  numberOne.addTask(task2);
  numberOne.addTask(task3);

  // View all tasks
  print("All Tasks:");
  numberOne.viewAll();

  // View only completed tasks
  print("\nCompleted Tasks:");
  numberOne.viewCompleted(numberOne.task_list);

  // View only pending tasks
  print("\nPending Tasks:");
  numberOne.viewPending(numberOne.task_list);

  // Edit a task
  numberOne.editTask(1, "Updated Task 2", "Updated description for Task 2", DateTime(2024, 4, 18), true);

  // View all tasks after editing
  print("\nAll Tasks After Editing:");
  numberOne.viewAll();

  // Delete a task
  numberOne.delTask(0);

  // View all tasks after deletion
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