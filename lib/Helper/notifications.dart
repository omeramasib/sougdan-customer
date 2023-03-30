import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeController extends GetxController {
  static const platform = MethodChannel('com.fnrco.fingerprint/channel');

  void sayHello() {
    Map args = {
      'name': 'Asim Sharfeldin',
    };
    platform.invokeMethod('say_hello', args).then((value) {
      if (value.isNotEmpty) {
        print(value + ' from Flutter');
      }
    });
  }

  void reply() {
    Map args = {
      'name': 'FNRCO',
    };
    platform.invokeMethod('reply_hello', args).then((value) {
      if (value.isNotEmpty) {
        print(value + ' from Flutter');
      }
    });
  }

  Future<void> config() async {
    RemoteMessage? init = await FirebaseMessaging.instance.getInitialMessage();

    if (init != null) {
      _handleMessage(init);
      _handleOnMessage(init);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onMessage.listen(_handleOnMessage);
  }

  void _handleMessage(RemoteMessage message) {
    print('Message clicked!');
  }

  void _handleOnMessage(RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    Map data = {
      'title': message.notification?.title,
      'body': message.notification?.body,
      'data': message.data,
    };

    print(data);

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      Get.snackbar(
        notification.title!,
        notification.body!,
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    }
  }

  Future<void> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    }
    if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    }
    print('User declined or has not accepted permission');
    update();
  }
}