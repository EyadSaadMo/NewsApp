import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String image;
  final String name;
  final String message;
  final String time;
  UserModel(@required this.image,@required this.name,@required this.message,@required this.time);
}

class MessageScreen extends StatelessWidget {
  List<UserModel> userInput = [
   UserModel('https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
    'Eayd Saad', 'I love yosef ', '02:22 pm'),
   UserModel('https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
    'Eayd Saad', 'I love yosef ', '02:22 pm'),
   UserModel('https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
    'Eayd Saad', 'I love yosef ', '02:22 pm'),
   UserModel('https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
    'Eayd Saad', 'I love yosef ', '02:22 pm'),
   UserModel('https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
    'Eayd Saad', 'I love yosef ', '02:22 pm'),
   UserModel('https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
    'Eayd Saad', 'I love yosef ', '02:22 pm'),
   UserModel('https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
    'Eayd Saad', 'I love yosef ', '02:22 pm'),
  ];
  item(String img, String txt1) {
    return Row(
      children: [
        Container(
          width: 74,
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 37.0,
                    backgroundImage: NetworkImage(img),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                txt1,
                style: TextStyle(fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        )
      ],
    );
  }

  item2(UserModel user) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 37.0,
                  backgroundImage: NetworkImage(user.image),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(bottom: 3.0, end: 3.0),
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        user.message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(user.time),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

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
