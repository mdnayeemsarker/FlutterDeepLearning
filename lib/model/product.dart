// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductsModel {
  // static List<Item> items = [
  //   Item(
  //     1,
  //     "iPhone 9",
  //     "An apple mobile which is nothing like apple",
  //     549,
  //     12.96,
  //     4.69,
  //     94,
  //     "Apple",
  //     "smartphones",
  //     "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
  //   )
  // ];

  static final proModel = ProductsModel._internal();
  ProductsModel._internal();

  factory ProductsModel() => proModel;

  static List<Item> items = [];

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  int id;
  String title;
  String description;
  num price;
  num discountPercentage;
  num rating;
  num stock;
  String brand;
  String category;
  String thumbnail;

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

  Item copyWith({
    int? id,
    String? title,
    String? description,
    num? price,
    num? discountPercentage,
    num? rating,
    num? stock,
    String? brand,
    String? category,
    String? thumbnail,
  }) {
    return Item(
      id ?? this.id,
      title ?? this.title,
      description ?? this.description,
      price ?? this.price,
      discountPercentage ?? this.discountPercentage,
      rating ?? this.rating,
      stock ?? this.stock,
      brand ?? this.brand,
      category ?? this.category,
      thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'] as int,
      map['title'] as String,
      map['description'] as String,
      map['price'] as num,
      map['discountPercentage'] as num,
      map['rating'] as num,
      map['stock'] as num,
      map['brand'] as String,
      map['category'] as String,
      map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, title: $title, description: $description, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, brand: $brand, category: $category, thumbnail: $thumbnail)';
  }
}
