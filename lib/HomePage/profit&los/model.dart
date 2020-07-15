class ModelProfitAndLoss{
  String itemName;
  String invoice;
  int saleQuantity;
  double saleValue;
  double purchaseValue;
  double avgPurchaseValue;
  double avgSaleValue;

  ModelProfitAndLoss({
    this.itemName,
    this.avgPurchaseValue,
    this.avgSaleValue,
    this.invoice,
    this.purchaseValue,
    this.saleQuantity,
    this.saleValue
});
}