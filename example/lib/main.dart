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
    RedltdRilac.config(baseURL: "http://3.18.0.201:9028/pmsasapi/", userName: "pmsdev", userPassword: "password1234", module: "JW9tc0ByZWRsdGQl", customerMobileNumber: "9849131399");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Get my point'),
              onPressed: () async{
                var data = await RedltdRilac().getMyPoint();
                debugPrint(data.toString());
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Get voucher list'),
              onPressed: () async{
                var data = await RedltdRilac().getVoucherList(longitude: "1", latitude: "1");
                debugPrint(data.toString());
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Get voucher details'),
              onPressed: () async{
                var data = await RedltdRilac().getVoucherDetails(voucherId: "PD00205");
                debugPrint(data.toString());
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Purchase voucher'),
              onPressed: () async{
                var data = await RedltdRilac().purchaseVoucher(voucherId: "PD00203", purchaseByCash: false);
                debugPrint(data.toString());
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Get purchase voucher List'),
              onPressed: () async{
                var data = await RedltdRilac().getPurchaseVoucherList();
                debugPrint(data.toString());
              },
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: ElevatedButton(
              child: const Text('Get purchase voucher details'),
              onPressed: () async{
                var data = await RedltdRilac().getPurchaseVoucherDetails(voucherCode: "VP-0019");
                debugPrint(data.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
