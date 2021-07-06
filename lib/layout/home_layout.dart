import 'package:flutter/material.dart';
import 'package:test1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:test1/modules/done_tasks/Done_tasks_screen.dart';
import 'package:test1/modules/new_tasks/new_tasks_screen.dart';
class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=0;
  List<Widget> screens =[ // i made this to toggle between three or more screens
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen()
  ];
  List <String> titles =[
    'New Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () //async  // async=> operate in background
        {
          // try
          // {
          //   var name= await getName(); //
          //   //  await=> await until the operation finishing and return the data from background
          //   print(name);
          //   throw('some error !!!!!!!'); // i made error by me
          // }
          // catch(error) // take parameter called anything I named him 'error'
          // {
          //    print('error ${error.toString()}');
          // }
          getName().then((value) // every thing called 'Future' available 'then'
          /* then make every thing that try and catch do
          it make async form the background and await the data to return
          */
          {
            print(value);
            print('eyad');
            // throw('i made this error!!!');
          }).catchError((error){
            print('error is ${error.toString()}');
          });

        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //to fix my bottomNavigationBar in all pages
        currentIndex: currentIndex, // to mark on the index you define
        onTap: (index){
          // tacked index you press on it
          setState(() { // make rebuild
            currentIndex=index;
            /* example: i tab on the 1 index (Done) then index =1 after this
             it made the current index = index
             finally 'setState' make rebuild to this page the it made the current_index = current_index
            */
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline),label: 'Done'),
          BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),label: 'Archived'),
        ],
      ),
      body: screens[currentIndex],
    /* important note: if you want to toggle between two screen make (true or false)
       if you want to toggle between three screen make (List)
     */
    );
  }
  //Instance of 'Future<String>'
  Future<String> getName() async
  {
   return 'yosef eyad';
  }
}
