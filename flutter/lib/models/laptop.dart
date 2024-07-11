class Laptop {
  final String title;
  final String storage;
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
    Laptop? laptop;

    try {
      laptop = Laptop(
        title: json['title'],
        price: json['price'].toDouble(),
        storage: json['storage'],
        ram: json['ram'],
        core: json['core'],
      );
    } catch (e) {
      print(e.toString());
    }

    return laptop!;
  }
}
