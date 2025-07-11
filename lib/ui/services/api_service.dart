import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/campaign_api.dart';

class ApiService {
  final String apiKey = '8be2ddfd-501c-4f33-a43f-29fd74f5e003';
  final String baseUrl = 'https://api.globalgiving.org/api/public';

  // Fungsi untuk mendapatkan kampanye mendesak (featured projects)
  Future<List<CampaignApi>> getUrgentCampaigns() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/projectservice/featured/projects'),
        headers: {
          'Accept': 'application/json',
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> projects = data['projects']['project'];
        
        return projects.map((json) => CampaignApi.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load urgent campaigns: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fungsi untuk mendapatkan semua kampanye
  Future<List<CampaignApi>> getAllCampaigns() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/projectservice/all/projects'),
        headers: {
          'Accept': 'application/json',
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> projects = data['projects']['project'];
        
        return projects.map((json) => CampaignApi.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load all campaigns: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fungsi untuk mendapatkan detail kampanye berdasarkan ID
  Future<CampaignApi> getCampaignDetail(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/projectservice/projects/$id'),
        headers: {
          'Accept': 'application/json',
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final Map<String, dynamic> project = data['project'];
        
        return CampaignApi.fromJson(project);
      } else {
        throw Exception('Failed to load campaign detail: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}