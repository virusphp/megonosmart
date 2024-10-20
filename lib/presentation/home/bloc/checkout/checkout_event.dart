part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = _Started;
  const factory CheckoutEvent.addCheckout(Product product) = _AddCheckout;
  const factory CheckoutEvent.removeCheckout(Product product) = _RemoveCheckout;
  //remove product from checkout
  const factory CheckoutEvent.removeProduct(Product product) = _RemoveProduct;


  // save draft order
  const factory CheckoutEvent.saveDraftOrder(int tableNumber, String draftName) =  _SaveDraftOrder;
  //load draft order
  const factory CheckoutEvent.loadDraftOrder(DraftOrderModel data) = _LoadDraftOrder;

}