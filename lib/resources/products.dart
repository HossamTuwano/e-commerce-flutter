class Products {
  int id;
  String name;
  double price;
  String image;
  bool isLiked;
  bool isCart;
  bool isTrending;
  int numberOfLikes;
  int numberOfComments;

  Products(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.isLiked,
      required this.isCart,
      required this.isTrending,
      required this.numberOfLikes,
      required this.numberOfComments});

  // String productId;
  static final productData = [
    {
      "name": "controller",
      "price": "\$224.0",
      "image": "assets/images/product-images/image-controller.jpg",
    },
    {
      "name": "hdd",
      "price": "\$133.0",
      "image": "assets/images/product-images/image-hdd.webp"
    },
    {
      "name": "hp spectre",
      "price": "\$800.0",
      "image": "assets/images/product-images/image-laptop.jpg"
    },
    {
      "name": "Samsung A70 2020",
      "price": "\$133.0",
      "image": "assets/images/product-images/image-phone.jpg"
    },
    {
      "name": "Lg smart Televsion",
      "price": "\$499.0",
      "image": "assets/images/product-images/image-tv.jpg"
    },
  ];
}
