import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_c7_str/models/task.dart';

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

Stream<QuerySnapshot<Task>> getDataFromFirestore(DateTime dateTime) {
  return getTasksCollection()
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteTaskFromFireStore(String id) {
  return getTasksCollection().doc(id).delete();
}
