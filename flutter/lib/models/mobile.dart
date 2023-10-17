class Mobile {
  const Mobile({
    required this.title,
    required this.status,
    required this.ram,
    required this.storage,
    required this.cameraFront,
    required this.cameraBack,
    required this.battery,
    required this.price,
    required this.quantity,
  });

  final String title;
  final String status;
  final int storage;
  final int ram;
  final int cameraFront;
  final int cameraBack;
  final int battery;
  final double price;
  final int quantity;
}
