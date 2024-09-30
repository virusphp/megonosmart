import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';
import 'package:megonopos/data/datasources/auth_remote_datasource.dart';
import 'package:megonopos/data/datasources/midtrans_remote_datasource.dart';
import 'package:megonopos/data/datasources/product_remote_datasource.dart';
import 'package:megonopos/presentation/auth/bloc/login/login_bloc.dart';
import 'package:megonopos/presentation/auth/pages/login_page.dart';
import 'package:megonopos/presentation/history/bloc/history/history_bloc.dart';
import 'package:megonopos/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:megonopos/presentation/home/bloc/logout/logout_bloc.dart';
import 'package:megonopos/presentation/home/bloc/product/product_bloc.dart';
import 'package:megonopos/presentation/home/pages/dashboard_page.dart';
import 'package:megonopos/presentation/order/bloc/order/order_bloc.dart';
import 'package:megonopos/presentation/order/bloc/qris/qris_bloc.dart';

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
