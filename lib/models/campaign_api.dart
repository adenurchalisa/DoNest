import 'dart:convert';
import 'campaign.dart';

class CampaignApi {
  // This is a mock implementation since we're using local data
  // In a real app, this would make HTTP requests to a backend API
  
  // Get all campaigns
  static Future<List<Campaign>> getAllCampaigns() async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    // Return empty list for now as we're using hardcoded data in the app
    return [];
  }
  
  // Get campaign by id
  static Future<Campaign?> getCampaignById(String id) async {
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    // Return null for now as we're using hardcoded data in the app
    return null;
  }
  
  // For future implementation:
  // Convert map data to Campaign objects
  static List<Campaign> _parseCampaigns(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Campaign>((json) => Campaign.fromMap(json)).toList();
  }
}
