import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_c7_str/models/task.dart';

// void addTaskToFireStore(){
//
//   FirebaseFirestore.instance.collection('tasks').add(data)
// }
CollectionReference<Task> getTasksCollection() {
  return FirebaseFirestore.instance.collection('Tasks').withConverter<Task>(
        fromFirestore: (snapshot, options) {
          return Task.fromJson(snapshot.data()!);
        },
        toFirestore: (task, options) => task.toJson(),
      );
}

Future<void> addTaskToFirebaseFireStore(Task task) {
  var collection = getTasksCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

Future<QuerySnapshot<Task>> getDataFromFireStore() {
  var data = getTasksCollection().get();
  return data;
}
