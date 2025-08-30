import '../../utilities/imports/shared.dart';

class NetworkService {
  static const int timeoutDuration = 30; // Timeout duration in seconds

  final Map<String, String>? headers;
  final Dio _dio;

  NetworkService({this.headers})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl(),
            connectTimeout: const Duration(seconds: timeoutDuration),
            receiveTimeout: const Duration(seconds: timeoutDuration),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'X-Requested-With': 'XMLHttpRequest',
              ...?headers,
            },
          ),
        );

  // === GET ===
  Future<GeneralResponse<T>> getRequest<T>(
    BuildContext context,
    String endpoint,
    T Function(dynamic) create,
  ) async {
    try {
      final response = await _dio.get(endpoint);
      return _handleResponse(context, response, create);
    } on DioException catch (e) {
      _handleDioError(context, e);
      rethrow;
    }
  }

  // === POST ===
  Future<GeneralResponse<T>> postRequest<T>(
    BuildContext context,
    String endpoint,
    Map<String, dynamic> body,
    T Function(dynamic) create,
  ) async {
    try {
      final response = await _dio.post(endpoint, data: json.encode(body));
      return _handleResponse(context, response, create);
    } on DioException catch (e) {
      _handleDioError(context, e);
      rethrow;
    }
  }

  // === PUT ===
  Future<GeneralResponse<T>> putRequest<T>(
    BuildContext context,
    String endpoint,
    Map<String, dynamic> body,
    T Function(dynamic) create,
  ) async {
    try {
      final response = await _dio.put(endpoint, data: json.encode(body));
      return _handleResponse(context, response, create);
    } on DioException catch (e) {
      _handleDioError(context, e);
      rethrow;
    }
  }

  // === DELETE ===
  Future<GeneralResponse<T>> deleteRequest<T>(
    BuildContext context,
    String endpoint,
    T Function(dynamic) create,
  ) async {
    try {
      final response = await _dio.delete(endpoint);
      return _handleResponse(context, response, create);
    } on DioException catch (e) {
      _handleDioError(context, e);
      rethrow;
    }
  }

  // === RESPONSE HANDLER ===
  GeneralResponse<T> _handleResponse<T>(
    BuildContext context,
    Response response,
    T Function(dynamic) create,
  ) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        final jsonResponse = response.data is String
            ? json.decode(response.data)
            : response.data;

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
            message: jsonResponse['message'] ?? 'Success',
            data: parsedData,
          );
        } else {
          final error = jsonResponse['error'];
          final errorTitle = _formatType(error?['type']?.toString());
          final errorMessage = error?['message'] ?? 'Unknown error';

           SchedulerBinding.instance
              .addPostFrameCallback((_) => snackBarWidget(
            context,
            title: errorTitle,
            text: errorMessage,
            color: Colors.red,
          ));

          throw Exception(errorMessage);
        }
      } catch (_) {
         SchedulerBinding.instance
              .addPostFrameCallback((_) => snackBarWidget(
          context,
          title: "JSON Parse Error",
          text: "Server returned invalid JSON",
          color: Colors.red,
        ));

        throw Exception("JSON Parse Error");
      }
    } else {
      SchedulerBinding.instance
              .addPostFrameCallback((_) =>  snackBarWidget(
        context,
        title: "Server Error",
        text: "Server returned status ${response.statusCode}",
        color: Colors.red,
      ));

      throw Exception("Server Error ${response.statusCode}");
    }
  }

  // === ERROR HANDLER ===
  void _handleDioError(BuildContext context, DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
       SchedulerBinding.instance
              .addPostFrameCallback((_) => snackBarWidget(
        context,
        title: "Connection Timeout Error",
        text: connectionTimeoutError,
         color: colorsBucket!.backgroundDisabled,
      ));
    } else if (e.type == DioExceptionType.connectionError ||
        e.error is SocketException) {
       SchedulerBinding.instance
              .addPostFrameCallback((_) => snackBarWidget(
        context,
        title: "Network Error",
        text: networkError,
         color: colorsBucket!.backgroundDisabled,
      ));
    } else if (e.response != null) {
        SchedulerBinding.instance
              .addPostFrameCallback((_) =>snackBarWidget(
        context,
        title: "Server Error",
        text: e.response?.data.toString() ?? "Unknown server error",
        color: colorsBucket!.white,
      ));
    } else {
       SchedulerBinding.instance
              .addPostFrameCallback((_) => snackBarWidget(
        context,
        title: "Unexpected Error",
        text: e.message ?? "Unknown error",
         color: colorsBucket!.white,
      ));
    }
  }

  // === Helper ===
  String _formatType(String? type) {
    if (type == null || type.isEmpty) return 'Error';
    final replaced = type.replaceAll('_', ' ');
    return replaced[0].toUpperCase() + replaced.substring(1);
  }
}
