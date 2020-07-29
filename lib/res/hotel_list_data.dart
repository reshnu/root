class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int perNight;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/fblogo.jpg',
      titleTxt: 'Film Name',
      subTxt: 'Kerala, India',
      /*dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,*/
    ),
    HotelListData(
      imagePath: 'assets/foxfilmlogo.png',
      titleTxt: 'Film Fox',
      subTxt: 'Kerala, India',
      /*dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,*/
    ),
    HotelListData(
      imagePath: 'assets/foxfilmlogo.png',
      titleTxt: 'Film Fox',
      subTxt: 'Kerala, India',
      /*dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,*/
    ),
    HotelListData(
      imagePath: 'assets/foxfilmlogo.png',
      titleTxt: 'Film Fox',
      subTxt: 'Kerala, India',
      /*dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,*/
    ),
    HotelListData(
      imagePath: 'assets/foxfilmlogo.png',
      titleTxt: 'Film Fox',
      subTxt: 'Kerala, India',
      /*dist: 2.0,
      reviews: 80,
      rating: 4.4,
      perNight: 180,*/
    ),
  ];
}
