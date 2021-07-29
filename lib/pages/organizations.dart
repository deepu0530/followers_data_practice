import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:userfollowersdata_practice/models/organizations_model.dart';
import 'package:userfollowersdata_practice/models/subscriptions_model.dart';
import 'package:userfollowersdata_practice/network_call/base_network.dart';


class Organizations extends StatefulWidget {
  const Organizations({ required this.login }) ;
  final String login;

  @override
  _OrganizationsState createState() => _OrganizationsState();
}

class _OrganizationsState extends State<Organizations> {


 bool fetching = true;
  List<OrganizationsModel>? organizationsdData ;



  void user_organizations() async {
    setState(() {
      fetching = true;
    });
    try {
     
      Response response = await dioClient.ref!.get("/users/${widget.login}/orgs",
       
      );
      setState(() {
        organizationsdData =organizationsModelFromJson(jsonEncode(response.data)) ;
        
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
    user_organizations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Organizations",
         style: TextStyle(
          fontSize: 25
        ),
        ),
      ),
      body: Container(
      
        child: organizationsdData==null?
        Center(child: CircularProgressIndicator(),)
        :ListView.builder(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20),
            //itemCount: 50,
            itemCount: organizationsdData!.length,
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
                  child:   Text(organizationsdData![0].login,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black
            ),
            )
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        // :Center(
        //   child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
            // Text(organizationsdData![0].login,
            // style: TextStyle(
            //   fontSize: 25,
            //   color: Colors.black
            // ),
            // )
        //   ],),
        // )
      ),
    );
  }
}