import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../users/model_class.dart';

class MessageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      
        titleSpacing: 20,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'chats',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    size: 16.0,
                    color: Colors.white,
                  ),
                  onPressed: () {})),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 16.0,
                    color: Colors.white,
                  ),
                  onPressed: () {}))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15,
                    ),
                    Text('search'),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 120,
                child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    return item(
                        'https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
                        'Eyad');
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (ctx, index) => SizedBox(
                    width: 20,
                  ),
                ),
              ),
              ListView.separated(
                itemBuilder: (ctx, index) => item2(userInput[index]),
                separatorBuilder: (ctx, index) => SizedBox(
                  height: 15,
                ),
                itemCount: userInput.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
