import 'package:flutter/material.dart';
import 'package:project/providers/suggestions_provider.dart';
import 'package:provider/provider.dart';

class SubmitSuggestion extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;

  SubmitSuggestion({
    @required this.descriptionController,
    @required this.titleController,
    @required this.emailController,
    @required this.formKey,
  });
  @override
  _SubmitSuggestionState createState() => _SubmitSuggestionState();
}

class _SubmitSuggestionState extends State<SubmitSuggestion> {
  bool isLoading = false;

  void _submit() async {
    if (widget.formKey.currentState.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        await Provider.of<SuggestionsProvider>(context, listen: false).addNewSuggestion(
          widget.emailController.text,
          widget.titleController.text,
          widget.descriptionController.text,
        );
        widget.emailController.clear();
        widget.titleController.clear();
        widget.descriptionController.clear();
        setState(() {
          isLoading = false;
        });
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.thumb_up,
                    color: Colors.green,
                    size: 40,
                  ),
                  SizedBox(height: 20),
                  Text("شكراً على إقتراحك!"),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("إغلاق"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      } catch (e) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : InkWell(
            child: Container(
              height: 50,
              color: Colors.blue[200],
              child: Center(
                child: Text('إرسال', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            onTap: _submit,
          );
  }
}
