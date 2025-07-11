import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/campaign_api.dart';

class ApiService {
  final String apiKey = '8be2ddfd-501c-4f33-a43f-29fd74f5e003'; // Replace with your actual API key
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
        
        // Check if the API response structure matches what we expect
        if (data.containsKey('projects') && data['projects'].containsKey('project')) {
          final List<dynamic> projects = data['projects']['project'];
          return projects.map((json) => CampaignApi.fromJson(json)).toList();
        } else {
          print("API response structure has changed: ${response.body.substring(0, 200)}...");
          return _getFallbackUrgentCampaigns();
        }
      } else {
        print("Failed to load urgent campaigns: ${response.statusCode}");
        return _getFallbackUrgentCampaigns();
      }
    } catch (e) {
      print("Error fetching urgent campaigns: $e");
      return _getFallbackUrgentCampaigns();
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
        
        // Check if the API response structure matches what we expect
        if (data.containsKey('projects') && data['projects'].containsKey('project')) {
          final List<dynamic> projects = data['projects']['project'];
          return projects.map((json) => CampaignApi.fromJson(json)).toList();
        } else {
          print("API response structure has changed: ${response.body.substring(0, 200)}...");
          return _getFallbackAllCampaigns();
        }
      } else {
        print("Failed to load all campaigns: ${response.statusCode}");
        return _getFallbackAllCampaigns();
      }
    } catch (e) {
      print("Error fetching all campaigns: $e");
      return _getFallbackAllCampaigns();
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
        
        // Check if the API response structure matches what we expect
        if (data.containsKey('project')) {
          final Map<String, dynamic> project = data['project'];
          return CampaignApi.fromJson(project);
        } else {
          print("API response structure has changed: ${response.body.substring(0, 200)}...");
          // Return a fallback campaign with the given ID
          return _getFallbackCampaignDetail(id);
        }
      } else {
        print("Failed to load campaign detail: ${response.statusCode}");
        return _getFallbackCampaignDetail(id);
      }
    } catch (e) {
      print("Error fetching campaign detail: $e");
      return _getFallbackCampaignDetail(id);
    }
  }
  
  // Fallback methods that return local data when API fails
  
  List<CampaignApi> _getFallbackUrgentCampaigns() {
    // Return dummy urgent campaigns
    return [
      CampaignApi(
        id: 1,
        title: "Bantuan untuk anak-anak",
        description: "Bantuan untuk anak-anak yang membutuhkan akses pendidikan.",
        imageUrl: "https://images.unsplash.com/photo-1576381330792-d759250b35ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        target: 10000000,
        terkumpul: 5000000,
        donatur: 200,
        sisaHari: 3,
        penyelenggara: "Yayasan Anak Ceria",
        kontak: "081234567890",
      ),
      CampaignApi(
        id: 2,
        title: "Pakaian & kebutuhan untuk tunawisma",
        description: "Bantuan pakaian dan kebutuhan dasar untuk tunawisma.",
        imageUrl: "https://cdn.antaranews.com/cache/1200x800/2022/11/02/Screenshot_20221101-182556_Facebook.jpg",
        target: 10000000,
        terkumpul: 9500000,
        donatur: 300,
        sisaHari: 5,
        penyelenggara: "Yayasan Peduli Sesama",
        kontak: "081234567891",
      ),
      CampaignApi(
        id: 3,
        title: "Bantuan buku untuk sekolah desa",
        description: "Pengadaan buku dan alat tulis untuk sekolah di desa terpencil.",
        imageUrl: "https://awsimages.detik.net.id/community/media/visual/2022/07/19/kelas-jauh-milik-sdn-118-di-desa-sendana-kecamatan-bittuang-tana-toraja-sulsel_169.jpeg?w=1200",
        target: 7000000,
        terkumpul: 3500000,
        donatur: 150,
        sisaHari: 2,
        penyelenggara: "Yayasan Pendidikan Indonesia",
        kontak: "081234567892",
      ),
      CampaignApi(
        id: 4,
        title: "Sembako untuk keluarga prasejahtera",
        description: "Bantuan sembako untuk keluarga prasejahtera.",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe4zIaSnTslfefcZ7eyeuPpdisfDjO_FUwfw&sg",
        target: 9000000,
        terkumpul: 4200000,
        donatur: 110,
        sisaHari: 1,
        penyelenggara: "Yayasan Kemanusiaan",
        kontak: "081234567893",
      ),
    ];
  }
  
  List<CampaignApi> _getFallbackAllCampaigns() {
    // Return dummy campaigns
    return [
      ..._getFallbackUrgentCampaigns(),
      CampaignApi(
        id: 5,
        title: "Bantuan biaya sekolah",
        description: "Bantuan biaya sekolah untuk anak-anak kurang mampu.",
        imageUrl: "https://www.purbalinggakab.go.id/wp-content/uploads/2020/01/IMG-20200115-WA0004-1280x640.jpg",
        target: 5000000,
        terkumpul: 3500000,
        donatur: 80,
        sisaHari: 10,
        penyelenggara: "Yayasan Pendidikan",
        kontak: "081234567894",
      ),
      CampaignApi(
        id: 6,
        title: "Pengobatan gratis lansia",
        description: "Pengobatan gratis untuk lansia di daerah terpencil.",
        imageUrl: "https://cdn.antaranews.com/cache/1200x800/2023/03/15/RS-Bhayangkara.jpg",
        target: 5000000,
        terkumpul: 2200000,
        donatur: 55,
        sisaHari: 8,
        penyelenggara: "Yayasan Kesehatan",
        kontak: "081234567895",
      ),
      CampaignApi(
        id: 7,
        title: "Bantuan air bersih desa",
        description: "Bantuan air bersih untuk desa yang kekurangan sumber air.",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjDzzwg3pJe0yoInNGnsM5Lp0Cy3mjJfdGjg&s",
        target: 8000000,
        terkumpul: 4800000,
        donatur: 130,
        sisaHari: 6,
        penyelenggara: "Yayasan Lingkungan",
        kontak: "081234567896",
      ),
      CampaignApi(
        id: 8,
        title: "Perlengkapan sekolah yatim",
        description: "Pengadaan perlengkapan sekolah untuk anak-anak yatim.",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaqckXSun9An1DjZQwYh4TuvXRaNJ3nEGd9cyHB2wpvM5a7y-aoBEqMAHuPDdaUMPR5B8&usqp=CAU",
        target: 4000000,
        terkumpul: 2700000,
        donatur: 70,
        sisaHari: 12,
        penyelenggara: "Yayasan Yatim Piatu",
        kontak: "081234567897",
      ),
    ];
  }
  
  CampaignApi _getFallbackCampaignDetail(int id) {
    // Find the campaign with the matching ID from our fallback data
    try {
      return _getFallbackAllCampaigns().firstWhere((campaign) => campaign.id == id);
    } catch (e) {
      // If not found, return a default campaign
      return CampaignApi(
        id: id,
        title: "Campaign Detail",
        description: "This is a fallback campaign detail.",
        imageUrl: "https://via.placeholder.com/400x200?text=Campaign+Image",
        target: 10000000,
        terkumpul: 5000000,
        donatur: 100,
        sisaHari: 10,
        penyelenggara: "Default Organization",
        kontak: "081234567890",
      );
    }
  }
}