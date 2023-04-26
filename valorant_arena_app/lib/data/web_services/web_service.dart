import 'package:http/http.dart' as http ;
import 'package:valorant_arena_app/constant/constant.dart';

class WebService {
  Future<dynamic> getAgent() async {
    final response = await http.get(Uri.parse(apiUrl));
    return response;
  }
}