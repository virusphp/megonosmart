import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:megonopos/core/constants/colors.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/core/extentions/int_ext.dart';
import 'package:megonopos/core/extentions/string_ext.dart';
import 'package:megonopos/presentation/history/bloc/history/history_bloc.dart';
import 'package:megonopos/presentation/home/pages/dashboard_page.dart';

import '../../../core/components/spaces.dart';
import '../widgets/history_transaction_card2.dart';
import 'package:megonopos/data/datasources/product_local_datasource.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _fetchHistory(selectedDate);
  }

  void _fetchHistory(DateTime date) {
    final formatted = DateFormat('yyyy-MM-dd').format(date);
    context.read<HistoryBloc>().add(HistoryEvent.getHistoryReport(formatted));
  }

  @override
  Widget build(BuildContext context) {
    const paddingHorizontal = EdgeInsets.symmetric(horizontal: 10.0);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context), // POP bukan push
        ),
        title: const Text(
          'History',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2010),
                lastDate: DateTime.now(),
              );

              if (picked != null) {
                setState(() => selectedDate = picked);
                _fetchHistory(picked);
              }
            },
            icon: const Icon(Icons.calendar_month, color: AppColors.darkYellow),
          ),
        ],
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) {
              if (data.isEmpty) {
                return const Center(child: Text('No Data'));
              }

              // Group by date
              final Map<String, List<dynamic>> groupedData = {};
              for (var item in data) {
                final dateStr = item.transactionTime.toFormattedDateOnly;
                groupedData.putIfAbsent(dateStr, () => []).add(item);
              }

              final groupKeys = groupedData.keys.toList()
                ..sort((a, b) => b.compareTo(a)); // descending

              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                itemCount: groupKeys.length,
                itemBuilder: (context, groupIndex) {
                  final date = groupKeys[groupIndex];
                  final items = groupedData[date]!;

                  final totalNominal =
                      items.fold<int>(0, (sum, item) => sum + (item.totalPrice as int));

                  return Padding(
                    padding: paddingHorizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              date,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              totalNominal.toCurrency(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors.darkYellow,
                              ),
                            ),
                          ],
                        ),
                        const SpaceHeight(8.0),
                        ...List.generate(
                          items.length,
                          (itemIndex) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: HistoryTransactionCard(
                              key: ValueKey(items[itemIndex].id),
                              padding: EdgeInsets.zero,
                              data: items[itemIndex],
                              onDelete: (id) {
                                // Hapus data
                                ProductLocalDatasource.instance.removeOrderById(id);
                                // Refresh list
                                _fetchHistory(selectedDate);
                                // SnackBar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: AppColors.green,
                                      content: Text('Order deleted successfully')),
                                );
                              },
                            ),
                          ),
                        ),
                        const SpaceHeight(16.0),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
