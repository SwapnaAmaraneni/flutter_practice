/*
Base Url: https://19cghmc.cgg.gov.in/myghmcwebapi/
endpoint : Grievance/viewGrievances
type: POST
headders:null
parameters:null
body: {
  "mobileno":"9985074116",
  "password":"ghmc@cgg@2018",
  "userid":"cgg@ghmc"
  }
autherization: null
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myghmc/core/api_constants.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../models/viewGrievancesmodel.dart';
import 'checkStatusListItem.dart';

class CheckStatusList extends StatefulWidget {
  const CheckStatusList({super.key});

  @override
  State<CheckStatusList> createState() => _CheckStatusListState();
}

class _CheckStatusListState extends State<CheckStatusList> {
  late viewGrievancesmodel? _viewGrievanceModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Status"),
      ),
  
      body: Container(
          child: ListView.builder(
        itemCount: _viewGrievanceModel?.viewGrievances?.length ?? 0,
        itemBuilder: (context, index) {
          final villageData = _viewGrievanceModel?.viewGrievances?[index];
          return CheckStatusListItem(details: villageData);

        },
      )
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTheVillageDetails();
  }

  fetchTheVillageDetails() async {
//step1: create request url with base url and endpoint
    final requestUrl =
        ApiConstants.baseUrl + ApiConstants.viewGrievanceEndpoint;
//step 2: create payload if request post ,put,option
    final requestPayload = {
      "mobileno": "9985074116",
      "password": "ghmc@cgg@2018",
      "userid": "cgg@ghmc"
    };

// step 3: create headders and autherazation

// step 4: dio or http use this package connect to server
    final _dioObject = Dio();

    try {
      final _response = await _dioObject.post(requestUrl, data: requestPayload);
      //convet this response from json to modelclass
      final villageDetailsModel = viewGrievancesmodel.fromJson(_response.data);
      setState(() {
        this._viewGrievanceModel = villageDetailsModel;
      });
      print(_response);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        final errorMessage = e.response?.data["message"];
        // showAlert(errorMessage);
      }
      print("error is $e");

      print("status code is ${e.response?.statusCode}");
    }
// step 5: print the response
  }
}
