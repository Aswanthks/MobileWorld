import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomnode/screens/favourite_page.dart';
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
          unselectedItemColor:Colors.black,
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
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Mobile",
              style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
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




                SizedBox(width: 10),
                IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              ],
            ),
          ),

          SizedBox(height: 15),





          SizedBox(height: 200,child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16/9,
              viewportFraction: 0.8,
            ),
            items: [
              'https://via.placeholder.com/600x300?text=Banner+1',
              'https://via.placeholder.com/600x300?text=Banner+2',
              'https://via.placeholder.com/600x300?text=Banner+3',
            ].map((item) => Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(item),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            )).toList(),
          ),),

          SizedBox(height: 15),



          TabBar(
            isScrollable: false,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Smart watch'),
              Tab(text: 'Apple'),
              Tab(text: 'Samsung'),
              Tab(text: 'Other'),
            ],
          ),




          Expanded(
            child: TabBarView(
              children: [
                Consumer<ProductViewModel>(
                  builder: (context, value, child) {
                    if (value.loading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List<ProductModel> mobiles = value.products;
                    return GridView.builder(
                      padding: const EdgeInsets.all(15.0),
                      itemCount: mobiles.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                        childAspectRatio: .5,
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
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                                    child: SizedBox(height:140,width:140,
                                      child: Image.network(
                                        item.image ?? "",
                                        fit: BoxFit.cover,
                                        height: 150, // Fixed height to manage overflow
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 2,
                                    right: 8,
                                    child: IconButton(
                                      onPressed: () {
                                        final favoriteViewModel = Provider.of<FavoriteViewModel>(context, listen: false);
                                        favoriteViewModel.addToFavorites(item);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Item added to favorites!'),
                                          ),
                                        );
                                        // Implement favorite functionality here
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
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
                                    Row(
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
                                    SizedBox(height: 5),
                                    Text(
                                      item.price .toString()?? "",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Implement your Buy Now functionality here
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 24),
                                            backgroundColor: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                            'Buy Now',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2), // Space between buttons
                                        ElevatedButton(
                                          onPressed: () {
                                            print('Adding item to cart: ');

                                            final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
                                            cartViewModel.addProductToCart(
                                                userid:
                                                Authserrvices.userId.toString(), // Replace with actual user ID
                                                product: item,
                                                context: context, );
                                                 ScaffoldMessenger.of(context).showSnackBar(
                                                   SnackBar(
                                                     content: Text('Item added to cart!'),
                                                   ),
                                                 );
                                            // Implement Add to Cart functionality here
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
                Center(child: Text('Apple content here')),
                Center(child: Text('Samsung content here')),
                Center(child: Text('Other content here')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
