import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:userfollowersdata_practice/models/followers_model.dart';
import 'package:userfollowersdata_practice/network_call/base_network.dart';

class Followers extends StatefulWidget {
const Followers({ required this.login,required this.avatar}) ;
  final String login;
  final String avatar;

  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {

  bool fetching = true;
  List<FollowersDataModel>? followersData ;



  void user_followers() async {
    setState(() {
      fetching = true;
    });
    try {
     
      Response response = await dioClient.ref!.get("/users/${widget.login}/followers",
       
      );
      setState(() {
        followersData =followersDataModelFromJson(jsonEncode(response.data)) ;
        
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
    user_followers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        
        centerTitle: false,
        title: Text("Followers",
        style: TextStyle(
          fontSize: 25
        ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 20),
        child: followersData==null?
        Center(
          child: CircularProgressIndicator(),
        )
        :ListView.builder(
            //itemCount: 50,
            itemCount: followersData!.length,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => UsersProfile(
                    //               login: userData!.items![index].login,
                    //               avatar:userData!.items![index].avatarUrl
                    //             )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        followersData![index].login,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            NetworkImage(followersData![index].avatarUrl),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
      ),
    );
  }
}