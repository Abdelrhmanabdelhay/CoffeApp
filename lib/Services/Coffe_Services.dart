import 'package:dio/dio.dart';
import 'package:untitled1/models/Coffe-Model.dart';

class CoffeServices {
  final Dio dio;

  CoffeServices({required this.dio});

  Future<List<CoffeeModel>> getCoffe({required String category}) async {
    try {
      String url = category == "All Coffee"
          ? "http://localhost:9000/coffee/get" // Fetch all coffee
          : "http://localhost:9000/coffee/category/$category"; // Fetch filtered coffee

      Response response = await dio.get(url);
      List<dynamic> data = response.data;
      return data.map((json) => CoffeeModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Failed to load coffee: $e");
    }
  }
}
