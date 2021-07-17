import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:test1/shared/cubit/cubit.dart';

Widget defaultButtons({
  double width = double.infinity,
  // set as default to reuse in all app
  Color background = Colors.blue,
  @required Function function,
  bool isUppercase = true,
  double raduis = 0.0,
  @required String text,
}) =>
    Container(
        width: width,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(raduis),
        ),
        child: MaterialButton(
          onPressed: function,
          child: Text(
            isUppercase ? text.toUpperCase() : text,
            style: TextStyle(color: Colors.white),
          ),
        ));

Widget defaultformfield({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onfieldSubmit,
  Function onChange,
  @required Function validate,
  @required String lable,
  @required IconData prefix,
  Function onTap,
  IconData suffix,
  bool isClickable = true,
  bool isPassword = false,
  Function suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onfieldSubmit, // when i press on the correct button
      onChanged: onChange, //when iam writing
      validator: validate,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
      ),
    );
Widget buildTaskItem(Map model, context) => Dismissible
// to swipe item right and left
  (
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(model['time']),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,

                /*

                The height of the Column is determined by the mainAxisSize property.

                 If the mainAxisSize property is MainAxisSize.max,

                 then the height of the Column is the max height of the incoming constraints.

                 If the mainAxisSize property is MainAxisSize.min,

                  then the height of the Column is the sum of heights of the children (subject to the incoming constraints).

                 */

                children: [
                  Text(
                    model['title'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Text(
                    model['date'],
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
                icon: Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'done', id: model['id']);
                }),
            IconButton(
                icon: Icon(
                  Icons.archive,
                  color: Colors.black45,
                ),
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'archived', id: model['id']);
                }),
          ],
        ),
      ),
         onDismissed: (direction){
        AppCubit.get(context).deleteData(id: model['id']);
         },
    );

Widget taskBuilder({@required List<Map> tasks})
{
  return ConditionalBuilder(
    condition: tasks.length > 0,
    builder: (context) => ListView.separated(
        itemBuilder: (context, index) =>
            buildTaskItem(tasks[index], context),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: tasks.length),
    fallback: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            color: Colors.grey,
            size: 100.0,
          ),
          Text(
            'No Tasks Yet , please add some tasks',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}
