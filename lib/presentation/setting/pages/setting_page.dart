import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/core/assets/assets.gen.dart';
import 'package:megonopos/core/components/menu_button.dart';
import 'package:megonopos/core/components/spaces.dart';
import 'package:megonopos/core/constants/colors.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/presentation/auth/pages/login_page.dart';
import 'package:megonopos/presentation/home/bloc/logout/logout_bloc.dart';
import 'package:megonopos/presentation/home/bloc/product/product_bloc.dart';
import 'package:megonopos/presentation/order/models/order_model.dart';
import 'package:megonopos/presentation/setting/pages/manage_product_page.dart';
import 'package:megonopos/presentation/setting/pages/save_server_key_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        // centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                MenuButton(
                  iconPath: Assets.images.manageProduct.path,
                  label: "kelola Produk",
                  onPressed: () {
                    context.push(const ManageProductPage());
                  },
                  isImage: true,
                ),
                const SpaceWidth(15.0),
                MenuButton(
                  iconPath: Assets.images.managePrinter.path,
                  label: "kelola Kategori",
                  onPressed: () {},
                  isImage: true,
                ),
              ],
            ),
          ),
          const SpaceHeight(1.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                MenuButton(
                  iconPath: Assets.images.manageServerKey.path,
                  label: "Kelola QRIS Server key",
                  onPressed: () {
                    context.push(const SaveServerKeyPage());
                  },
                  isImage: true,
                ),
                const SpaceWidth(15.0),
                MenuButton(
                  iconPath: Assets.images.manageDiskon.path,
                  label: "Kelola Diskon",
                  onPressed: () {},
                  isImage: true,
                ),
              ],
            ),
          ),
          BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {
              state.maybeMap(
                orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                success: (_) async {
                  await ProductLocalDatasource.instance.removeAllProduct();
                  await ProductLocalDatasource.instance
                      .insertAllProduct(_.products.toList());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: AppColors.green,
                      content: Text('Sync Data Success'),
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return ElevatedButton(
                      onPressed: () {
                        context
                            .read<ProductBloc>()
                            .add(const ProductEvent.fetch());
                      },
                      child: const Text('Sync Data'));
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (_) {
                  AuthLocalDatasource().removeAuthData();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              );
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  context.read<LogoutBloc>().add(const LogoutEvent.logout());
                },
                child: const Text("Logout"),
              );
            },
          ),
        ],
      ),
    );
  }
}
