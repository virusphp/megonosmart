import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/core/components/spaces.dart';
import 'package:megonopos/core/constants/colors.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/presentation/home/bloc/product/product_bloc.dart';
import 'package:megonopos/presentation/order/bloc/order/order_bloc.dart';
import 'package:megonopos/presentation/setting/bloc/sync_order/sync_order_bloc.dart';

class SyncDataPage extends StatefulWidget {
  const SyncDataPage({super.key});

  @override
  State<SyncDataPage> createState() => _SyncDataPageState();
}

class _SyncDataPageState extends State<SyncDataPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sync Data'),
          centerTitle: true,
        ),
        //textfield untuk input server key
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            //button sync data product
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
                        content: Text('Sync Data product Success'),
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
                        child: const Text('Sync Data Product'));
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            ),
            const SpaceHeight(20),
            //button sync data order
            BlocConsumer<SyncOrderBloc, SyncOrderState>(
              listener: (context, state) {
                state.maybeMap(
                  orElse: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  success: (_) async {
                    // await ProductLocalDatasource.instance.removeAllProduct();
                    // await ProductLocalDatasource.instance
                    //     .insertAllProduct(_.products.toList());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: AppColors.green,
                        content: Text('Sync Data orders Success'),
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
                              .read<SyncOrderBloc>()
                              .add(const SyncOrderEvent.sendOrder());
                        },
                        child: const Text('Sync Data Order'));
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            ),
          ],
        ));
  }
}
