import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:test/controller/blogs.dart';

import '../../helper/constants/colors.dart';
import '../../ui/screens/plant_details.dart';

class ScanQrScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  final ColorHepler _colorHepler = ColorHepler();
  final BlogsController _controller = Get.put(BlogsController());

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    controller.resumeCamera();
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.pauseCamera();
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.white,
              borderRadius: 5,
              borderLength: 70,
              borderWidth: 10,
              cutOutSize: width - 60,
            ),
            onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
          ),
          result == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Container(
                    width: width - 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: _colorHepler.second.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width - 130,
                          child: Text(result!.code.toString()),
                        ),
                        InkWell(
                          onTap: () async {
                            await _controller.getAllBlogs();
                            _controller.getOneBlog(result!.code.toString());
                            Get.to(PlantDetailsScreen());
                            controller!.pauseCamera();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                            decoration: BoxDecoration(
                              color: _colorHepler.brand,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
