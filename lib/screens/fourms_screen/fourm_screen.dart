import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/forum_model.dart';
import 'package:la_vie/screens/fourms_screen/add_post_screen/add_post_screen.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/utils/size_extention.dart';

import '../../shared/components/styles/colors.dart';
import '../../shared/cubit/cubit.dart';

class ForumsScreen extends StatefulWidget {
  const ForumsScreen({Key? key}) : super(key: key);

  @override
  State<ForumsScreen> createState() => _ForumsScreenState();
}

class _ForumsScreenState extends State<ForumsScreen> {
int index = 0 ;
  @override
  void initState() {
    AppCubit.get(context).getForums(index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){},
      builder: (context , state) {
        var cubit = AppCubit.get(context).forumModel;
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(onPressed: (){
            navigateTo(context, AddPostScreen());
          }, child: Icon(
            Icons.add,
          ),
            backgroundColor: defaultColor,
          ),
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            title: Text('Discussion Forums',
              style: TextStyle(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          body: Padding(
            padding:  EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: const Color(0xffF8F8F8),
                          height: 46.rh,
                          child: TextField(
                            onTap: (){

                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              hintText: 'Search',
                              hintStyle: const TextStyle(
                                color: Color(0xff979797),
                              ),
                              prefixStyle: const TextStyle(
                                color: Color(0xff979797),
                              ),
                              prefixIconConstraints:
                              BoxConstraints(minHeight: 17.rh, minWidth: 17.rh),
                              prefixIcon: Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 16.0.rSp),
                                child: Image(
                                  width: 17.rSp,
                                  height: 17.rSp,
                                  image: const AssetImage('assets/images/Search.png'),
                                ),
                              ),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: defaultColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.rh,),
                Row(
                  children: [
                    Container(
                      width: 112.rSp,
                      height: 26.rSp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.rSp),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'All forums',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff979797),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.rw,),
                    Container(
                      width: 112.rSp,
                      height: 26.rSp,
                      decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.circular(5.rSp),
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'My forums',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 22.rh,),
                Expanded(
                  child: (cubit!.data![index].forumComments != null)  ? ListView.separated(
                    separatorBuilder: (context , index) => SizedBox(height: 20.rh,),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context , index) => buildPostItem(cubit.data![index]),
                    itemCount: cubit.data!.length,
                  ) : Center(child: CircularProgressIndicator(),),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildPostItem(ForumData model) => Column(
    children: [
      Container(
        width: 380.rSp,
        height: 314.rSp,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(20.0.rSp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.rSp,
                        backgroundImage: NetworkImage('${AppCubit.get(context).profileModel!.data.imageUrl}',),
                        backgroundColor: defaultColor,
                      ),
                      SizedBox(width: 12.rw,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${AppCubit.get(context).profileModel!.data.firstName} ${AppCubit.get(context).profileModel!.data.lastName}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          SizedBox(height: 5.rh,),
                          Text('A month ago',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff979797).withOpacity(0.84),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.rh,),
                  Text('${model.title}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      color: defaultColor,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('${model.description}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      fontFamily: 'Roboto',
                      color: Color(0xff8F8D8D),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Flexible(
                    child: model.imageUrl != ''  ? Image.network('https://lavie.orangedigitalcenteregypt.com${model.imageUrl}',
                    width: double.infinity  ,
                    fit: BoxFit.cover,) : Image.network('https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1623959191-medium-plant-dieffenbachia-white-pot_2048x.jpg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding:  EdgeInsets.symmetric(vertical: 5.0.rh),
        child: Row(
          children: [
            Icon(Icons.thumb_up_alt_outlined,
              size: 20,
              color: Color(0xff666565),
            ),
            SizedBox(width: 5.rw,),
            Text('${model.forumLikes!.length} Likes',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(width: 40.rw,),
            Text(' ${model.forumComments!.length} replies',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(.6),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
