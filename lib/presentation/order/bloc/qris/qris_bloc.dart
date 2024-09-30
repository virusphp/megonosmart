import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megonopos/data/datasources/midtrans_remote_datasource.dart';
import 'package:megonopos/data/models/response/qris_response_model.dart';
import 'package:megonopos/data/models/response/qris_status_response_model.dart';

part 'qris_event.dart';
part 'qris_state.dart';
part 'qris_bloc.freezed.dart';

class QrisBloc extends Bloc<QrisEvent, QrisState> {
  final MidtransRemoteDatasource midtransRemoteDatasource;

  QrisBloc(
    this.midtransRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GenerateQRCode>((event, emit) async {
      emit(const QrisState.loading());
      final response = await midtransRemoteDatasource.generateQRCode(
          event.orderId, event.grossAmount);

      emit(QrisState.qrisResponse(response));
    });

    on<_CheckPaymentStatus>((event, emit) async {
      // emit(const QrisState.loading());
      final response =
          await midtransRemoteDatasource.checkPaymentStatus(event.orderId);

      // emit(QrisState.statusCHeck(response));

      if (response.transactionStatus == 'settlement') {
        emit(const QrisState.success("Pembayaran Berhasil"));
      }
    });
  }
}
