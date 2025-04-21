import '../helper/api.dart';
import '../models/Coffe-Model.dart';

class AddCofee {
  Future<CoffeeModel> AddCoffee({
    required String name,
    required String categ,
    required String price, // Price as String
    required String quntity,
  }) async {
    try {
      // Convert price to String if it's a double
      String stringPrice = price.toString(); // Ensure price is sent as a String

      // Prepare the API request with price as String
      Map<String, dynamic> data = await Api().post(
        uri: "http://localhost:9000/order/add",
        body: {
          "name": name,
          "price": stringPrice,  // Send price as a String
          "category": categ,
          "quntity": quntity,
        },
      );

      // Check if the response contains the expected success message
      if (data['message'] == "Coffee item added successfully") {
        // Return the CoffeeModel from the response
        return CoffeeModel.fromJson(data['coffeeItem']);
      } else {
        // If the message is not what we expect, throw an error
        throw Exception("Unexpected response: ${data['message']}");
      }
    } catch (e) {
      // Handle any errors here (network error, parsing error, etc.)
      throw Exception("Error: $e");
    }
  }
}
