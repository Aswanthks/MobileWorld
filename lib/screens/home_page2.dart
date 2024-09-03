import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../model/product_model.dart';
import '../viewmodel/favourite_view_model.dart';
import '../viewmodel/product_view_model.dart';
import 'product_details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductViewModel>(context, listen: false).fetchProducts();
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "M", // The starting character 'M'
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.red, // Color for 'M'
                ),
              ),
              TextSpan(
                text: "obile", // The rest of the word before 'W'
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white, // Color for the rest
                ),
              ),
              TextSpan(
                text: "W", // The starting character 'W'
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.red, // Color for 'W'
                ),
              ),
              TextSpan(
                text: "orld", // The rest of the word after 'W'
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white, // Color for the rest
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {
              // Implement search functionality here if needed
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: TextField(
              onChanged: (query) => _updateSearchQuery(query),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Icon(Icons.search_sharp),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 175,
                      aspectRatio: 16/9,
                      viewportFraction: .949,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      scrollDirection: Axis.horizontal,
                    ),
                    items: [
                      'assets/image/mobile-offers.jpg',
                      'assets/image/6183700150082456585.jpg',
                      'assets/image/6183700150082456584.jpg',
                    ].map((item) => Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )).toList(),
                  ),
                  SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4),
                    child: Container(height: 50,color:Color(0xFFF1E8E6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Cash on Delivery
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,

                                child: Icon(Icons.money,color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Cash on\nDelivery",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // Divider
                          VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          // Free Delivery Free Returns
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.red,

                                child: Icon(Icons.local_shipping,  color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Free Delivery\nFree Returns",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // Divider
                          VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                          ),
                          // Lowest Price
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.yellow,

                                child: Icon(Icons.local_offer, color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Lowest\nPrice",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
    SizedBox(height: 15,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/image/img.png',
                            height: 50,
                          ),
                          SizedBox(height: 5),
                          Text("Mobiles"),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/image/deals.png',
                            height: 50,
                          ),
                          SizedBox(height: 5),
                          Text("Deals"),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/image/offers.png',
                            height: 50,
                          ),
                          SizedBox(height: 5),
                          Text("Offers"),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/image/image-removebg-preview (1).png',
                            height: 50,
                          ),
                          SizedBox(height: 5),
                          Text("New arrivals"),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/image/morejpeg.jpeg',
                            height: 50,
                          ),
                          SizedBox(height: 5),
                          Text("More"),
                        ],
                      ),
                    ],
                  ),SizedBox(height: 11,),




    Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12),
                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [Text("Popular",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),Text("View All",style: TextStyle(color: Colors.blue),)],),
                  ),
                  Consumer<ProductViewModel>(
                    builder: (context, value, child) {
                      if (value.loading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List<ProductModel> mobiles = value.products.where((product) =>
                      product.name?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false
                      ).toList();
                      return GridView.builder(
                        shrinkWrap: true, // Allows GridView to occupy only the space needed
                        physics: NeverScrollableScrollPhysics(), // Prevents GridView from scrolling
                        padding: const EdgeInsets.all(15.0),
                        itemCount: mobiles.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: .80,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final item = mobiles[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: .3,
                                  blurRadius: 0,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4.0, left: 8, right: 8),
                                        child: SizedBox(
                                          height: 130,
                                          width: 130,
                                          child: Image.network(
                                            item.image ?? "",
                                            fit: BoxFit.cover,
                                            height: 130, // Fixed height to manage overflow
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 2,
                                      right: 2,
                                      child: IconButton(
                                        onPressed: () {
                                          final favoriteViewModel = Provider.of<FavoriteViewModel>(context, listen: false);
                                          if (favoriteViewModel.isFavorite(item)) {
                                            favoriteViewModel.removeFromFavorites(item);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Item removed from favorites!'),
                                              ),
                                            );
                                          } else {
                                            favoriteViewModel.addToFavorites(item);
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Item added to favorites!'),
                                              ),
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.favorite_sharp,
                                          color: Provider.of<FavoriteViewModel>(context).isFavorite(item) ? Colors.red : Colors.grey,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0,left: 13),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ProductDetailsScreen(item: item),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          item.name ?? "",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "From ₹${item.price ?? ''}",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
