import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/components/styles/colors.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/utils/size_extention.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , index){},
      builder: (context , index){
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black,),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text('Create New Post',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 21,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          body: ListView(
            children: [
              SafeArea(
                child: Padding(
                  padding:  EdgeInsets.all(30.0.rSp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: GestureDetector(
                          child: Container(
                            width: 136.rSp,
                            height: 136.rSp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.rSp),
                              border: Border.all(
                                width: 1,
                                color: defaultColor,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add,
                                  color: defaultColor,
                                ),
                                SizedBox(height: 15.rh,),
                                Text('Add Photo',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: defaultColor
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: (){
                            cubit.getImage();
                          },
                        ),
                      ),
                      SizedBox(height: 13.rh,),
                      Text('Title',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: Color(0xff6F6F6F),
                        ),
                      ),
                      SizedBox(height: 5.rh,),
                      Container(
                        height: 46.rSp,
                        child: TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: defaultColor,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 1.rSp,
                                color: Color(0xff939393),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.rh,),
                      Text('Description',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: Color(0xff6F6F6F),
                        ),
                      ),
                      SizedBox(height: 5.rh,),
                      Container(
                        margin: EdgeInsets.zero,
                        height: 130,
                        child: TextField(
                          controller: descriptionController,
                          maxLines: 9999, // to make text field able to take size https://stackoverflow.com/questions/55781224/how-to-create-a-full-screen-textfield-in-flutter
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: defaultColor,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 1.rSp,
                                color: Color(0xff939393),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 33.rh,),
                      Container(
                        height: 54.rh,
                        child: TextButton(

                          onPressed: (){
                            cubit.createPost(
                                title: titleController.text,
                                description: descriptionController.text,
                              postImage: 'data:image/jpeg;base64,${AppCubit.get(context).postImage}',

                                );
                          },
                          child: Text('Post',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(

                            backgroundColor: MaterialStateProperty.all(defaultColor,), //https://stackoverflow.com/questions/50083390/create-a-button-with-rounded-border
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.white)
                              ),
                            ),

                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
