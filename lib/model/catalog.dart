import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String title;
  final String category;
  final num price;
  // final String color;
  final String image;
  final String description;

  Item(this.id, this.title, this.category, this.price, this.image,
      this.description);

  Item copyWith(
    int id,
    String title,
    String category,
    num price,
    // String color,
    String image,
  ) {
    return Item(
      id ?? this.id,
      title ?? this.title,
      category ?? this.category,
      price ?? this.price,
      // color ?? this.color,
      image ?? this.image,
      description ?? this.description
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'price': price,
      // 'color': color,
      'image': image,
      'description': description
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'],
      map['title'],
      map['category'],
      map['price'],
      // map['color'],
      map['image'],
      map['description']
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, title: $title, category: $category, price: $price, image: $image, description: $description)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.id == id &&
        o.title == title &&
        o.category == category &&
        o.price == price &&
        // o.color == color &&
        o.image == image &&
        o.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        category.hashCode ^
        price.hashCode ^
        // color.hashCode ^
        image.hashCode ^
        description.hashCode;
  }
}
