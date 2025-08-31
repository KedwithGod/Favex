

import '../../utilities/imports/shared.dart';

class CryptoModel {
  final int id;
  final String obiexId;
  final String name;
  final String code;
  final String icon;
  final List<Network> networks;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String isStable;
  final String color;
  final String minimumDeposit;
  final String maximumDecimalPlaces;
  final String? data;
  final bool showBuy;
  final String nairaRate;
  final String buyRate;
  final String usdRate;

  CryptoModel({
    required this.id,
    required this.obiexId,
    required this.name,
    required this.code,
    required this.icon,
    required this.networks,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.isStable,
    required this.color,
    required this.minimumDeposit,
    required this.maximumDecimalPlaces,
    this.data,
    required this.showBuy,
    required this.nairaRate,
    required this.buyRate,
    required this.usdRate,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      id: json['id'],
      obiexId: json['obiex_id'],
      name: json['name'],
      code: json['code'],
      icon: json['icon'],
      networks: (json['networks'] as List<dynamic>)
          .map((e) => Network.fromJson(e))
          .toList(),
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isStable: json['is_stable'],
      color: json['color'],
      minimumDeposit: json['minimumDeposit'],
      maximumDecimalPlaces: json['maximumDecimalPlaces'],
      data: json['data'],
      showBuy: json['show_buy'] ?? false,
      nairaRate: json['naira_rate'],
      buyRate: json['buy_rate'],
      usdRate: json['usd_rate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "obiex_id": obiexId,
      "name": name,
      "code": code,
      "icon": icon,
      "networks": networks.map((e) => e.toJson()).toList(),
      "status": status,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "is_stable": isStable,
      "color": color,
      "minimumDeposit": minimumDeposit,
      "maximumDecimalPlaces": maximumDecimalPlaces,
      "data": data,
      "show_buy": showBuy,
      "naira_rate": nairaRate,
      "buy_rate": buyRate,
      "usd_rate": usdRate,
    };
  }

  static List<CryptoModel> fromJsonList(String str) =>
      List<CryptoModel>.from(json.decode(str).map((x) => CryptoModel.fromJson(x)));
}

class Network {
  final int id;
  final String obiexCryptoId;
  final String addressRegex;
  final String? memoRegex;
  final String name;
  final String code;
  final String fee;
  final String feeType;
  final String minimum;
  final String? contractAddress;
  final String? explorerLink;
  final String createdAt;
  final String updatedAt;

  Network({
    required this.id,
    required this.obiexCryptoId,
    required this.addressRegex,
    this.memoRegex,
    required this.name,
    required this.code,
    required this.fee,
    required this.feeType,
    required this.minimum,
    this.contractAddress,
    this.explorerLink,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      obiexCryptoId: json['obiex_crypto_id'],
      addressRegex: json['addressRegex'],
      memoRegex: json['memoRegex'],
      name: json['name'],
      code: json['code'],
      fee: json['fee'],
      feeType: json['feeType'],
      minimum: json['minimum'],
      contractAddress: json['contractAddress'],
      explorerLink: json['explorerLink'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "obiex_crypto_id": obiexCryptoId,
      "addressRegex": addressRegex,
      "memoRegex": memoRegex,
      "name": name,
      "code": code,
      "fee": fee,
      "feeType": feeType,
      "minimum": minimum,
      "contractAddress": contractAddress,
      "explorerLink": explorerLink,
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
