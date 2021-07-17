import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:test1/modules/done_tasks/Done_tasks_screen.dart';
import 'package:test1/modules/new_tasks/new_tasks_screen.dart';
import 'package:test1/shared/cubit/states.dart';
// important note -> i am not using catch error because iam in local app not global

class AppCubit extends Cubit<AppStates> {

  AppCubit() :super (AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // i make it to listen to all app
  int currentIndex = 0;
  List<Widget> screens = [
    // i made this to toggle between three or more screens
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen()
  ];
  List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];
   Database database;
   List<Map>  newTasks=[];
  List<Map>  doneTasks=[];
  List<Map>  archivedTasks=[];

  void changeIndex(index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatabase()
  {
     openDatabase('todo.db', version: 1,
        onCreate: (database, version) { // called once only .......
          print('database is created');
          database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY,time TEXT,title TEXT,date TEXT,status TEXT )')
              .then((value) // i made this to create table
          {
            print('table created');
          }).catchError((error) {
            print('error when creating table ${error.toString()}');
          });
        },
        onOpen: (database) {
          print('database is opened');
        }).then((value)
     {
       database=value;
       emit(AppCreateDatabaseState());
     });
  }

   insertToDatabase
      ({
     @required String time,
    @required String title,
    @required String date,
  })
  async
  {
    await database.transaction((txn)
    //txn to take object from transaction
    // transaction: to make operation
    {
      txn.rawInsert(
          'INSERT INTO tasks(time,title,date,status) VALUES ("$time","$title","$date","new")')
          .then((value) {
        print(
            '$value inserted successfully'); // the first value from transaction
        emit(AppInsertToDatabaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print('error when inserting new record ${error.toString()}');
      });
      return null;
    });
  }
  // Delete some record
  void deleteData(
      {@required int id})
  {
     database..rawDelete('DELETE FROM tasks WHERE id = ?', [id]
   ).then((value) {
     getDataFromDatabase(database);
     emit(AppDeleteDatabaseLoadingState());
     });

  }
  // Update some record
  void updateData(
      {@required String status,
        @required int id})
  {
    database.rawUpdate(
        'UPDATE tasks SET status = ?  WHERE id = ?',
        ['$status', id ]
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseLoadingState());
    });

  }

 void getDataFromDatabase(database)   // data get at list
      {
        newTasks =[];
        doneTasks=[];
        archivedTasks=[];
        emit(AppGetDatabaseLoadingState());
     database.rawQuery(' SELECT * FROM tasks ').then((value) {
      value.forEach((element) {
        if(element['status'] == 'new')
          newTasks.add(element);
        else if(element['status'] == 'done')
          doneTasks.add(element);
       else
          archivedTasks.add(element);
      });
      emit(AppGetDataFromDatabaseState());

    });

    //     .then((value) {
    //   print(value);
    // }).catchError((error){
    //   print('$error')
    // });
  }
  bool isBottomSheetShown= false;
  IconData fabIcon= Icons.edit;
  void changeBottomSheetState({
  @required bool isShow,
    @required IconData icon
}){
    isBottomSheetShown=isShow;
    fabIcon=icon;
    emit(AppChangeBottomSheetState());
  }
}


