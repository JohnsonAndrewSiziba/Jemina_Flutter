// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/models/news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsBody extends StatefulWidget {
  News article;
  NewsBody({Key? key, required this.article}) : super(key: key);

  @override
  State<NewsBody> createState() => _NewsBodyState();
}

class _NewsBodyState extends State<NewsBody> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  int progress = 0;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.article.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Center(
              child: Text(
                'Loading...',
                style: TextStyle(
                  color: techBlue,
                ),
              ),
            ),
            content: Container(
              height: 100.0,
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
      onProgress: (int myProgress) {
        print('WebView is loading (progress : $progress%)');
        setState(() {
          progress = myProgress;
        });
      },
      javascriptChannels: <JavascriptChannel>{
        _toasterJavascriptChannel(context),
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          print('blocking navigation to $request}');
          return NavigationDecision.prevent;
        }
        print('allowing navigation to $request');
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
        Navigator.pop(context, 'OK');
      },
      gestureNavigationEnabled: true,
      backgroundColor: const Color(0x00000000),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
