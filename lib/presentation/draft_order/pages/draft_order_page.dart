import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megonopos/core/extentions/build_context_ext.dart';
import 'package:megonopos/presentation/draft_order/widgets/draft_order_card.dart';

import '../../../core/components/search_input.dart';
import '../../../core/components/spaces.dart';

import '../../home/pages/dashboard_page.dart';
import '../bloc/draft_order/draft_order_bloc.dart';

class DraftOrderPage extends StatefulWidget {
  const DraftOrderPage({super.key});

  @override
  State<DraftOrderPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<DraftOrderPage> {
  final searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context
        .read<DraftOrderBloc>()
        .add(const DraftOrderEvent.getAllDraftOrder());
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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
          title: const Text('Draft Orders',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: SearchInput(
                controller: searchController,
                onChanged: (value) {},
              ),
            ),
            Expanded(
              child: BlocBuilder<DraftOrderBloc, DraftOrderState>(
                builder: (context, state) {
                  return state.maybeWhen(orElse: () {
                    return const Center(
                      child: Text('No data'),
                    );
                  }, loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }, success: (data) {
                    if (data.isEmpty) {
                      return const Center(
                        child: Text('No data'),
                      );
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      itemCount: data.length,
                      separatorBuilder: (context, index) =>
                          const SpaceHeight(8.0),
                      itemBuilder: (context, index) => DraftOrderCard(
                        padding: paddingHorizontal,
                        data: data[index],
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ));
  }
}
