import 'dart:io';

class Human{
  String? name;
  int? age;
  String? occupation;
  bool? relationship;

  Human(String? this.name, int? this.age, String? this.occupation, bool? this.relationship){
  }
}

void main(){

  stdout.write("Enter name: ");
  String? name = stdin.readLineSync();

  stdout.write("Enter age: ");
  int? age = int.tryParse(stdin.readLineSync()?? '');

  stdout.write("Enter occupation: ");
  String? occupation = stdin.readLineSync();

  stdout.write("Relationship status(True/False) ");
  var relationship = (stdin.readLineSync()?.toLowerCase()== 'true');

  Human person = Human(name,age,occupation,relationship);

  print("Hello ${person.name} you are ${person.age} and your job is ${person.occupation}" );
  if (person.relationship == true){
    print("You are in a relationship");
  }else{
    print("What are your plans for Val's day then XD");
  }
  
}

