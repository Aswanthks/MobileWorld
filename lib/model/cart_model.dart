import 'package:ecomnode/model/product_model.dart';


class CartModel {
  String? sId;
  String? userid;
  ProductModel? productid;
  int?quantity;
  int? iV;

  CartModel({this.sId, this.userid, this.productid, this.iV,this.quantity});

  CartModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userid = json['userid'];
    productid = json['productid'] != null
        ? new ProductModel.fromJson(json['productid'])
        : null;
    iV = json['__v'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userid'] = this.userid;
    if (this.productid != null) {
      data['productid'] = this.productid!.toJson();
    }
    data['__v'] = this.iV;
    data['quantity'] = this.quantity;
    return data;
  }
}

// class Productid {
//   String? sId;
//   String? name;
//   String? category;
//   int? price;
//   String? details;
//   int? size;
//   String? colour;
//   String? image;
//   int? iV;
//
//   Productid(
//       {this.sId,
//         this.name,
//         this.category,
//         this.price,
//         this.details,
//         this.size,
//         this.colour,
//         this.image,
//         this.iV});
//
//   Productid.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     category = json['category'];
//     price = json['price'];
//     details = json['details'];
//     size = json['size'];
//     colour = json['colour'];
//     image = json['image'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['category'] = this.category;
//     data['price'] = this.price;
//     data['details'] = this.details;
//     data['size'] = this.size;
//     data['colour'] = this.colour;
//     data['image'] = this.image;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
