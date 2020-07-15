class ModelStocks{
  String itemName;
  int currentStock;
  String stockType;
  int serial;
  String manufacturer;
  String category;
  double purchaseRate;
  double currentValue;
  String expiryDate;
  String batchNo;

  ModelStocks({
   this.itemName,
   this.currentStock,
   this.stockType,
   this.category,
   this.currentValue,
   this.manufacturer,
   this.purchaseRate,
   this.serial,
   this.expiryDate,
   this.batchNo
});
}