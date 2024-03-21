import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Commerce'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: viewportConstraints.maxWidth,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: const NetworkImage(
                            'https://picsum.photos/id/60/400'),
                      ),
                    ),
                    const ProductList(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: const NetworkImage(
                            'https://picsum.photos/id/90/400'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            ProductImage(),
            ProductImage(
              rndSeed: 2,
              name: "Lukisan 1",
              price: 5000000,
            ),
            ProductImage(
              rndSeed: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final int rndSeed;
  final String name;
  final double price;

  const ProductImage({
    Key? key,
    this.rndSeed = 1,
    this.name = "Product Name",
    this.price = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image(
            image: NetworkImage('https://picsum.photos/200/?random=$rndSeed'),
          ),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Rp. $price",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}