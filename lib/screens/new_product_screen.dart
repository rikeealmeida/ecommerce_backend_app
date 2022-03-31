import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_manager/models/product_model.dart';
import 'package:flutter_ecommerce_manager/services/database_service.dart';
import 'package:flutter_ecommerce_manager/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/controllers.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({Key key}) : super(key: key);

  final ProductController productController = Get.find();
  StorageService storage = StorageService();
  DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Adicionar produto"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.black,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            ImagePicker _picker = ImagePicker();

                            final XFile _image = await _picker.pickImage(
                                source: ImageSource.gallery);

                            if (_image == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Nenhuma Imagem Selecionada')));
                            }
                            if (_image != null) {
                              await storage.uploadImage(_image);
                              var imageUrl =
                                  await storage.getDownloadURL(_image.name);

                              productController.newProduct.update(
                                  'imageUrl', (value) => imageUrl,
                                  ifAbsent: () => imageUrl);
                              print(productController.newProduct['imageUrl']);
                            }
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Adicionar uma imagem',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Informações do produto",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                
                _buildTextFormField(
                  'Nome do produto',
                  'name',
                  productController,
                ),
                _buildTextFormField(
                  'Descrição do produto',
                  'description',
                  productController,
                ),
                _buildTextFormField(
                  'Categoria do produto',
                  'category',
                  productController,
                ),
                const SizedBox(height: 10),
                _buildSlider(
                  'Preço',
                  'price',
                  productController,
                  productController.price,
                ),
                _buildSlider(
                  'Qtd.',
                  'quantity',
                  productController,
                  productController.quantity,
                ),
                const SizedBox(height: 10),
                _buildCheckBox(
                  'Recomendado',
                  'isRecommended',
                  productController,
                  productController.isRecommended,
                ),
                _buildCheckBox(
                  'Popular',
                  'isPopular',
                  productController,
                  productController.isPopular,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      database.addProduct(
                        Product(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          name: productController.newProduct['name'],
                          category: productController.newProduct['category'],
                          description:
                              productController.newProduct['description'],
                          imageUrl: productController.newProduct['imageUrl'],
                          isRecommended:
                              productController.newProduct['isRecommended'],
                          isPopular: productController.newProduct['isPopular'],
                          price: productController.newProduct['price'],
                          quantity:
                              productController.newProduct['quantity'].toInt(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    child: const Text(
                      'Salvar',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Row _buildCheckBox(
    String title,
    String name,
    ProductController productController,
    bool controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Checkbox(
          value: (controllerValue == null) ? false : controllerValue,
          onChanged: (value) {
            productController.newProduct.update(
              name,
              (_) => value,
              ifAbsent: () => value,
            );
          },
          checkColor: Colors.black,
          activeColor: Colors.black12,
        ),
      ],
    );
  }

  Row _buildSlider(
    String title,
    String name,
    ProductController productController,
    double controllerValue,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            activeColor: Colors.black,
            inactiveColor: Colors.black12,
            value: (controllerValue == null) ? 0 : controllerValue,
            min: 0,
            max: 100,
            onChanged: (value) {
              productController.newProduct.update(
                name,
                (_) => value,
                ifAbsent: () => value,
              );
            },
          ),
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(
      String hintText, String name, ProductController productController) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (value) {
        productController.newProduct.update(
          name,
          (_) => value,
          ifAbsent: () => value,
        );
      },
    );
  }
}
