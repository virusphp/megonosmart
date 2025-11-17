import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/core/assets/assets.gen.dart';
import 'package:megonopos/core/components/menu_button.dart';
import 'package:megonopos/core/components/spaces.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/data/models/response/auth_response_model.dart';
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
  String? userLogin;

    @override
  void initState() {
    AuthLocalDatasource().getAuthData().then((value) async {
      if (value.result!.user.name != '') {
        setState(() {
          userLogin = value.result!.user.name;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: ListView(
        children: [
          // Profile Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, size: 40),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userLogin?? '',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'user@example.com',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          // Menu Items
          _buildMenuRow(
            context,
            Assets.images.manageProduct.path,
            "Kelola Produk",
            () => context.push(const ManageProductPage()),
            Assets.images.managePrinter.path,
            "Kelola Printer",
            () => context.push(const ManagePrinterPage()),
          ),
          _buildMenuRow(
            context,
            Assets.images.manageQr.path,
            "Kelola QRIS Server Key",
            () => context.push(const SaveServerKeyPage()),
            Assets.images.sync.path,
            "Kelola Sync Data",
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SyncDataPage()),
            ),
          ),
          _buildMenuRow(
            context,
            Assets.images.report.path,
            "Kelola Laporan Penjualan",
            () => context.push(const ReportPage()),
            Assets.images.close.path,
            "Tutup Kasir",
            _showCloseCashierDialog,
          ),
          const Divider(),
          // Logout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<LogoutBloc, LogoutState>(
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
                return ElevatedButton.icon(
                  icon: const Icon(Icons.power_settings_new),
                  label: const Text("Logout"),
                  onPressed: () {
                    context.read<LogoutBloc>().add(const LogoutEvent.logout());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuRow(
    BuildContext context,
    String icon1,
    String label1,
    VoidCallback onPressed1,
    String icon2,
    String label2,
    VoidCallback onPressed2,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          Flexible(
            child: MenuButton(
              iconPath: icon1,
              label: label1,
              onPressed: onPressed1,
              isImage: true,
            ),
          ),
          const SpaceWidth(15.0),
          Flexible(
            child: label2 == "Tutup Kasir"
                ? BlocListener<SyncOrderBloc, SyncOrderState>(
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
                      iconPath: icon2,
                      label: label2,
                      onPressed: onPressed2,
                      isImage: true,
                    ),
                  )
                : MenuButton(
                    iconPath: icon2,
                    label: label2,
                    onPressed: onPressed2,
                    isImage: true,
                  ),
          ),
        ],
      ),
    );
  }

  void _showCloseCashierDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Tutup Kasir"),
          content: const Text("Apakah anda yakin?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                context.read<SyncOrderBloc>().add(
                  const SyncOrderEvent.sendOrderForCloseChasier(),
                );
                Navigator.pop(context);
              },
              child: const Text("Ya"),
            ),
          ],
        );
      },
    );
  }
}
