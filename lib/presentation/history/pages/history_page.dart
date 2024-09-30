import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/presentation/history/bloc/history/history_bloc.dart';
import 'package:megonopos/presentation/history/models/history_transaction_model.dart';

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
    context.read<HistoryBloc>().add(const HistoryEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16.0);
    final indeValue = ValueNotifier(0);

    // final List<HistoryModel> histories = [
    //   HistoryModel(
    //     paymentMethod: 'Credit Card',
    //     totalBill: 150000,
    //     nominalPayment: 150000,
    //     paymentTime: DateTime.now().subtract(const Duration(days: 2)),
    //     status: 'Success',
    //   ),
    //   HistoryModel(
    //     paymentMethod: 'Bank Transfer',
    //     totalBill: 120000,
    //     nominalPayment: 120000,
    //     paymentTime: DateTime.now().subtract(const Duration(days: 1)),
    //     status: 'Pending',
    //   ),
    //   HistoryModel(
    //     paymentMethod: 'E-wallet',
    //     totalBill: 200000,
    //     nominalPayment: 200000,
    //     paymentTime: DateTime.now(),
    //     status: 'Success',
    //   ),
    // ];

    return Scaffold(
        appBar: AppBar(
          title: const Text('History Orders',
              style: TextStyle(fontWeight: FontWeight.bold)),
          // backgroundColor: AppColors.primary,
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
