class Mobile {
  final String title;
  final int storage;
  final int ram;
  final int cameraFront;
  final int cameraBack;
  final int battery;
  final double price;
  const Mobile({
    required this.title,
    required this.ram,
    required this.storage,
    required this.cameraFront,
    required this.cameraBack,
    required this.battery,
    required this.price,
  });

  factory Mobile.fromJson(Map<String, dynamic> json) {
    return Mobile(
      title: json['title'],
      price: json['price'].toDouble(),
      battery: json['battery'],
      storage: json['storage'],
      ram: json['ram'],
      cameraFront: json['front_camera'],
      cameraBack: json['back_camera'],
    );
  }
}
