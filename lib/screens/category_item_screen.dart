import '../models/details.dart';

import '../widgets/detail_item.dart';
import 'package:flutter/material.dart';

class CategoryItemScreen extends StatelessWidget {
  //final String categoryId;
  //final String categoryTitle;

  //CategoryItemScreen(this.categoryId,this.categoryTitle);
  static const routeName='/category-item-creen';
  
  final List<Details> availableDetails;
   CategoryItemScreen(this.availableDetails);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryDetails = availableDetails.where((details) {
      return details.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return DetailItem(
            id: categoryDetails[index].id,
            title: categoryDetails[index].title,
            imageUrl: categoryDetails[index].imageUrl,
            duration: categoryDetails[index].duration,
            affordability: categoryDetails[index].affordability,
            complexity: categoryDetails[index].complexity,
          );
        },
        itemCount: categoryDetails.length,
      ),
    );
  }
}
