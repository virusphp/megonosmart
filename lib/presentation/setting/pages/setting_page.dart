import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/core/assets/assets.gen.dart';
import 'package:megonopos/core/components/menu_button.dart';
import 'package:megonopos/core/components/spaces.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/presentation/auth/pages/login_page.dart';
import 'package:megonopos/presentation/home/bloc/logout/logout_bloc.dart';
import 'package:megonopos/presentation/setting/bloc/report/close_cashier/close_cashier_bloc.dart';
import 'package:megonopos/presentation/setting/bloc/sync_order/sync_order_bloc.dart';
import 'package:megonopos/presentation/setting/pages/manage_print_page.dart';
import 'package:megonopos/presentation/setting/pages/manage_product_page.dart';
import 'package:megonopos/presentation/setting/pages/report/report_page.dart';
import 'package:megonopos/presentation/setting/pages/save_server_key_page.dart';
import 'package:megonopos/presentation/setting/pages/sync_data_page.dart';

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
                Flexible(
                  child: MenuButton(
                    iconPath: Assets.images.manageProduct.path,
                    label: "kelola Produk",
                    onPressed: () {
                      context.push(const ManageProductPage());
                    },
                    isImage: true,
                  ),
                ),
                const SpaceWidth(15.0),
                Flexible(
                  child: MenuButton(
                    iconPath: Assets.images.managePrinter.path,
                    label: "kelola Printer",
                    onPressed: () {
                      context.push(const ManagePrinterPage());
                    },
                    isImage: true,
                  ),
                ),
              ],
            ),
          ),
          const SpaceHeight(1.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Flexible(
                  child: MenuButton(
                    iconPath: Assets.images.manageQr.path,
                    label: "Kelola QRIS Server key",
                    onPressed: () {
                      context.push(const SaveServerKeyPage());
                    },
                    isImage: true,
                  ),
                ),
                const SpaceWidth(15.0),
                Flexible(
                  child: MenuButton(
                    iconPath: Assets.images.sync.path,
                    label: "Kelola Sync Data",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SyncDataPage(),
                        ),
                      );
                    },
                    isImage: true,
                  ),
                ),
              ],
            ),
          ),
          const SpaceHeight(1.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Flexible(
                  child: MenuButton(
                    iconPath: Assets.images.report.path,
                    label: "Kelola Laporan Penjualan",
                    onPressed: () {
                      context.push(const ReportPage());
                    },
                    isImage: true,
                  ),
                ),
                const SpaceWidth(15.0),
                Flexible(
                  child: BlocListener<SyncOrderBloc, SyncOrderState>(
                    listener: (context, state) {
                      state.maybeMap(
                        orElse: () => {},
                        successForCloseChasier: (_) {
                          context.read<CloseCashierBloc>().add(
                            const CloseCashierEvent.closeCashier(),
                          );
                         
                          context.pushReplacement(const LoginPage()); 
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Sync Order Success"),
                            ),
                          );
                        }
                      );
                    },
                    child: MenuButton(
                      iconPath: Assets.images.close.path,
                      label: "Tutup Kasir",
                      onPressed: () async {
                        showDialog(
                          context: context, 
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Tutup Kasir"),
                              content: const Text("Apakah anda yakin?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Batal"),
                                ),
                                TextButton(
                                  onPressed: () {
                                     context
                                      .read<SyncOrderBloc>()
                                      .add(const SyncOrderEvent.sendOrderForCloseChasier());

                                    Navigator.pop(context);
                                  },
                                  child: const Text("Ya"),
                                ),
                              ],
                            );
                          });
                      },
                      isImage: true,
                    ),
                  ),
                ),
              ],
            ),
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
