import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:redltd_rilac/redltd_rilac.dart';

void main() {
  runApp(const MaterialApp(
      home:  MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    RedltdRilac.config(baseURL: "http://finifyapi.redltd.tech:8000/pmsasapi/", userName: "pmsdev", userPassword: "password1234", module: "JW9tc0ByZWRsdGQl", customerMobileNumber: "1148207711");
    // RedltdRilac.config(baseURL: "", userName: "", userPassword: "", module: "", customerMobileNumber: "");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),

      body: ListView(

        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Get my point'),
              onPressed: () async{
                var data = await RedltdRilac().getMyPoint();
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Get voucher list'),
              onPressed: () async{
                var data = await RedltdRilac().getVoucherList(longitude: "1", latitude: "1");
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Get voucher details'),
              onPressed: () async{
                var data = await RedltdRilac().getVoucherDetails(voucherId: "PD0086");
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Purchase voucher'),
              onPressed: () async{
                var data = await RedltdRilac().purchaseVoucher(voucherId: "PD0086", purchaseByCash: false);
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Get purchase voucher List'),
              onPressed: () async{
                var data = await RedltdRilac().getPurchaseVoucherList();
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Get purchase voucher details'),
              onPressed: () async{
                var data = await RedltdRilac().getPurchaseVoucherDetails(voucherCode: "VP-0203");
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Use voucher'),
              onPressed: () async{
                var data = await RedltdRilac().useVoucher(voucherCode: "VP-0203");
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Share voucher'),
              onPressed: () async{
                var data = await RedltdRilac().giftVoucher(voucherCode: "VP-0203", sendToMobileNumber: "1234567890");
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Share Points'),
              onPressed: () async{
                var data = await RedltdRilac().transferPoints(sendToMobileNumber: "01234567890", keyword: "C2CP", transferAmount: 1);
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
                data = await RedltdRilac().transferPoints(businessId: "1677495583539", keyword: "C2MP", transferAmount: 1);
                jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Point Expense History'),
              onPressed: () async{
                var data = await RedltdRilac().pointExpenseHistory(limit: 100, page: 1);
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Point Earn History'),
              onPressed: () async{
                var data = await RedltdRilac().pointEarnHistory(limit: 100, page: 1);
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Get location wise promotion'),
              onPressed: () async{
                var data = await RedltdRilac().getLocationWisePromotion(latitude: "1", longitude: "1", distance: 1000000000000000, page: 1, limit: 20);
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),

          Center(
            child: ElevatedButton(
              child: const Text('Promotion'),
              onPressed: () async{
                var data = await RedltdRilac().promotion(page: 1, limit: 20, businessId: 13);
                Map<String, dynamic> jsonMap = json.decode(data.toString());
                if(jsonMap["issuccess"]){
                  debugPrint("success response ${data.toString()}");
                }else{
                  debugPrint("error response ${data.toString()}");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
