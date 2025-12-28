import 'dart:convert';
import 'package:http/http.dart' as http;

class GeoreverseAPI {
  static const _apiBaseUrl = "https://nominatim.openstreetmap.org";
  static const _reverseEndpointUrl = '/reverse?format=jsonv2&';
  static const _userAgent = 'GeoJournalDemoStudentApp (github: brushandspatula)';

  Future<String> getNameByCoordinates({
    required double lat,
    required double lon,
  }) async {
    final uri = Uri.parse(
      '$_apiBaseUrl$_reverseEndpointUrl'
      'lat=$lat&lon=$lon',
    );

    final response = await http.get(
      uri,
      headers: {'User-Agent': _userAgent, 'Accept-Language': 'pl'},
    );

    if (response.statusCode != 200) {
      throw Exception('Error occurred');
    }

    final placeData = jsonDecode(response.body) as Map<String, dynamic>;
    return placeData['display_name'] as String;
  }
}
