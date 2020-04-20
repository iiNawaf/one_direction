import 'package:flutter/material.dart';
import 'package:project/providers/suggestions_provider.dart';
import 'package:provider/provider.dart';

class AllSuggestions extends StatefulWidget {
  @override
  _AllSuggestionsState createState() => _AllSuggestionsState();
}

class _AllSuggestionsState extends State<AllSuggestions> {
  bool isLoading = false;
  bool isInit = true;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (isInit) {
      isInit = false;
      try {
        setState(() {
          isLoading = true;
        });
        await Provider.of<SuggestionsProvider>(context, listen: false).load();
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final suggestionsList = Provider.of<SuggestionsProvider>(context).suggestionsList;

    return isLoading
        ? Center(child: CircularProgressIndicator())
        : suggestionsList.isEmpty
            ? Center(child: Text("لا توجد إقتراحات"))
            : ListView.builder(
                itemCount: suggestionsList.length,
                itemBuilder: (ctx, index) => Card(
                  child: ListTile(
                      leading: Text("#${suggestionsList[index].id}"),
                      title: Text('${suggestionsList[index].title}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${suggestionsList[index].description}'),
                          Text('البريد الإلكتروني: ${suggestionsList[index].email}'),
                        ],
                      )),
                ),
              );
  }
}
