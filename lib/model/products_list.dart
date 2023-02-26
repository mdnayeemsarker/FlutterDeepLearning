class ProductsModel {
  static final items = [
    Item(
      1,
      "iPhone 9",
      "An apple mobile which is nothing like apple",
      549,
      12.96,
      4.69,
      94,
      "Apple",
      "smartphones",
      "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
    )
  ];
}

class Item {
  final int id;
  final String title;
  final String description;
  final num price;
  final num discountPercentage;
  final num rating;
  final num stock;
  final String brand;
  final String category;
  final String thumbnail;

  Item(
      this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail);
}
