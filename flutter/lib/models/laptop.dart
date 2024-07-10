class Laptop {
  final String title;
  final int storage;
  final int ram;
  final String core;
  final double price;

  const Laptop({
    required this.title,
    required this.ram,
    required this.storage,
    required this.core,
    required this.price,
  });

  factory Laptop.fromJson(Map<String, dynamic> json) {
    return Laptop(
      title: json['title'],
      price: json['price'].toDouble(),
      storage: json['storage'],
      ram: json['ram'],
      core: json['core'],
    );
  }
}
