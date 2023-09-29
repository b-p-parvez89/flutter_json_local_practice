class Productmodel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  int? quantity;
  Rating? rating;

  Productmodel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.quantity,
      this.rating});

  Productmodel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    price = json["price"];
    description = json["description"];
    category = json["category"];
    image = json["image"];
    quantity = json["quantity"];
    rating = json["rating"] == null ? null : Rating.fromJson(json["rating"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["price"] = price;
    _data["description"] = description;
    _data["category"] = category;
    _data["image"] = image;
    _data["quantity"];
    if (rating != null) {
      _data["rating"] = rating?.toJson();
    }
    return _data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json["rate"];
    count = json["count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rate"] = rate;
    _data["count"] = count;
    return _data;
  }
}
