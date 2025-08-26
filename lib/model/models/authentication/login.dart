class AuthUser {
  final int id;
  final String appUserId;
  final String fullName;
  final String email;
  final String? phone;
  final bool isAdmin;
  final String? twoFaAuthentication;
  final String? profileImage;
  final Business? business;
  final Status? status;
  final String createdAt;
  final String updatedAt;

  AuthUser({
    required this.id,
    required this.appUserId,
    required this.fullName,
    required this.email,
    this.phone,
    required this.isAdmin,
    this.twoFaAuthentication,
    this.profileImage,
    this.business,
    this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['id'],
      appUserId: json['app_user_id'],
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      isAdmin: json['is_admin'],
      twoFaAuthentication: json['two_fa_authentication'],
      profileImage: json['profile_image'],
      business: json['business'] != null ? Business.fromJson(json['business']) : null,
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'app_user_id': appUserId,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'is_admin': isAdmin,
      'two_fa_authentication': twoFaAuthentication,
      'profile_image': profileImage,
      'business': business?.toJson(),
      'status': status?.toJson(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Business {
  final int id;
  final String businessId;
  final String businessName;
  final String businessAddress;
  final String city;
  final String state;
  final String country;
  final String createdAt;
  final String updatedAt;
  final String? businessImage;
  final dynamic totalUnits;
  final dynamic unassignedUnits;
  final String? subscriptionType;

  Business({
    required this.id,
    required this.businessId,
    required this.businessName,
    required this.businessAddress,
    required this.city,
    required this.state,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
    this.businessImage,
    this.totalUnits,
    this.unassignedUnits,
    this.subscriptionType,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      businessId: json['business_id'],
      businessName: json['business_name'],
      businessAddress: json['business_address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      businessImage: json['businiess_image'],
      totalUnits: json['total_units'],
      unassignedUnits: json['unassigned_units'],
      subscriptionType: json['subscription_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'business_id': businessId,
      'business_name': businessName,
      'business_address': businessAddress,
      'city': city,
      'state': state,
      'country': country,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'businiess_image': businessImage,
      'total_units': totalUnits,
      'unassigned_units': unassignedUnits,
      'subscription_type': subscriptionType,
    };
  }
}

class Status {
  final int id;
  final String name;
  final String description;
  final String createdAt;
  final String updatedAt;
  final int valueId;

  Status({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.valueId,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      valueId: json['value_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'value_id': valueId,
    };
  }
}

class AuthResponse {
  final bool success;
  final String? message;
  final AuthUser? user;
  final Business? business;
  final List<dynamic> payments;
  final String? token;
  final String? tokenType;

  AuthResponse({
    required this.success,
    this.message,
    this.user,
    this.business,
    this.payments = const [],
    this.token,
    this.tokenType,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> data) {

      return AuthResponse(
        success: true,
        user: data['user'] != null ? AuthUser.fromJson(data['user']) : null,
        business: data['business'] != null ? Business.fromJson(data['business']) : null,
        payments: data['payments'] ?? [],
        token: data['token'],
        tokenType: data['token_type'],
      );
    } 
  
}

class OtpResponse {
  final bool success;
  final String message;
  final String? type;
  final bool? verified;

  OtpResponse({
    required this.success,
    required this.message,
    this.type,
    this.verified,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    // Support both top-level and payload-only parsing
    if (json.containsKey('success')) {
      if (json['success'] == true) {
        final data = json['data'];
        return OtpResponse(
          success: true,
          message: data?['message'] ?? 'Success',
          type: data?['type'],
          verified: data?['verified'],
        );
      } else {
        final error = json['error'];
        return OtpResponse(
          success: false,
          message: error?['message'] ?? 'Unknown error',
        );
      }
    } else {
      // Payload-only object assumed to be the `data` content from API
      final data = json;
      return OtpResponse(
        success: true,
        message: data['message'] ?? 'Success',
        type: data['type'],
        verified: data['verified'],
      );
    }
  }
}
