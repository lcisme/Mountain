import 'package:http/http.dart' as http;
import 'package:tripsmountain/models/destination_model.dart';
import 'dart:convert';
import '../models/welcome_model.dart';

class DataServices {
  String baseUrl = "http://10.0.2.2:8080";

  Future<List<WelcomeModel>> welcome() async {
    String subUrl = "/welcome";
    http.Response response = await http.get(Uri.parse(baseUrl + subUrl));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        return list.map((e) => WelcomeModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return <WelcomeModel>[];
  }

  Future<List<DestinationModel>> getInfoDestination() async {
    String subUrl = "/destination/getAll";
    http.Response response = await http.get(Uri.parse(baseUrl + subUrl));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        return list.map((e) => DestinationModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return <DestinationModel>[];
  }
}