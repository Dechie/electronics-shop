class Laptop {
  final String title;
  final String image;
  final String storage;
  final int ram;
  final String core;
  final double price;

  const Laptop({
    required this.title,
    required this.image,
    required this.ram,
    required this.storage,
    required this.core,
    required this.price,
  });

  factory Laptop.fromJson(Map<String, dynamic> json) {
    Laptop? laptop;

    print('image: ${json['image'] ?? 'nullvalue'}');
    try {
      laptop = Laptop(
        title: json['title'],
        image: json['image'],
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
