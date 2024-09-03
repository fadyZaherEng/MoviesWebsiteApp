import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_website_apps/src/core/base/widget/base_stateful_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends BaseStatefulWidget {
  final String webViewUrl;

  const WebViewWidget({super.key, required this.webViewUrl});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends BaseState<WebViewWidget> {
  bool isPageLoaded = false;
  WebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: widget.webViewUrl,
              onPageFinished: (url) {
                setState(() {
                  isPageLoaded = true;
                });
              },
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
            ),
            isPageLoaded
                ? const SizedBox()
                : const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
