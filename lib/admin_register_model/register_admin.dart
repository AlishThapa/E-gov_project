class AdminMOdel{
  String biddingTitle;
  String biddingDescreption;
  String price;
  String id;
  AdminMOdel({required this.biddingTitle,required this.biddingDescreption,required this.price,required this.id});
  factory AdminMOdel.fromJson(Map<String,dynamic> data){
    return AdminMOdel(biddingTitle: data['biddingTitle'],
        biddingDescreption: data['biddingDescreption'],
        price: data['price'],
      id:data['id'],

    );
  }
  Map<String,dynamic> toJson(){
    return {
      'biddingTitle':biddingTitle,
      'biddingDescreption':biddingDescreption,
      'price':price,
      'id':id,
    };
  }

  }