import 'package:flutter/material.dart';

class Category {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });
}

class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('gambar/home.png'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Expanded(
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: viewportConstraints.maxWidth,
                          child: const Image(
                              image: NetworkImage(
                                  'https://cdn.dribbble.com/users/3499911/screenshots/19477140/media/5d958932f59de52a8669ec989946e58e.jpg?resize=1000x750&vertical=center')),
                        ),
                      ),
                      const ListProducts(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: viewportConstraints.maxWidth,
                          child: const Image(
                              image: NetworkImage(
                                  'https://cdn.dribbble.com/userupload/13705871/file/original-6f0455ba36837f327967d4569df6e8cd.jpg?resize=400x554')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        id: 1,
        name: 'EIEM Beauty Water Bank Moisturizer',
        price: 20000,
        imageUrl: 'https://images.tokopedia.net/img/cache/700/OJWluG/2023/12/27/b814ca38-78b5-438a-bfe2-5bab0885e83b.jpg',
      ),
      Product(
        id: 2,
        name: 'EIEM Beauty Brightening Serum',
        price: 200000,
        imageUrl: 'https://images.tokopedia.net/img/cache/700/OJWluG/2023/8/4/79dac06e-c3b8-47bb-aaf0-04e14a69fa79.jpg',
      ),
      Product(
        id: 3,
        name: 'EIEM Beauty Calm Soothing Toner',
        price: 300000,
        imageUrl: 'https://static.desty.app/desty-omni/20230812/70d249f14c194d6c99d56f4fe39ea543.JPG',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: products.map((product) {
            return ProductImage(
              product: product,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final Product product;

  const ProductImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image.network(
            product.imageUrl,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name),
              Text("Rp. ${product.price.toString()}"),
            ],
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      home: const Dashboard(),
    );
  }
}