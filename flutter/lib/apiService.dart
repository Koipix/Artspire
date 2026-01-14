import 'package:artspire/models/artItem.dart';
import 'package:artspire/models/artist.dart';
import 'package:artspire/models/chatItem.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  //TODO: Connect to production service later
  static const String baseUrl = "http://192.168.254.111:3000"; 

  static Future<List<ArtItem>> fetchItems() async {
    final response = await http.get(
      Uri.parse('${baseUrl}/fetchItem'),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body); 
      return data.map((e) => ArtItem.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load items");
    }
  }

  static Future<ArtItem> fetchItemById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/fetchItem/$id'));

    if (response.statusCode == 200) {
     final data = jsonDecode(response.body);
     return ArtItem.fromJson(data);
    } else {
     throw Exception('Failed to load item with id $id');
    }
  }

  static Future<Artist> fetchArtist() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/fetchArtist'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Artist.fromJson(data);
      } else {
        throw Exception('Failed to load artist: ${response.statusCode}');
      }
    } catch (e) {
      print("API Error: $e");
      rethrow;
    }
  }

  static Future<List<ChatItem>> fetchChats() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/fetchChats'));

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((e) => ChatItem.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load chats: ${response.statusCode}');
      }
    } catch (e) {
      print("API Error: $e");
      rethrow;
    }
  }
}
