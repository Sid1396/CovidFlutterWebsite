import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stayhome/ApiClient.dart';
import 'package:flutter_stayhome/SizeConfig.dart';
import 'package:flutter_stayhome/models/AllDataResponse.dart';
import 'package:http/http.dart' as http;

import 'Constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter StayHome Landing Page',
          home: StayHome(),
        );
      });
    });
  }
}

class StayHome extends StatefulWidget {
  @override
  _StayHomeState createState() => _StayHomeState();
}

class _StayHomeState extends State<StayHome> {

  List <Color> _colors = [Color(0xff6034a7), Color(0xff6b2d93)];

  String confirmedCount ="0";
  String activeCount ="0";
  String recoveredCount ="0";
  String deathCount ="0";

  @override
  void initState() {
    super.initState();
    getAllData();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
              colors: _colors,
          stops: [
            0.4,
            0.7
          ]),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 5 * SizeConfig.widthMultiplier
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network("https://image.flaticon.com/icons/svg/2659/2659980.svg"),
                      ),
                      SizedBox(width: 5 * SizeConfig.widthMultiplier,),
                      Text("Home", style: TextStyle(
                        color: Colors.white70,
                        fontSize: 1 * SizeConfig.textMultiplier,
                      ),),
                      SizedBox(width: 5 * SizeConfig.widthMultiplier,),
                      Text("Information", style: TextStyle(
                        color: Colors.white70,
                        fontSize: 1 * SizeConfig.textMultiplier,
                      ),),
                      SizedBox(width: 5 * SizeConfig.widthMultiplier,),
                      Text("Download App", style: TextStyle(
                        color: Colors.white70,
                        fontSize: 1 * SizeConfig.textMultiplier,
                      ),),
                      SizedBox(width: 5 * SizeConfig.widthMultiplier,),
                      Text("About Us", style: TextStyle(
                        color: Colors.white70,
                        fontSize: 1 * SizeConfig.textMultiplier,
                      ),),
                      Spacer(),
                      Icon(Icons.search, size: 3 * SizeConfig.imageSizeMultiplier, color: Colors.white,),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.9,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05,
                        vertical: MediaQuery.of(context).size.width * 0.05,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Save the world by \nstaying at home", style: TextStyle(
                            color: Colors.white,
                            fontSize: 60.0,
                            fontWeight: FontWeight.w900
                          ),),
                          SizedBox(height: 20.0,),
                          Text("This site is a source of information on pro-data \nvoluntary citizens", style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16.0,
                          ),),
                          SizedBox(height: 50.0,),
                          Text("Current number of cases", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),),
                          SizedBox(height: 20.0,),
                          Text("Last update : 10 May 2020 | 19:10:56 + 07:00", style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14.0,
                          ),),
                          SizedBox(height: 50.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Color(0xff6f48b0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 20.0
                                  ),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.lightBlueAccent.withOpacity(0.5),
                                        child: Icon(Icons.done, color: Colors.white, size: 20.0,),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text(confirmedCount, style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0
                                      ),),
                                      SizedBox(height: 5.0,),
                                      Text("Confirmed", style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14.0
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Color(0xff6f48b0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                      vertical: 20.0
                                  ),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.greenAccent.withOpacity(0.5),
                                        child: Icon(Icons.add, color: Colors.white, size: 20.0,),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text("121237", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0
                                      ),),
                                      SizedBox(height: 5.0,),
                                      Text("Active", style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14.0
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Color(0xff6f48b0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                      vertical: 20.0
                                  ),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.yellowAccent.withOpacity(0.5),
                                        child: Icon(Icons.favorite_border, color: Colors.white, size: 20.0,),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text(recoveredCount, style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0
                                      ),),
                                      SizedBox(height: 5.0,),
                                      Text("Recovered", style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14.0
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Color(0xff6f48b0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                      vertical: 20.0
                                  ),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.purpleAccent.withOpacity(0.5),
                                        child: Icon(Icons.remove, color: Colors.white, size: 20.0,),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text(deathCount, style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0
                                      ),),
                                      SizedBox(height: 5.0,),
                                      Text("Died", style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14.0
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40.0,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  horizontal: 40.0,
                                  vertical: 20.0
                              ),
                              child: Text("More Info", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          left: 10.0
                        ),
                        child: Image.asset("image.png"),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),


    );
  }

  void getAllData() async{
    loading(context, 'Loading Data');
    var responseResult = AllDataResponse();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      http.Response response =
          await ApiClient().getAllData();
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      responseResult = AllDataResponse.fromJson(jsonMap);
      if (response.statusCode == 200) {
        dismissDialog();
        confirmedCount = responseResult.casesTimeSeries.last.totalconfirmed;
        recoveredCount = responseResult.casesTimeSeries.last.totalrecovered;
        deathCount = responseResult.casesTimeSeries.last.totaldeceased;
        activeCount = responseResult.casesTimeSeries.last.totalconfirmed;
        setState(() {

        });
      } else {
        dismissDialog();
      }
    } else
      noInternet();
  }


}

//https://image.flaticon.com/icons/svg/2659/2659980.svg