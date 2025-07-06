import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:megonopos/core/constants/colors.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/core/extentions/string_ext.dart';
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

  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    final now = DateFormat('yyyy-MM-dd').format(selectedDate);
    context.read<HistoryBloc>().add(HistoryEvent.getHistoryReport(now));

    // context.read<HistoryBloc>().add(const HistoryEvent.fetch());
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<HistoryBloc>().add(const HistoryEvent.fetch());
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const paddingHorizontal = EdgeInsets.symmetric(horizontal: 10.0);
    // const marginVertical = EdgeInsets.symmetric(vertical: 2.0);
  
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
          actions: [
            IconButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2010),
                lastDate: DateTime.now(),
              ).then((value) {
                if (value != null) {
                  setState(() {
                    selectedDate = value;
                  });
                  final date = DateFormat('yyyy-MM-dd').format(value);
                  context
                      .read<HistoryBloc>()
                      .add(HistoryEvent.getHistoryReport(date));
                }
              });
            },
            icon: const Icon(Icons.calendar_month, color: AppColors.darkYellow),
          ),
          ],
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
                // Group data by date (assuming data has a 'date' property of type DateTime or String)
                final Map<String, List<dynamic>> groupedData = {};
                for (var item in data) {
                  // Adjust this line based on your data model
                  final date = item.transactionTime is DateTime
                    ? item.transactionTime.toFormattedDateOnly
                    : item.transactionTime.toFormattedDateOnly;
                  groupedData.putIfAbsent(date, () => []).add(item);
                }

                final groupKeys = groupedData.keys.toList()..sort((a, b) => b.compareTo(a)); // descending

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  itemCount: groupKeys.length,
                  itemBuilder: (context, groupIndex) {
                  final date = groupKeys[groupIndex];
                  final items = groupedData[date]!;
                  return Padding(
                    padding: paddingHorizontal,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      date,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      ),
                      const SpaceHeight(8.0),
                      ...List.generate(
                      items.length,
                      (itemIndex) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: HistoryTransactionCard(
                        padding: EdgeInsets.zero,
                        data: items[itemIndex],
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
        ));
  }
}
