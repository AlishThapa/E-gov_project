import 'package:firebase_auth/firebase_auth.dart';

import '../module/widget/custom_snackbar.dart';
class FirebaseAuthServices{
  Future<String> createUser({ var useremail,var password}) async{
    try {
      final firebaseauth = await FirebaseAuth.instance;
      final res = firebaseauth.createUserWithEmailAndPassword(
          email: useremail, password: password);
      return "usercreated successfully";
    }catch(e){
      return "User is not created";
    }

  }
  Future<User?> login({required String useremail,required String password}) async {
    final User? user;
    try {
      FirebaseAuth firebaseauth = await FirebaseAuth.instance;
      UserCredential res = await firebaseauth.signInWithEmailAndPassword(
          email: useremail, password: password);

      user = res.user;
      return user!;
    }on FirebaseAuthException   catch(e){
      CustomSnackBar.error(e.message!);
    }





  }




}