import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatelessWidget {
  const WebViewContainer({super.key});
  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController();

    return Scaffold(
       // appBar: AppBar(),
        body: WebViewWidget(
            controller: webViewController
              ..loadRequest(Uri.parse('https://www.tutorialkart.com/')
              )
        )
    );
  }
}
