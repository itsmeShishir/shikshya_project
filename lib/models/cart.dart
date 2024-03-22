class Cart {
  late final int? id;
  final String? productId;
  final String? productName;
  final String? initialPrice;
  final String? productPrice;
  final String? unittag;
  final String? image;

  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.initialPrice,
    required this.productPrice,
    required this.unittag,
    required this.image,
  });

  Cart.fromJson(Map<String, dynamic>json){
    
  }
}
