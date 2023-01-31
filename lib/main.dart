import 'package:eazy_landlord/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'mainprovider/housepro.dart';

import 'owner/ownerscreens/accout/booking.dart';
import 'owner/ownerscreens/accout/editbiz.dart';
import 'owner/ownerscreens/accout/editpersornal.dart';
import 'owner/ownerscreens/accout/noti.dart';
import 'owner/ownerscreens/accout/report.dart';
import 'owner/ownerscreens/accout/settings.dart';
import 'owner/ownerscreens/apartments/addapart.dart';
import 'owner/ownerscreens/apartments/allapart.dart';
import 'owner/ownerscreens/bangalows/addbang.dart';
import 'owner/ownerscreens/bangalows/allbang.dart';
import 'owner/ownerscreens/dashboardowner.dart';
import 'owner/ownerscreens/homeuser.dart';
import 'owner/ownerscreens/hostels/addhostel.dart';
import 'owner/ownerscreens/hostels/allhostel.dart';
import 'owner/ownerscreens/land/addland.dart';
import 'owner/ownerscreens/land/allland.dart';
import 'owner/ownerscreens/logged-signup/login.dart';
import 'owner/ownerscreens/logged-signup/register.dart';
import 'owner/ownerscreens/logged-signup/sign.dart';
import 'owner/ownerscreens/logged-signup/wait.dart';
import 'owner/ownerscreens/logged-signup/waitver.dart';
import 'owner/ownerscreens/office space/addoffice.dart';
import 'owner/ownerscreens/office space/alloff.dart';
import 'owner/ownerscreens/rentals/addrental.dart';
import 'owner/ownerscreens/rentals/allrentals.dart';
import 'owner/ownerscreens/tourist/addtour.dart';
import 'owner/ownerscreens/tourist/alltour.dart';
import 'owner/ownerscreens/wait.dart';
import 'owner/ownerscreens/warehouses/addware.dart';
import 'owner/ownerscreens/warehouses/allware.dart';

void main() async{

  await Hive.initFlutter();

  Provider.debugCheckInvalidValueType=null;
  runApp(

    MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create:(_) => HouseIDProvider(),
        ),


      ],
      child: const MyApp(),
    ),

  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eazy Rent',
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      builder:EasyLoading.init(),
      initialRoute: Splash.id,// first route
      routes: {
        //we will add the screens here for easy navigation

        Splash.id:(context)=>Splash(),

        //owner routes
        OwnerSignUpScreen.id:(context)=>OwnerSignUpScreen(),
        OwnerLoginScreen.id:(context)=>OwnerLoginScreen(),
        RegisterOwner.id:(context)=>RegisterOwner(),
        Wait.id:(context)=>Wait(),
        WaitVerification.id:(context)=>WaitVerification(),
        DashBoardOwner.id:(context)=>DashBoardOwner(),
        HomeUser.id:(context)=>HomeUser(),
        AllRentals.id:(context)=>AllRentals(),
        AddRental.id:(context)=>AddRental(),
        AllApart.id:(context)=>AllApart(),
        AddApart.id:(context)=>AddApart(),
        AddBang.id:(context)=>AddBang(),
        AllBang.id:(context)=>AllBang(),
        AllHostel.id:(context)=>AllHostel(),
        AddHostel.id:(context)=>AddHostel(),
        AddLand.id:(context)=>AddLand(),
        AllLand.id:(context)=>AllLand(),
        AddWare.id:(context)=>AddWare(),
        AllWare.id:(context)=>AllWare(),
        AddOff.id:(context)=>AddOff(),
        Alloff.id:(context)=>Alloff(),
        AddTour.id:(context)=>AddTour(),
        AllTour.id:(context)=>AllTour(),
        EditBizAccount.id:(context)=>EditBizAccount(),
        EditPersonalAccount.id:(context)=>EditPersonalAccount(),
        Notifications.id:(context)=>Notifications(),
        Settingz.id:(context)=>Settingz(),
        Report.id:(context)=>Report(),
        Bookings.id:(context)=>Bookings(),
        VerificationPAge.id:(context)=>VerificationPAge(),

      },
    );
  }
}

