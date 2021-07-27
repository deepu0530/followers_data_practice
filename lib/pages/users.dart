import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:userfollowersdata_practice/models/userdata_model.dart';
import 'package:userfollowersdata_practice/network_call/base_network.dart';
import 'package:userfollowersdata_practice/network_call/base_response.dart';
import 'package:userfollowersdata_practice/network_call/managers.dart';
import 'package:userfollowersdata_practice/pages/users_profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  bool fetching = true;
  UsersDataModel? userData;

  void getData() async {
    setState(() {
      fetching = true;
    });
    try {
      //Response response = await Dio().get("https://api.github.com/search/users?q=followers%3A%3E%3D1000&ref=searchresults&s=followers&type=Users");
      Response response = await dioClient.ref!.get("/search/users?q=followers%3A>%3D1000&ref=searchresults&s=followers&type=Users",

      );
      setState(() {
        userData =usersDataModelFromJson(jsonEncode(response.data));
        // print("items are ${items.length}");
        print("followers are ${userData!.items!.length}");
        fetching=false;
      });
      print(response);
    } catch (e) {
      setState(() {
        fetching=false;
      });
      print(e);
    }
  }
 @override
  void initState() {
    //getHttp();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: Text("List Of Users",
        style: TextStyle(
          fontSize: 25
        ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 20),
        child: 
          userData==null?
          Center(
            child: CircularProgressIndicator(),
          )
          :ListView.builder(
            //itemCount: 50,
            itemCount: userData!.items!.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UsersProfile(
                                  login: userData!.items![index].login,
                                  avatar:userData!.items![index].avatarUrl
                                )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userData!.items![index].login,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            NetworkImage(userData!.items![index].avatarUrl),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
      ),
    );
  }
}