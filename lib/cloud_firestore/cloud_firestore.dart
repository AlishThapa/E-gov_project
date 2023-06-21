import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov_proj/register_user_model/register_user.dart';

class FirestoreServices{
  final collection="usercollection";
  final firestoreIns=FirebaseFirestore.instance;

  Future<String> createUser(RegisterUser user) async{
    try {
      final ref = await firestoreIns.collection(collection);
      await ref.doc(user.Phone).set(user.toJson());
      return "Successfully register";
    }catch(e){
      return "User not register successfully";
    }
  }
}