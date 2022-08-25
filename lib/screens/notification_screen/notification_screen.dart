import 'package:flutter/material.dart';
import 'package:la_vie/utils/size_extention.dart';

class NotficationScreen extends StatelessWidget {
  const NotficationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: () async {
      //todo
      return Future.value(false);
    },
    child: Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
    title: Text('Notification',
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    ),
    elevation: 0,
    leading: SizedBox(),//any one below or SizeBox()
    automaticallyImplyLeading: false,//any one below or SizeBox()
    ),
      body: ListView.separated(itemBuilder: (context , index) => buildNotificationItem(),
          separatorBuilder: (context , index) => Container(width: double.infinity, height: 1, color: Color(0xffE8EBF0),), itemCount: 10),
    ),
    );
  }
}

Widget buildNotificationItem() => Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage('https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg?w=360',),
          ),
          SizedBox(width: 10.rw,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Joy Arnold left 6 comments on Your Post',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4.rh,),
              Text('Yesterday at 11:42 PM',
                style: TextStyle(
                  color: Color(0xffA5ACB8),
                ),
              ),

            ],
          ),
        ],
      ),
    ],
  ),
);