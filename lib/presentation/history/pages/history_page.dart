import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/presentation/history/bloc/history/history_bloc.dart';
import 'package:megonopos/presentation/home/pages/dashboard_page.dart';

import '../../../core/components/spaces.dart';

import '../widgets/history_transaction_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    // context.read<HistoryBloc>().add(const HistoryEvent.fetch());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HistoryBloc>().add(const HistoryEvent.fetch());
    });
  }

  @override
  Widget build(BuildContext context) {
    const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16.0);
  
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.push(const DashboardPage());
            },
          ),
          title: const Text('History',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          elevation: 0,
          centerTitle: true,
        ),
        body: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              success: (data) {
                if (data.isEmpty) {
                  return const Center(
                    child: Text('No Data'),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  itemCount: data.length,
                  separatorBuilder: (context, index) => const SpaceHeight(8.0),
                  itemBuilder: (context, index) => HistoryTransactionCard(
                    padding: paddingHorizontal,
                    data: data[index],
                  ),
                );
              },
            );
          },
        ));
  }
}
