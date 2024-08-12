import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomnode/screens/favourite_page.dart';
import 'package:ecomnode/screens/product_details_screen.dart';
import 'package:ecomnode/services/auth_service.dart';
import 'package:ecomnode/viewmodel/product_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../admin/admhome.dart';
import '../model/product_model.dart';
import '../utils/mobile.dart';
import '../viewmodel/cart_view_model.dart';
import '../viewmodel/favourite_view_model.dart';
import '../widgets/cart_widget.dart';
import '../widgets/smartwatchwidget.dart';
import '../widgets/view_profile_widget.dart';

List<Map<String, dynamic>> cartItems = [];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late PageController _pageController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Fetch products when the Home screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductViewModel>(context, listen: false).fetchProducts();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          buildHomePage(),
          CartScreen(),
          FavoritePage(),
          ViewProfile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: "My Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "WishList",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My Profile",
          ),
        ],
      ),
    );
  }

  Widget buildHomePage() {
    return Column(
      children: [
        Container(
          width: double.infinity, // Ensures the container takes up the full width of the screen
          color: Colors.blue, // Set the background color to blue
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Center( // Center the text horizontally
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "M", // The starting character 'M'
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.red, // Color for 'M'
                    ),
                  ),
                  TextSpan(
                    text: "obile", // The rest of the word before 'W'
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Color for the rest
                    ),
                  ),
                  TextSpan(
                    text: "W", // The starting character 'W'
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.red, // Color for 'W'
                    ),
                  ),
                  TextSpan(
                    text: "orld", // The rest of the word after 'W'
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Color for the rest
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: _updateSearchQuery,
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
              // SizedBox(width: 10),
              // IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            ],
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 200,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16/9,
              viewportFraction: 1.01,
            ),
            items: [
              'assets/image/6183700150082456586 (2).jpg',
              'assets/image/6183700150082456584.jpg',
              'assets/image/6183700150082456585.jpg',
            ].map((item) => Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(item),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            )).toList(),
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child: Consumer<ProductViewModel>(
            builder: (context, value, child) {
              if (value.loading) {
                return Center(child: CircularProgressIndicator());
              }
              List<ProductModel> mobiles = value.products.where((product) => product.name?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false)
                  .toList();
              return GridView.builder(
                padding: const EdgeInsets.all(15.0),
                itemCount: mobiles.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio: .59,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final item = mobiles[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
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
                                padding: const EdgeInsets.only(top: 8.0,left: 8,right: 8),
                                child: SizedBox(
                                  height: 130,
                                  width: 130,
                                  child: Image.network(
                                    item.image ?? "",
                                    fit: BoxFit.cover,
                                    height: 150, // Fixed height to manage overflow
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
                          padding: const EdgeInsets.only(top: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.name ?? "",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 1),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 8.0,right: 5),
                              //   child: Text(
                              //     item.description ?? "",
                              //     style: TextStyle(
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.normal,
                              //     ),
                              //     maxLines: 2,
                              //     overflow: TextOverflow.ellipsis,
                              //   ),
                              // ),
                              SizedBox(height: 1),
                              Text(
                                item.price.toString() ?? "",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: 1),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  SizedBox(height: 0), // Space between buttons
                                  ElevatedButton(
                                    onPressed: () {
                                      print('Adding item to cart: ');

                                      final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
                                      cartViewModel.addProductToCart(
                                        userid: Authserrvices.userId.toString(), // Replace with actual user ID
                                        product: item,
                                        context: context,
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Item added to cart!'),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 24),
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
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
        ),
      ],
    );
  }
}
