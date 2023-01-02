class ShoppingModel {
  String? lastBuildDate;
  int? total;
  int? start;
  int? display;
  List<Items>? items;

  ShoppingModel(
      {this.lastBuildDate, this.total, this.start, this.display, this.items});

  ShoppingModel.fromJson(Map<String, dynamic> json) {
    lastBuildDate = json['lastBuildDate'];
    total = json['total'];
    start = json['start'];
    display = json['display'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastBuildDate'] = this.lastBuildDate;
    data['total'] = this.total;
    data['start'] = this.start;
    data['display'] = this.display;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? title;
  String? link;
  String? image;
  String? lprice;
  String? hprice;
  String? mallName;
  String? productId;
  String? productType;
  String? brand;
  String? maker;
  String? category1;
  String? category2;
  String? category3;
  String? category4;

  Items(
      {this.title,
        this.link,
        this.image,
        this.lprice,
        this.hprice,
        this.mallName,
        this.productId,
        this.productType,
        this.brand,
        this.maker,
        this.category1,
        this.category2,
        this.category3,
        this.category4});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    image = json['image'];
    lprice = json['lprice'];
    hprice = json['hprice'];
    mallName = json['mallName'];
    productId = json['productId'];
    productType = json['productType'];
    brand = json['brand'];
    maker = json['maker'];
    category1 = json['category1'];
    category2 = json['category2'];
    category3 = json['category3'];
    category4 = json['category4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['image'] = this.image;
    data['lprice'] = this.lprice;
    data['hprice'] = this.hprice;
    data['mallName'] = this.mallName;
    data['productId'] = this.productId;
    data['productType'] = this.productType;
    data['brand'] = this.brand;
    data['maker'] = this.maker;
    data['category1'] = this.category1;
    data['category2'] = this.category2;
    data['category3'] = this.category3;
    data['category4'] = this.category4;
    return data;
  }
}