class CoffeeModel {
  final String id;
  final String name;
  final String description;
  final String price; // Keep price as String as required
  final String image;
  final double rate; // Keep rate as double as it's a numerical value
  final String category;
  double quntity; // Keep quntity as double since quantity can be a fractional number
  final String? message; // Nullable

  CoffeeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,  // Keep price as String
    required this.image,
    required this.rate,
    required this.category,
    required this.quntity,
    this.message
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) {
    return CoffeeModel(
      id: json['_id'] ?? '',  // Ensure id is a non-null String
      name: json['name'] ?? 'Unknown Coffee',  // Default name if null
      description: json['description'] ?? 'No description available.',  // Default description if null
      price: json['price']?.toString() ?? '0.0',  // Ensure price is a String, converting from number if needed
      image: json['image'] ?? '',  // Default image if null
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,  // Ensure rate is a double
      category: json['category'] ?? 'Uncategorized',  // Default category if null
      quntity: (json['quntity'] as num?)?.toDouble() ?? 1.0,
      message: json['message'],   // include message
// Ensure quantity is a double
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoffeeModel && other.id == id;  // Compare based on id
  }

  @override
  int get hashCode => id.hashCode;  // Hash code based on id
}
