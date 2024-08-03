// import 'dart:io';
//
// import 'package:ecomnode/admin/textfiled.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
//
//
// import '../../model/product_model.dart';
// import '../../utils/constants.dart';
//
// import 'homeviewmodel.dart';
//
// class AdminScreen extends StatefulWidget {
//   const AdminScreen({super.key});
//
//   @override
//   State<AdminScreen> createState() => _AdminScreenState();
// }
//
// class _AdminScreenState extends State<AdminScreen> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();
//
//
//   XFile? image;
//
//   final ImagePicker picker = ImagePicker();
//
//   String type = '';
//
//   void _getFromCamera() async {
//     final pickedImage = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
//     if (pickedImage != null) {
//       setState(() {
//         image = pickedImage;
//       });
//     }
//   }
//
//   void _getFromGallery() async {
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
//     if (pickedImage != null) {
//       setState(() {
//         image = pickedImage;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = context.watch<HomeViewModel>();
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight, colors: [],
//             ),
//           ),
//         ),
//         title: Row(
//           children: [
//             SizedBox(width: 130),
//             Text(
//               'Add items',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 30,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 30),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: OutlinedButton(
//                               style: OutlinedButton.styleFrom(
//                                 fixedSize: const Size(150, 50),
//                               ),
//                               onPressed: () {
//                                 showModalBottomSheet(
//                                   backgroundColor: Colors.transparent,
//                                   context: context,
//                                   builder: (context) => Container(
//                                     width: MediaQuery.of(context).size.width,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(20.0),
//                                       child: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           OutlinedButton(
//                                             style: OutlinedButton.styleFrom(
//                                               backgroundColor: Colors.white,
//                                               fixedSize: Size(MediaQuery.of(context).size.width, 50),
//                                             ),
//                                             onPressed: () {
//                                               _getFromCamera();
//                                               Navigator.pop(context);
//                                             },
//                                             child: const Row(
//                                               mainAxisAlignment: MainAxisAlignment.center,
//                                               children: [
//                                                 Icon(Icons.camera_alt_outlined),
//                                                 Text("Take a photo")
//                                               ],
//                                             ),
//                                           ),
//                                           const SizedBox(height: 5),
//                                           OutlinedButton(
//                                             style: OutlinedButton.styleFrom(
//                                               backgroundColor: Colors.white,
//                                               fixedSize: Size(MediaQuery.of(context).size.width, 50),
//                                             ),
//                                             onPressed: () {
//                                               _getFromGallery();
//                                               Navigator.pop(context);
//                                             },
//                                             child: const Row(
//                                               mainAxisAlignment: MainAxisAlignment.center,
//                                               children: [
//                                                 Icon(CupertinoIcons.photo_on_rectangle),
//                                                 Text("Upload from gallery")
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: const Text("Add photo"),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           IconButton(
//                             onPressed: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (context) => AlertDialog(
//                                   title: image == null
//                                       ? const Text("Upload image")
//                                       : Image.file(File(image!.path)),
//                                 ),
//                               );
//                             },
//                             icon: const Icon(
//                               CupertinoIcons.eye,
//                               size: 30,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 40),
//                       CustomTextField(name: 'name', controller: _nameController),
//                       const SizedBox(height: 20),
//                       CustomTextField(name: 'price', controller: _priceController),
//                       const SizedBox(height: 20),
//
//                       const SizedBox(height: 30),
//
//                       const SizedBox(height: 30),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if (image == null) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text('Please select an image')),
//                               );
//                               return;
//                             }
//
//                             final price = int.tryParse(_priceController.text) ?? 0;
//
//
//                             Productmodel newProduct = Productmodel(
//                               name: _nameController.text,
//
//
//                               price: price.toString(), sId: '',
//
//                             );
//                             provider.addProduct(
//                               product: newProduct,
//                               imageFile: File(image!.path),
//                               context: context,
//                             );
//                           },
//                           child: Text('Submit'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
