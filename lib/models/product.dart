class Product {
  int id;
  String name;
  int price;
  String image;

  Product(this.id, this.name, this.price, this.image);

  @override
  // ignore: hash_and_equals
  bool operator ==(other) => this.id == other.id;
}
