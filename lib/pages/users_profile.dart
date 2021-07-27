import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:userfollowersdata_practice/models/usersprofile_model.dart';
import 'package:userfollowersdata_practice/network_call/base_network.dart';
import 'package:userfollowersdata_practice/pages/followers.dart';


class UsersProfile extends StatefulWidget {
  const UsersProfile({ required this.login,required this.avatar}) ;
  final String login;
  final String avatar;

  @override
  _UsersProfileState createState() => _UsersProfileState();
}

class _UsersProfileState extends State<UsersProfile> {

 bool fetching = true;
  UsersProfileModel? usersProfile;



  void users_profile() async {
    setState(() {
      fetching = true;
    });
    try {
    
      Response response = await dioClient.ref!.get("/users/${widget.login}",
    
      );
      setState(() {
        usersProfile =usersProfileModelFromJson(jsonEncode(response.data));
        // print("items are ${items.length}");
        // print("followers are ${users!.items.length}");
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
    users_profile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
       appBar: AppBar(
        
        centerTitle: false,
        title: Text("User Profile",
        style: TextStyle(
          fontSize: 25
        ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20,right: 20,left: 20),
        child: usersProfile==null?
        Center(
          child: CircularProgressIndicator()
        ):
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(usersProfile!.avatarUrl),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(usersProfile!.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                  ),
                   SizedBox(height: 5,),
                  Text(usersProfile!.company,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  ),
                  SizedBox(height: 5,),
                  SizedBox(width: 10,),
                  Text(usersProfile!.location,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  ),
                  
                ],
              )
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
             GestureDetector(
                onTap: (){
               Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Followers(avatar: usersProfile!.avatarUrl,login: usersProfile!.login,),
                                )
                                );
              
            },
               child: Column(children: [
                  Text("Followers",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                        ),
                Text("(${usersProfile!.followers})",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        ),
               ],),
             ),
              Column(children: [
                Text("Following",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                      ),
              Text("(${usersProfile!.following})",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      ),
             ],)
            ],
          ),
        
           //Divider(thickness: 2,color: Colors.black,)
        ],),
      ),
    
    );
  }
}