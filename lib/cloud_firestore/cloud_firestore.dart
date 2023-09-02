import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov_proj/admin_register_model/register_admin.dart';
import 'package:egov_proj/register_user_model/register_user.dart';

class FirestoreServices{
  final collection="usercollection";
  final admincollection="admincollection";
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
  Future<String> createAdmin(AdminMOdel admin) async{
    try{
      final ref=await firestoreIns.collection(admincollection);
      await ref.doc(admin.id.toString()).set(admin.toJson());
      return "successfully Added details";
    }catch(e){
      return "Details is not added";
    }
  }
}