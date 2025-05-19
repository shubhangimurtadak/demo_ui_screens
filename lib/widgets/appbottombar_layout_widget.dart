import 'package:flutter/material.dart';

class AppBottomBarLayoutWidget extends StatelessWidget {
  const AppBottomBarLayoutWidget({super.key ,required this.title, required this.body,required this.fixedButton});
  final String title;
  final Widget body;
  final Widget fixedButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Back',
                style: TextStyle(fontSize: 16, color: Colors.indigo),
              ),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.grey[300], height: 1),
        ),
      ),
      body: body,
       
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18),

        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: fixedButton,
      ),
    );
  }
}
