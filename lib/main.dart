import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/data/datasources/auth_remote_datasource.dart';
import 'package:megonopos/data/datasources/midtrans_remote_datasource.dart';
import 'package:megonopos/data/datasources/order_remote_datasource.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';
import 'package:megonopos/data/datasources/product_remote_datasource.dart';
import 'package:megonopos/data/datasources/report_remote_datasource.dart';
import 'package:megonopos/presentation/auth/bloc/login/login_bloc.dart';
import 'package:megonopos/presentation/auth/pages/login_page.dart';
import 'package:megonopos/presentation/draft_order/bloc/draft_order/draft_order_bloc.dart';
import 'package:megonopos/presentation/history/bloc/history/history_bloc.dart';
import 'package:megonopos/presentation/home/bloc/category/category_bloc.dart';
import 'package:megonopos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:megonopos/presentation/home/bloc/logout/logout_bloc.dart';
import 'package:megonopos/presentation/home/bloc/product/product_bloc.dart';
import 'package:megonopos/presentation/home/pages/dashboard_page.dart';
import 'package:megonopos/presentation/order/bloc/order/order_bloc.dart';
import 'package:megonopos/presentation/order/bloc/qris/qris_bloc.dart';
import 'package:megonopos/presentation/setting/bloc/report/product_sales/product_sales_bloc.dart';
import 'package:megonopos/presentation/setting/bloc/report/summary/summary_bloc.dart';
import 'package:megonopos/presentation/setting/bloc/sync_order/sync_order_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => ProductBloc(ProductRemoteDatasource())
            ..add(const ProductEvent.fetchLocal()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(),
        ),
        BlocProvider(
          create: (context) => OrderBloc(),
        ),
        BlocProvider(
          create: (context) => QrisBloc(
            MidtransRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(),
        ),
        BlocProvider(
          create: (context) => SyncOrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(ProductRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DraftOrderBloc(ProductLocalDatasource.instance),
        ),
        BlocProvider(
          create: (context) => SummaryBloc(ReportRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => ProductSalesBloc(ReportRemoteDataSource()),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return const DashboardPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
