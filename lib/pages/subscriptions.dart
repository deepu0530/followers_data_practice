import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:userfollowersdata_practice/models/subscriptions_model.dart';
import 'package:userfollowersdata_practice/network_call/base_network.dart';


class Subscriptions extends StatefulWidget {
  const Subscriptions({ required this.login }) ;
  final String login;

  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {


 bool fetching = true;
  List<SubscriptionsModel>? subscriptionsdData ;



  void user_subscriptions() async {
    setState(() {
      fetching = true;
    });
    try {
     
      Response response = await dioClient.ref!.get("/users/${widget.login}/subscriptions",
       
      );
      setState(() {
        subscriptionsdData =subscriptionsModelFromJson(jsonEncode(response.data)) ;
        
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
    user_subscriptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Subscriptions",
         style: TextStyle(
          fontSize: 25
        ),
        ),
      ),
      body: Container(
      
        child: subscriptionsdData==null?
        Center(child: CircularProgressIndicator(),)
        :Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(subscriptionsdData![0].name,
            style: TextStyle(
              fontSize: 25,
              color: Colors.black
            ),
            )
          ],),
        )
      ),
    );
  }
}