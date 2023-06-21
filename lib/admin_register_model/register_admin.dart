class AdminMOdel{
  String biddingTitle;
  String biddingDescreption;
  int price;
  AdminMOdel({required this.biddingTitle,required this.biddingDescreption,required this.price});
  factory AdminMOdel.fromJson(Map<String,dynamic> data){
    return AdminMOdel(biddingTitle: data['biddingTitle'],
        biddingDescreption: data['biddingDescreption'],
        price:
        data['price']);
  }

  }