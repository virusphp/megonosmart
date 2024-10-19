import 'package:megonopos/data/models/response/category_response_model.dart';
import 'package:megonopos/data/models/response/product_response_model.dart';
import 'package:megonopos/presentation/home/models/draft_order_item.dart';
import 'package:megonopos/presentation/order/models/draft_order_model.dart';
import 'package:megonopos/presentation/order/models/order_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../presentation/home/models/order_item.dart';
import '../models/request/order_request_model.dart';

class ProductLocalDatasource {
  ProductLocalDatasource._init();

  static final ProductLocalDatasource instance = ProductLocalDatasource._init();

  final String tableProducts = 'products';
  final String tableOrders = 'orders';

  static Database? _database;

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableProducts (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      product_id INTEGER,
      name TEXT,
      price INTEGER,
      stock INTEGER,
      image TEXT,
      category TEXT,
      category_id INTEGER,
      is_best_seller INTEGER,
      is_sync INTEGER DEFAULT 0
    )
  ''');

    // categories
    await db.execute('''
    CREATE TABLE categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      category_id INTEGER,
      name TEXT
    )
  ''');

    await db.execute('''
    CREATE TABLE $tableOrders (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nominal INTEGER,
      payment_method TEXT,
      total_item INTEGER,
      id_kasir INTEGER,
      nama_kasir TEXT,
      transaction_time TEXT,
      is_sync INTEGER DEFAULT 0
      )
      ''');

    await db.execute('''
    CREATE TABLE order_items (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_order INTEGER,
      id_product INTEGER,
      quantity INTEGER,
      price INTEGER
    )
    ''');

    await db.execute('''
    CREATE TABLE draft_order (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      total_item INTEGER,
      nominal INTEGER,
      transaction_time TEXT,
      table_number INTEGER,
      draft_name TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE draft_order_item (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_draft_order INTEGER,
      id_product INTEGER,
      quantity INTEGER,
      price INTEGER
    )
    ''');
  }

  //insert all categories
  Future<void> insertAllCategories(List<Category> categories) async {
    final db = await instance.database;
    for (var category in categories) {
      // print(category.name);
      await db.insert('categories', category.toMap());
    }
  }

  //delete all categories
  Future<void> deleteAllCategories() async {
    final db = await instance.database;
    await db.delete('categories');
  }

  //get all categories
  Future<List<Category>> getAllCategories() async {
    final db = await instance.database;
    final result = await db.query('categories');
    return result.map((e) => Category.fromLocal(e)).toList();
  }

  //saveOrder
  Future<int> saveOrder(OrderModel order) async {
    final db = await instance.database;
    int id = await db.insert(tableOrders, order.toMapForLocal());
    for (var orderItem in order.orders) {
      await db.insert('order_items', orderItem.toMapForLocal(id));
    }
    return id;
  }

  //save draft order
  Future<int> saveDraftOrder(DraftOrderModel order) async {
    final db = await instance.database;
    int id = await db.insert('draft_orders', order.toMapForLocal());
    for (var orderItem in order.orders) {
      await db.insert('draft_order_items', orderItem.toMapForLocal(id));
    }
    return id;
  }

  //get all draft order
  Future<List<DraftOrderModel>> getAllDraftOrder() async {
    final db = await instance.database;
    final result = await db.query('draft_orders', orderBy: 'id DESC');

    List<DraftOrderModel> results = await Future.wait(result.map((item) async {
      final draftOderItem = await getDraftOrderItemByOrderId(item['id'] as int);
      return DraftOrderModel.newFromLocalMap(item, draftOderItem);
    }));
    return results;
  }

  //get draft order item by id order
  Future<List<DraftOrderItem>> getDraftOrderItemByOrderId(int idOrder) async {
    final db = await instance.database;
    final result =
        await db.query('draft_order_items', where: 'id_draft_order = $idOrder');

    List<DraftOrderItem> results = await Future.wait(result.map((item) async {
      // Your asynchronous operation here
      final product = await getProductById(item['id_product'] as int);
      return DraftOrderItem(
          product: product!, quantity: item['quantity'] as int);
    }));
    return results;
  }

  // remove draft order by id
  Future<void> removeDraftOrderById(int id) async {
    final db = await instance.database;
    await db.delete('draft_orders', where: 'id = $id');
    await db.delete('draft_order_item',
        where: 'id_draft_order = ?', whereArgs: [id]);
  }

  //getOrderByIsSync
  Future<List<OrderModel>> getOrderByIsSync() async {
    final db = await instance.database;
    final result = await db.query(tableOrders, where: 'is_sync = 0');
    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  }

  //get order item by id order
  Future<List<OrderItemModel>> getOrderItemByIdOrderLocal(int idOrder) async {
    final db = await instance.database;
    final result = await db.query('order_items', where: 'id_order = $idOrder');
    return result.map((e) => OrderItem.fromMapLocal(e)).toList();
  }

  //update isSync order by id
  Future<int> updateIsSyncOrderById(int id) async {
    final db = await instance.database;
    return await db.update(tableOrders, {'is_sync': 1}, where: 'id = $id');
  }

  Future<List<OrderModel>> getAllOrder() async {
    final db = await instance.database;
    final result = await db.query(tableOrders, orderBy: 'id DESC');
    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  }

  //getOrderItemByOrderId
  Future<List<OrderItem>> getOrderItemByOrderId(int idOrder) async {
    final db = await instance.database;
    final result = await db.query('order_items', where: 'id_order = $idOrder');
    return result.map((e) => OrderItem.fromMap(e)).toList();
  }

  //update isSync order by id
  Future<int> updateIsSyncOrder(int id) async {
    final db = await instance.database;
    return await db.update(tableOrders, {'is_sync': 1}, where: 'id = $id');
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('pos14.db');
    return _database!;
  }

  //remove all data product
  Future<void> removeAllProduct() async {
    final db = await instance.database;
    await db.delete(tableProducts);
  }

  Future<void> insertAllProduct(List<Product> products) async {
    final db = await instance.database;
    for (var product in products) {
      // final productKu = product.toLocalMap();
      await db.insert(tableProducts, product.toLocalMap());
    }
  }

  Future<Product> insertProduct(Product product) async {
    final db = await instance.database;
    int id = await db.insert(tableProducts, product.toMap());
    return product.copyWith(id: id);
  }

  Future<List<Product>> getAllProduct() async {
    final db = await instance.database;
    final result = await db.query(tableProducts);
    return result.map((e) => Product.fromMap(e)).toList();
  }

  //get product by id
  Future<Product?> getProductById(int id) async {
    final db = await instance.database;
    final result =
        await db.query(tableProducts, where: 'product_id = ?', whereArgs: [id]);

    if (result.isEmpty) {
      return null;
    }

    return Product.fromMap(result.first);
  }
}
