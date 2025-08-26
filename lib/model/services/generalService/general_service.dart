import '../../utilities/imports/generalImport.dart';

class NetworkService {
  static const int timeoutDuration = 30; // Timeout duration in seconds

  final Map<String, String>? headers;

  NetworkService({this.headers});

  Future<GeneralResponse<T>> getRequest<T>(
      String endpoint, T Function(dynamic) create) async {
    try {
      final mergedHeaders = {
        'Accept': 'application/json',
        ...?headers,
      };
      final response =
          await get(Uri.parse('${baseUrl()}$endpoint'), headers: mergedHeaders)
              .timeout(const Duration(seconds: timeoutDuration));
      print(response.body);
      return _handleResponse(response, create);
    } on SocketException {
      throw Exception(
          jsonEncode({"title": 'Network Error', 'message': networkError}));
    } on TimeoutException {
      throw Exception(jsonEncode({
        "title": 'Connection Timeout Error',
        'message': connectionTimeoutError
      }));
    }
  }

  Future<GeneralResponse<T>> postRequest<T>(String endpoint,
      Map<String, dynamic> body, T Function(dynamic) create) async {
    try {
      final defaultHeaders = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
      };
      final response = await post(Uri.parse('${baseUrl()}$endpoint'),
              headers: {...defaultHeaders, ...?headers},
              body: json.encode(body))
          .timeout(const Duration(seconds: timeoutDuration));
      // debugPrint('${baseUrl()}$endpoint');
      // debugPrint(response.body);
      return _handleResponse(response, create);
    } on SocketException {
      throw Exception(
          jsonEncode({"title": 'Network Error', 'message': networkError}));
    } on TimeoutException {
      throw Exception(jsonEncode({
        "title": 'Connection Timeout Error',
        'message': connectionTimeoutError
      }));
    }
  }

  Future<GeneralResponse<T>> putRequest<T>(String endpoint,
      Map<String, dynamic> body, T Function(dynamic) create) async {
    try {
      final defaultHeaders = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
      };
      final response = await put(Uri.parse('${baseUrl()}$endpoint'),
              headers: {...defaultHeaders, ...?headers},
              body: json.encode(body))
          .timeout(const Duration(seconds: timeoutDuration));
      return _handleResponse(response, create);
    } on SocketException {
      throw Exception(
          jsonEncode({"title": 'Network Error', 'message': networkError}));
    } on TimeoutException {
      throw Exception(jsonEncode({
        "title": 'Connection Timeout Error',
        'message': connectionTimeoutError
      }));
    }
  }

  Future<GeneralResponse<T>> deleteRequest<T>(
      String endpoint, T Function(dynamic) create) async {
    try {
      final mergedHeaders = {
        'Accept': 'application/json',
        ...?headers,
      };
      final response = await delete(Uri.parse('${baseUrl()}$endpoint'),
              headers: mergedHeaders)
          .timeout(const Duration(seconds: timeoutDuration));
      return _handleResponse(response, create);
    } on SocketException {
      throw Exception(
          jsonEncode({"title": 'Network Error', 'message': networkError}));
    } on TimeoutException {
      throw Exception(jsonEncode({
        "title": 'Connection Timeout Error',
        'message': connectionTimeoutError
      }));
    }
  }

  GeneralResponse<T> _handleResponse<T>(
      Response response, T Function(dynamic) create) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        final jsonResponse = json.decode(response.body);
        // Handle PHP backend response shape
        if (jsonResponse['success'] == true) {
          final dynamic payload = jsonResponse['data'];

          final List<T> parsedData;
          if (payload is List) {
            parsedData = payload.map<T>((item) => create(item)).toList();
          } else {
            parsedData = [create(payload)];
          }

          return GeneralResponse<T>(
            success: true,
            code: 0,
            error: false,
            title: 'Success',
            message: 'Success',
            data: parsedData,
          );
        } else {
          final error = jsonResponse['error'];
          String formatType(String? type) {
            if (type == null || type.isEmpty) return 'Error';
            final replaced = type.replaceAll('_', ' ');
            return replaced[0].toUpperCase() + replaced.substring(1);
          }

          throw Exception(jsonEncode({
            "title": formatType(error?['type']?.toString()),
            'message': error?['message'] ?? 'Unknown error',
            'code': error?['code'] ?? response.statusCode,
          }));
        }
      } catch (e) {
        throw Exception(jsonEncode({
          "title": 'JSON Parse Error',
          'message': 'Server returned invalid JSON response'
        }));
      }
    } else {
      try {
        // Try to read backend error payload
        final jsonResponse = json.decode(response.body);
        final error = jsonResponse['error'];
        String formatType(String? type) {
          if (type == null || type.isEmpty) return 'Error';
          final replaced = type.replaceAll('_', ' ');
          return replaced[0].toUpperCase() + replaced.substring(1);
        }

        throw Exception(jsonEncode({
          "title": formatType(error?['type']?.toString()),
          'message': error?['message'] ?? 'Request failed',
          'code': error?['code'] ?? response.statusCode,
        }));
      } catch (_) {
        // Fallback with status code only
        throw Exception(jsonEncode({
          "title": 'Server Error',
          'message': 'Server returned status ${response.statusCode}',
          'code': response.statusCode,
        }));
      }
    }
  }
}

class AuthenticatedNetworkService extends NetworkService {
  AuthenticatedNetworkService() : super();

  Future<String?> _getAuthToken() async {
    return await LocalStorage.getString(tokenKeyPS);
  }

  @override
  Future<GeneralResponse<T>> getRequest<T>(
      String endpoint, T Function(dynamic) create) async {
    final token = await _getAuthToken();
    final authHeaders = {
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };

    return NetworkService(headers: authHeaders).getRequest(endpoint, create);
  }

  @override
  Future<GeneralResponse<T>> postRequest<T>(String endpoint,
      Map<String, dynamic> body, T Function(dynamic) create) async {
    final token = await _getAuthToken();
    final authHeaders = {
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };

    return NetworkService(headers: authHeaders)
        .postRequest(endpoint, body, create);
  }

  @override
  Future<GeneralResponse<T>> putRequest<T>(String endpoint,
      Map<String, dynamic> body, T Function(dynamic) create) async {
    final token = await _getAuthToken();
    final authHeaders = {
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };

    return NetworkService(headers: authHeaders)
        .putRequest(endpoint, body, create);
  }

  @override
  Future<GeneralResponse<T>> deleteRequest<T>(
      String endpoint, T Function(dynamic) create) async {
    final token = await _getAuthToken();
    final authHeaders = {
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };

    return NetworkService(headers: authHeaders).deleteRequest(endpoint, create);
  }
}
