import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final ref = FirebaseFirestore.instance;

  addTodo({String title, String description, String uid}) async {
    var added = await ref.collection('todos').add({
      "title": title,
      "description": description,
      "userId": uid,
      "isDone": false,
    });
    print(added.id);
  }

  toggleTodo(String id,
      {String title, String description, bool isDone, String userId}) async {
    await ref.collection('todos').doc(id).set({
      "title": title,
      "description": description,
      "userId": userId,
      "isDone": !isDone,
    });
  }

  Stream<QuerySnapshot> getSnapshot(String uid) {
    return ref.collection('todos').where('userId', isEqualTo: uid).snapshots();
  }

  Future<String> saveImageByUserId(String id, File image) async {
    StorageReference ref =
        FirebaseStorage().ref().child('users/$id/avatar.jpg');
    StorageUploadTask storageUploadTask = ref.putFile(image);
    StorageTaskSnapshot storageTaskSnapshot =
        await storageUploadTask.onComplete;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
