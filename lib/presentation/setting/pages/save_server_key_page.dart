import 'package:flutter/material.dart';
import 'package:megonopos/core/constants/colors.dart';
import 'package:megonopos/data/datasources/auth_local_datasource.dart';

class SaveServerKeyPage extends StatefulWidget {
  const SaveServerKeyPage({super.key});

  @override
  State<SaveServerKeyPage> createState() => _SaveServerKeyPageState();
}

class _SaveServerKeyPageState extends State<SaveServerKeyPage> {
  TextEditingController? serverKeyController;

  String serverKey = '';

  Future<void> getServerKey() async {
    serverKey = await AuthLocalDatasource().getMidtransServerKey();
  }

  @override
  void initState() {
    super.initState();
    serverKeyController = TextEditingController();
    getServerKey();
    Future.delayed(const Duration(seconds: 2), () {
      serverKeyController!.text = serverKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Save Server key'),
          centerTitle: true,
        ),
        //textfield untuk input server key
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: serverKeyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide(
                      color: AppColors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                      color: AppColors.darkYellow,
                    ),
                  ),
                  labelText: 'Server key',
                ),
              ),
            ),
            //button untuk menyimpan server key
            ElevatedButton(
              onPressed: () {
                AuthLocalDatasource()
                    .saveMidtransServerKey(serverKeyController!.text);
                const SnackBar(
                  content: Text(
                    'Server key saved',
                    style: TextStyle(color: AppColors.green),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ));
  }
}
