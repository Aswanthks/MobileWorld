class ProductModel {
  String? sId;
  String? name;
  int? price;
  String? description;
  String? image;
  int? iV;

  ProductModel(
      {this.sId, this.name, this.price, this.description, this.image, this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}