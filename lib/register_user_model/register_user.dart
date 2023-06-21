class RegisterUser{
  String? Name;
  String? Phone;
  String? email;
  String? password;
  RegisterUser({this.Name,this.Phone,this.email,this.password});
  factory RegisterUser.fromJson(Map<String,dynamic> data){
return RegisterUser(Name:data['name'],Phone: data['Phone'],email: data['email'],password: data['password']);
  }
  Map<String,dynamic> toJson(){
    return {
      'Name':Name,
      'Phone':Phone,
      'email':email,
      'password':password,
    };
  }

}