/// status : "success"
/// productModel : [{"id":4,"name":"AL  FAHAM KUBOOS BREAD","description":"PACKET 5 PIECES","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1628087732.JPG","price":4},{"id":14,"name":"ROLL SHAWARMA BREAD","description":"PACKET 5 PCS","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1635682800.jpg","price":3.5},{"id":21,"name":"ROMALI BREAD","description":"PACKET 10 PCS","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1635754860.jpg","price":8},{"id":13,"name":"PAV BUN","description":"PACKET 6 PCS","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1630199774.jpg","price":6.5},{"id":2,"name":"BURGER BUN","description":"PACKET 4 PIECES","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1640653012.jpg","price":8},{"id":8,"name":"RING BURGER BUN","description":"PACKET 4 PIECES","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1628088926.jpg","price":8.5},{"id":6,"name":"HOT DOG BUN","description":"PACKET 5 PIECES","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1628088269.jpg","price":8},{"id":5,"name":"SANDWICH BREAD","description":"1 KG","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1635684054.jpg","price":85},{"id":9,"name":"TORTILLAS","description":"PACKET 10 PCS","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1628089213.jpg","price":10},{"id":10,"name":"VADA PAV","description":"PACKET 9 PIECES","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1628089299.jpg","price":5.25},{"id":17,"name":"SWEET BUN","description":"PACKET 4 PCS","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1635683524.jpg","price":5},{"id":22,"name":"BURGER BUN 200  GM","description":"PACKET 1 PSC","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1640653038.jpg","price":21},{"id":18,"name":"POTATO BUN 70 GM","description":"PACKET 4 PCS","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1635754320.jpg","price":9},{"id":24,"name":"POTATO HOT DOG BUN 90 GM","description":"PACKET 5","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1640866169.jpg","price":11},{"id":25,"name":"POTATO BURGER BUN 80 GM","description":"packet 4 pieces","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1640866271.jpg","price":9.5},{"id":23,"name":"PIZZA 8 INCH","description":"PACKET 3 PCS","cgst":"0.43","sgst":"0.43","image":"https://crust.oudhtea.com/uploads/1640653070.jpg","price":17},{"id":27,"name":"LOVE BUN","description":"PACKET 1 PSC","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1644898522.jpeg","price":20},{"id":7,"name":"MILK BREAD","description":"300 GM","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1628088327.jpg","price":25},{"id":11,"name":"PIZZA BASE 9 INCH","description":"PACKET 3 PIECES","cgst":"0.46","sgst":"0.46","image":"https://crust.oudhtea.com/uploads/1628089383.jpg","price":18.5},{"id":12,"name":"PIZZA BASE 7 INCH","description":"PACKET 3 PIECES","cgst":"0.38","sgst":"0.38","image":"https://crust.oudhtea.com/uploads/1628089422.jpg","price":15},{"id":16,"name":"POTATO BUN 90 GM","description":"PACKET 4 PCS","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1635683292.jpg","price":10},{"id":19,"name":"HOT DOG BUN 140 GM","description":"PACKET 3 PCS","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1635754580.jpg","price":12.5},{"id":20,"name":"POTATO HOT DOG BUN 70 GM","description":"PACKET 5","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1635754730.jpg","price":9},{"id":26,"name":"PIZZA BASE 12 INCH","description":"PACKET FOR 1 PIECE","cgst":"0.63","sgst":"0.63","image":"https://crust.oudhtea.com/uploads/1640951124.jpg","price":25},{"id":28,"name":"POTATO BURGER BUN 100 GM","description":"packet 4 pieces","cgst":"0.00","sgst":"0.00","image":"https://crust.oudhtea.com/uploads/1656484549.jpg","price":12},{"id":29,"name":"HALF COOCKED INDIAN CHAPATI","description":"PACKET 10 PIECES","cgst":"0.08","sgst":"0.08","image":"https://crust.oudhtea.com/uploads/1656484904.jpg","price":3.34}]
/// code : 1

class ProductResponse {
  ProductResponse({
      String? status, 
      List<ProductModel>? productModel, 
      num? code,}){
    _status = status;
    _productModel = productModel;
    _code = code;
}

  ProductResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['productModel'] != null) {
      _productModel = [];
      json['productModel'].forEach((v) {
        _productModel?.add(ProductModel.fromJson(v));
      });
    }
    _code = json['code'];
  }
  String? _status;
  List<ProductModel>? _productModel;
  num? _code;
ProductResponse copyWith({  String? status,
  List<ProductModel>? productModel,
  num? code,
}) => ProductResponse(  status: status ?? _status,
  productModel: productModel ?? _productModel,
  code: code ?? _code,
);
  String? get status => _status;
  List<ProductModel>? get productModel => _productModel;
  num? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_productModel != null) {
      map['productModel'] = _productModel?.map((v) => v.toJson()).toList();
    }
    map['code'] = _code;
    return map;
  }

}

/// id : 4
/// name : "AL  FAHAM KUBOOS BREAD"
/// description : "PACKET 5 PIECES"
/// cgst : "0.00"
/// sgst : "0.00"
/// image : "https://crust.oudhtea.com/uploads/1628087732.JPG"
/// price : 4

class ProductModel {
  ProductModel({
      num? id, 
      String? name, 
      String? description, 
      String? cgst, 
      String? sgst, 
      String? image, 
      num? price,}){
    _id = id;
    _name = name;
    _description = description;
    _cgst = cgst;
    _sgst = sgst;
    _image = image;
    _price = price;
}

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _cgst = json['cgst'];
    _sgst = json['sgst'];
    _image = json['image'];
    _price = json['price'];
  }
  num? _id;
  String? _name;
  String? _description;
  String? _cgst;
  String? _sgst;
  String? _image;
  num? _price;
ProductModel copyWith({  num? id,
  String? name,
  String? description,
  String? cgst,
  String? sgst,
  String? image,
  num? price,
}) => ProductModel(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  cgst: cgst ?? _cgst,
  sgst: sgst ?? _sgst,
  image: image ?? _image,
  price: price ?? _price,
);
  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get cgst => _cgst;
  String? get sgst => _sgst;
  String? get image => _image;
  num? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['cgst'] = _cgst;
    map['sgst'] = _sgst;
    map['image'] = _image;
    map['price'] = _price;
    return map;
  }

}