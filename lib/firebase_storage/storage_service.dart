import 'package:firebase_storage/firebase_storage.dart';
class FireStorageService{
  Future<void> addStorage() async{
    final csInstance=await FirebaseStorage.instance;
    final collection="adminCollection";
    final response=csInstance.ref(collection);

  }
}