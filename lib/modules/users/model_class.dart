import 'package:flutter/material.dart';
import 'package:test1/models/user/user_model.dart';


List<UserModel> userInput = [
  UserModel(
      'https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
      'Eayd Saad',
      'I love yosef ',
      '02:22 pm'),
  UserModel(
      'https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
      'Eayd Saad',
      'I love yosef ',
      '02:22 pm'),
  UserModel(
      'https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
      'Eayd Saad',
      'I love yosef ',
      '02:22 pm'),
  UserModel(
      'https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
      'Eayd Saad',
      'I love yosef ',
      '02:22 pm'),
  UserModel(
      'https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
      'Eayd Saad',
      'I love yosef ',
      '02:22 pm'),
  UserModel(
      'https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
      'Eayd Saad',
      'I love yosef ',
      '02:22 pm'),
  UserModel(
      'https://cdn.dribbble.com/users/5423437/avatars/normal/open-uri20200601-28886-1ne6qdc?1591017055',
      'Eayd Saad',
      'I love yosef ',
      '02:22 pm'),
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
