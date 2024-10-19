import 'dart:convert';
import 'package:megonopos/presentation/home/models/draft_order_item.dart';
import 'package:megonopos/presentation/home/models/order_item.dart';

class DraftOrderModel {
  final int? id;
  final List<DraftOrderItem> orders;
  final int totalQuantity;
  final int totalPrice;
  final String transactionTime;
  final int tableNumber;
  final String draftName;
  DraftOrderModel({
    this.id,
    required this.orders,
    required this.totalQuantity,
    required this.totalPrice,
    required this.transactionTime,
    required this.tableNumber,
    required this.draftName,
  });

  Map<String, dynamic> toMap() {
    return {
      'orders': orders.map((x) => x.toMap()).toList(),
      'totalQuantity': totalQuantity,
      'totalPrice': totalPrice,
      'tableNumber': tableNumber,
      'draftName': draftName,
    };
  }

  Map<String, dynamic> toMapForLocal() {
    return {
      'total_item': totalQuantity,
      'nominal': totalPrice,
      'table_number': tableNumber,
      'transaction_time': transactionTime,
      'draft_name': draftName,
    };
  }

  factory DraftOrderModel.fromLocalMap(Map<String, dynamic> map) {
    return DraftOrderModel(
        orders: [],
        totalQuantity: map['total_item']?.toInt() ?? 0,
        totalPrice: map['nominal']?.toInt() ?? 0,
        id: map['id']?.toInt() ?? 0,
        transactionTime: map['transaction_time'] ?? '',
        tableNumber: map['id_kasir']?.toInt() ?? 0,
        draftName: map['draft_name'] ?? '');
  }

  factory DraftOrderModel.newFromLocalMap(
      Map<String, dynamic> map, List<DraftOrderItem> orders) {
    return DraftOrderModel(
      orders: orders,
      totalQuantity: map['totalQuantity']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      transactionTime: map['transaction_time'] ?? '',
      tableNumber: map['tableNumber']?.toInt() ?? 0,
      draftName: map['draftName'] ?? false,
    );
  }

  factory DraftOrderModel.fromMap(Map<String, dynamic> map) {
    return DraftOrderModel(
      orders: List<DraftOrderItem>.from(
          map['orders']?.map((x) => OrderItem.fromMap(x))),
      totalQuantity: map['totalQuantity']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      transactionTime: map['transactionTime'] ?? '',
      tableNumber: map['tableNumber']?.toInt() ?? 0,
      draftName: map['draftName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DraftOrderModel.fromJson(String source) =>
      DraftOrderModel.fromMap(json.decode(source));
}
