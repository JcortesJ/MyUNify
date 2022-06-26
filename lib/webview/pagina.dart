import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class paginaBienestar extends StatefulWidget {
  @override
  paginaBienestarState createState() => paginaBienestarState();
}

class paginaBienestarState extends State<paginaBienestar> {
  Color colorFondo = Color(0xffFF6767);
  @override
  void initState() {
    super.initState();
    // Esto sirve para mejorar rendimiento en android
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: ,
      appBar: AppBar(
          title: Text("Bienestar según MyUNify"),
          backgroundColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),

      body: WebView(
        initialUrl: "https://creatiabusiness.com/15-consejos-para-mejorar-tu-bienestar-y-felicidad/",
        //Poner el modo de Js sin restringir puede ser peligroso, pero
        // pues que le hacemos, esto es una prueba
        javascriptMode: JavascriptMode.unrestricted,
        // onWebViewCreated: (WebViewController webViewController) {
        // _controller.complete(webViewController);
        //pendiente mirar que mas cosas necesita la pagina xd
      ),
    );
  }
}
