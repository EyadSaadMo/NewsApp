import 'package:flutter/material.dart';

class FirstTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FirstApp'),
        actions: [Icon(Icons.notifications), Icon(Icons.mediation)],
        leading: Icon(Icons.menu),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(
                width: 200,
                height: 200,
                image: NetworkImage(
                    'https://th.bing.com/th/id/OIP.PuPWrQGLcGccVqXE4PHsWAHaEo?pid=ImgDet&rs=1'),
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.4),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Text(
                  'hellow',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20,color: Colors.white),)),
            ],
          ),
        ),
      ),
    );
  }
}
