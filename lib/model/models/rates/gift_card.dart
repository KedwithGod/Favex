class GiftCard {
  final int id;
  final String title;
  final String image;
  final String brandLogo;
  final int status;
  final String createdAt;
  final int confirmMin;
  final int confirmMax;
  final List<Country> countries;

  GiftCard({
    required this.id,
    required this.title,
    required this.image,
    required this.brandLogo,
    required this.status,
    required this.createdAt,
    required this.confirmMin,
    required this.confirmMax,
    required this.countries,
  });

  factory GiftCard.fromJson(Map<String, dynamic> json) {
    int _parseInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
      return 0;
    }

    return GiftCard(
      id: _parseInt(json['id']),
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      brandLogo: json['brand_logo'] ?? '',
      status: _parseInt(json['status']),
      createdAt: json['created_at'] ?? '',
      confirmMin: _parseInt(json['confirm_min']),
      confirmMax: _parseInt(json['confirm_max']),
      countries: (json['\$countries'] as List<dynamic>? ?? [])
          .map((e) => Country.fromJson(e))
          .toList(),
    );
  }
}

class Country {
  final int id;
  final String status;
  final String name;
  final String image;
  final String iso;
  final List<Range> ranges;

  Country({
    required this.id,
    required this.status,
    required this.name,
    required this.image,
    required this.iso,
    required this.ranges,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'] ?? 0,
      status: json['status'] ?? "",
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      iso: json['iso'] ?? '',
      ranges: (json['ranges'] as List<dynamic>? ?? [])
          .map((e) => Range.fromJson(e))
          .toList(),
    );
  }
}

class Range {
  final int id;
  final String giftCardId;
  final String countryId;
  final String min;
  final String max;
  final String status;
  final String updatedBy;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final List<ReceiptCategory> receiptCategories;

  Range({
    required this.id,
    required this.giftCardId,
    required this.countryId,
    required this.min,
    required this.max,
    required this.status,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.receiptCategories,
  });

  factory Range.fromJson(Map<String, dynamic> json) {
    return Range(
      id: json['id'] ?? 0,
      giftCardId: json['gift_card_id'] ?? "",
      countryId: json['gift_card_country_id'] ?? "",
      min: json['min'] ?? "",
      max: json['max'] ?? "",
      status: json['status'] ?? "",
      updatedBy: json['updated_by'] ?? "",
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      deletedAt: json['deleted_at'],
      receiptCategories:
          (json['receipt_categories'] as List<dynamic>? ?? [])
              .map((e) => ReceiptCategory.fromJson(e))
              .toList(),
    );
  }
}

class ReceiptCategory {
  final int id;
  final String title;
  final double amount;
  final String updatedBy;
  final String status;
  final String rangeId;
  final String countryId;
  final String giftCardId;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  ReceiptCategory({
    required this.id,
    required this.title,
    required this.amount,
    required this.updatedBy,
    required this.status,
    required this.rangeId,
    required this.countryId,
    required this.giftCardId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory ReceiptCategory.fromJson(Map<String, dynamic> json) {
    return ReceiptCategory(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      amount: (json['amount'] != null)
          ? double.tryParse(json['amount'].toString()) ?? 0.0
          : 0.0,
      updatedBy: json['updated_by'] ?? "",
      status: json['status'] ?? "",
      rangeId: json['range_id'] ?? "",
      countryId: json['gift_card_country_id'] ?? "",
      giftCardId: json['gift_card_id'] ?? "",
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      deletedAt: json['deleted_at'],
    );
  }
}
