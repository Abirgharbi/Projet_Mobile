import 'package:app_links/app_links.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DeepLinking {
  static final AppLinks _appLinks = AppLinks();

  // Function to initialize deep link handling
  static Future<void> initDeepLinking() async {
    try {
      // Cold start (app launched via link)
      final Uri? initialUri = await _appLinks.getInitialAppLink();
      if (initialUri != null) {
        _handleDeepLink(initialUri);
      }

      // While app is running (foreground)
      _appLinks.uriLinkStream.listen((Uri? uri) {
        if (uri != null) {
          _handleDeepLink(uri);
        }
      });
    } catch (e) {
      print('Failed to handle app links: $e');
    }
  }

  // Function to handle deep link logic
  static void _handleDeepLink(Uri link) {
    print('Received deep link: $link');
    if (link.pathSegments.contains('verify') &&
        link.queryParameters['token'] != null) {
      final String? token = link.queryParameters['token'];
      if (token != null && token.isNotEmpty) {
        Get.toNamed('/verify', arguments: {'token': token});
      }

    }
    if (link.pathSegments.contains('home')) {
      Get.toNamed('/home');
    }
  }
}



