import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:megonopos/core/components/buttons.dart';
import 'package:megonopos/core/components/custom_dropdown.dart';
import 'package:megonopos/core/components/custom_text_field.dart';
import 'package:megonopos/core/components/image_picker_widget.dart';
import 'package:megonopos/core/components/spaces.dart';
import 'package:megonopos/core/extentions/string_ext.dart';
import 'package:megonopos/data/models/response/category_response_model.dart';
import 'package:megonopos/data/models/response/product_response_model.dart';
import 'package:megonopos/presentation/home/bloc/category/category_bloc.dart';
import 'package:megonopos/presentation/home/bloc/product/product_bloc.dart';
import 'package:megonopos/presentation/setting/models/category_model.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController? nameController;
  TextEditingController? priceController;
  TextEditingController? stockController;

  Category? category;

  XFile? imageFile;

  bool isBestSeller = false;

  final List<CategoryModel> categories = [
    CategoryModel(name: "Minuman", value: "drink"),
    CategoryModel(name: "Makanan", value: "food"),
    CategoryModel(name: "Snack", value: "snack"),
  ];

  @override
  void initState() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    stockController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController?.dispose();
    priceController?.dispose();
    stockController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          CustomTextField(
            controller: nameController!,
            label: 'Nama Produk',
          ),
          const SpaceHeight(20.0),
          CustomTextField(
            controller: priceController!,
            label: 'Harga Produk',
            keyboardType: TextInputType.number,
            onChanged: (value) {
              // final int priceValue = value.toIntegerFromText;
              // priceController.text = priceValue.currencyFormatRp;
              // priceController.selection = TextSelection.fromPosition(
              //     TextPosition(offset: priceController.text.length));
            },
          ),
          const SpaceHeight(20.0),
          ImagePickerWidget(
            label: 'Foto Produk',
            onChanged: (file) {
              if (file == null) {
                return;
              }
              imageFile = file;
            },
          ),
          const SpaceHeight(20.0),
          CustomTextField(
            controller: stockController!,
            label: 'Stok Produk',
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(20.0),
          //isBestSeller
          Row(
            children: [
              Checkbox(
                value: isBestSeller,
                onChanged: (value) {
                  setState(() {
                    isBestSeller = value!;
                  });
                },
              ),
              const Text('Produk Terlaris'),
            ],
          ),
          const SpaceHeight(20.0),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              List<Category> categories = [];
              state.maybeWhen(
                orElse: () {},
                loadedLocal: (data) {
                  categories = data;
                },
              );
              return CustomDropdown<Category>(
                value: categories.first,
                items: categories,
                label: 'Kategori',
                onChanged: (value) {
                  category = value;
                },
              );
            },
          ),
          const SpaceHeight(24.0),
          BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                success: (_) {
                  Navigator.pop(context);
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, success: (_) {
                return Button.filled(
                  onPressed: () {
                    // ketika tombol simpan di klik
                    final String name = nameController!.text;
                    final int price = priceController!.text.toIntegerFromText;
                    final int stock = stockController!.text.toIntegerFromText;
                    final Product product = Product(
                      name: name,
                      price: price,
                      stock: stock,
                      category: category!.name!,
                      categoryId: category!.id,
                      isBestSeller: isBestSeller,
                      image: imageFile!.path,
                    );
                    context
                        .read<ProductBloc>()
                        .add(ProductEvent.addProduct(product, imageFile!));
                  },
                  label: 'Simpan',
                );
              });
            },
          ),
          const SpaceHeight(30.0),
          Button.outlined(
            onPressed: () {
              Navigator.pop(context);
            },
            label: 'Batal',
          ),
          const SpaceHeight(30.0),
        ],
      ),
    );
  }
}
