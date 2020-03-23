import 'package:flutter/material.dart';
import 'package:project/models/discounted_product_model.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:project/widgets/search/search_result.dart';
import 'package:provider/provider.dart';

class OffersSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<DiscountedProduct> listResult = Provider.of<DiscountProvider>(context).discountedProductsList;
    final List<DiscountedProduct> searchResult = listResult.where((element) => element.productName.toLowerCase().contains(query.toLowerCase())).toList();
    return query.isEmpty
        ? Container()
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 13 / 20,
              crossAxisCount: 2,
            ),
            itemCount: searchResult.length,
            itemBuilder: (BuildContext context, int index) {
              return SearchResult(searchItem: searchResult[index]);
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
