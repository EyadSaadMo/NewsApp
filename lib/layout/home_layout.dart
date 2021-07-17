import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:test1/modules/done_tasks/Done_tasks_screen.dart';
import 'package:test1/modules/new_tasks/new_tasks_screen.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/components/constants.dart';
import 'package:test1/shared/cubit/cubit.dart';
import 'package:test1/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget
  /* 1- create database
     2- create table
     3- open database and take object from it
     4- insert to database
     5- grt from database
     6- update database
     7- delete database
   */
{

  var scaffoldKey= GlobalKey<ScaffoldState>();  // i made this to reuse in all abb
  var formKey= GlobalKey<FormState>();

  var titleController= TextEditingController();
  var timeController= TextEditingController();
  var dateController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      //i create bloc to move above it to يشتغل
      // أنا المفروض استدعي ال create database بدل ال appcubit بس دي حاجه جواها فلازم اعمل .. دي معناها اني سيفت ال appcubit قي variable
      child: BlocConsumer<AppCubit,AppStates>
        (
        // عشان يعرف هو هيشتغل على انهي بلوك وهي listen على انهي state
        listener: (context,AppStates state){
          if(state is AppInsertToDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (context,AppStates state)
        // it rebuild the screen
        {
          AppCubit cubit= AppCubit.get(context);
          // AppCubit.get(context)AppCubit.get(context) دي معناها اني بكريت اوبجكت مني
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton
              (
              onPressed: () //async  // async=> operate in background
              {
                if( cubit.isBottomSheetShown)
                {
                  if(formKey.currentState.validate()){
                    cubit.insertToDatabase
                      (
                      time: timeController.text,
                      title: titleController.text,
                      date: dateController.text,
                    );
                  }
                }

                else {
                  scaffoldKey.currentState.showBottomSheet((context) =>
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultformfield(
                                  controller: titleController,
                                  type: TextInputType.text,
                                  validate: (String value){
                                    if(value.isEmpty){
                                      return 'required';
                                    }
                                    else
                                    {
                                      return null;
                                    }
                                  },
                                  lable: 'Task title',
                                  prefix: Icons.edit
                              ),
                              SizedBox(height: 15.0,),
                              defaultformfield(
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  onTap: (){
                                    showTimePicker(context: context, initialTime: TimeOfDay.now()) // to get time now
                                        .then((value) {
                                      timeController.text= value.format(context).toString();
                                      print(value.format(context)); //format to print the time in good case
                                    });
                                  },
                                  validate: (String value){
                                    if(value.isEmpty){
                                      return 'time required';
                                    }
                                    else
                                    {
                                      return null;
                                    }
                                  },
                                  lable: 'Task time',
                                  prefix: Icons.watch_later_outlined
                              ),
                              SizedBox(height: 15.0,),
                              defaultformfield(
                                controller: dateController,
                                type: TextInputType.datetime,
                                onTap: (){
                                  showDatePicker(context: context,
                                    initialDate: DateTime.now(), //to get the date of today
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2021-12-30'),
                                  ).then((value) {
                                    // to take the value from it
                                    //it made bad format!
                                    // we use a package called 'intl' to better the format
                                    dateController.text= DateFormat.yMMMd().format(value);
                                  });
                                },
                                validate: (String value){
                                  if(value.isEmpty){
                                    return 'date required';
                                  }
                                  else
                                  {
                                    return null;
                                  }
                                },
                                lable: 'Task date',
                                prefix: Icons.calendar_today,
                              ),
                            ],

                          ),
                        ),

                      ),
                    elevation: 20.0,
                  ).closed.then((value) { // when i closed the bottom sheet
                    
                    cubit.changeBottomSheetState(isShow: false, icon: Icons.edit);
                    // اللي تحته هوه هواه
                    // isBottomSheetShown=false;
                    // setState(() {
                    //   fabIcon= Icons.edit;
                    // });
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                  // isBottomSheetShown=true;
                  // setState(() {
                  //   fabIcon= Icons.add;
                  // });

                }
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
                // getName().then((value) // every thing called 'Future' available 'then'
                /* then make every thing that try and catch do
              it make async form the background and await the data to return
              */
                //     {
                //   print(value);
                //   print('eyad');
                //   // throw('i made this error!!!');
                // }).catchError((error) {
                //   print('error is ${error.toString()}');
                // });
              },
              child: Icon( cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType
                  .fixed, //to fix my bottomNavigationBar in all pages
              currentIndex:cubit.currentIndex, // to mark on the index you define
              onTap: (index) {
                cubit.changeIndex(index);
                // tacked index you press on it
                // setState(() {
                //           //   // make rebuild
                //           //   currentIndex = index;
                //           //   /* example: i tab on the 1 index (Done) then index =1 after this
                //           //    it made the current index = index
                //           //    finally 'setState' make rebuild to this page the it made the current_index = current_index
                //           //   */
                //           // });
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archived'),
              ],
            ),
            // body:tasks.length==0? Center(child: CircularProgressIndicator()): screens[currentIndex],
            // to improve condition we use package ConditionalBuilder
            body: ConditionalBuilder(
              builder: (context) => cubit.screens[cubit.currentIndex],
              condition: state is! AppGetDatabaseLoadingState,
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            /* important note: if you want to toggle between two screen make (true or false)
           if you want to toggle between three screen make (List)
         */
          );
        }


      ),
    );
  }
}




