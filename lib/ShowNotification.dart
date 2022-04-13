import 'package:flutter/material.dart';

class ShowNotification extends StatelessWidget {
  final id;
  const ShowNotification({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification "), backgroundColor: Colors.red),
      body: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text('Here Is A Notification For You!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              Text(
                id,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
