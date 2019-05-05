import 'package:flutter/material.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:local_auth/local_auth.dart';
import 'package:voteio/services/db_services.dart';

import '../widgets/loading_indicators.dart';

class ScannerPage extends StatefulWidget {
  String name;
  String description;
  String eid;
  String image;
  String pid;

  ScannerPage({this.name, this.image, this.description, this.eid, this.pid});

  @override
  State<StatefulWidget> createState() {
    return _ScannerPageState();
  }
}

class _ScannerPageState extends State<ScannerPage> {
  LocalAuthentication _auth = LocalAuthentication();
  QRReaderController controller;

  List<CameraDescription> cameras;
  List<BiometricType> availableBiometrics;

  bool isBiometricDevice;

  String qrcode = '';

  bool _isScanSuccess = false;
  String _scanValue;

  @override
  void initState() {
    super.initState();
    initScanner();
    initiBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanner'),
        backgroundColor: _isScanSuccess
            ? Color.fromRGBO(0, 214, 99, 1)
            : Color.fromRGBO(75, 105, 255, 1),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              scannerView(_isScanSuccess, 300, 300),
              Divider(
                height: 70,
                color: Colors.transparent,
              ),
              voteButton(_isScanSuccess, 300, context),
              Divider(
                height: 80,
                color: Colors.transparent,
              ),
              Text(
                'Selected Candidate',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              ListTile(
                title: Text(this.widget.name),
                subtitle: Text(this.widget.description),
                leading: Image(image: NetworkImage(this.widget.image)),
              )
            ]),
      ),
    );
  }

  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void registerVote(BuildContext context) async {
    bool didAuthenticate = await _auth.authenticateWithBiometrics(
        localizedReason: 'Register Vote?');
    if (didAuthenticate && qrcode.length != 0) {
      bool isCorrectCode =
          DBServices.instance.verifyQrCode(this.widget.pid, qrcode);
      if (isCorrectCode) {
        DBServices.instance
            .postVote(eid: this.widget.eid, pollID: this.widget.pid)
            .then((wasSuccess) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Vote Registered'),
                  actions: <Widget>[
                    FloatingActionButton(
                      backgroundColor: Color.fromRGBO(75, 105, 255, 1),
                      child: Icon(Icons.done),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    ),
                  ],
                );
              });
        });
      }
    }
  }

  void initiBiometrics() async {
    isBiometricDevice = await _auth.canCheckBiometrics;
    if (isBiometricDevice) {
      availableBiometrics = await _auth.getAvailableBiometrics();
    }
  }

  void initScanner() async {
    cameras = await getCameras();
    controller = new QRReaderController(
        cameras[0], ResolutionPreset.medium, [CodeFormat.qr], (dynamic value) {
      setState(() {
        _isScanSuccess = true;
        _scanValue = value.toString();
        print(_scanValue);
      });
      new Future.delayed(const Duration(seconds: 2), controller.startScanning);
    });
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      controller.startScanning();
    });
  }

  Future getCameras() async {
    return await availableCameras();
  }

  Widget voteButton(bool isScanSuccess, double width, BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: width,
      elevation: 8,
      onPressed: () => registerVote(context),
      color: isScanSuccess
          ? Color.fromRGBO(0, 214, 99, 1)
          : Color.fromRGBO(75, 105, 255, 1),
      child: isScanSuccess ? Text('Register Vote') : Text('Scanning ....'),
      textColor: Colors.white,
    );
  }

  Widget scannerView(bool isScanSuccess, double height, double width) {
    if (!controller.value.isInitialized) {
      return BounceLoadingIndicator();
    } else if (isScanSuccess) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://www.qr-code-generator.com/wp-content/themes/qr/new_structure/generator/dist/generator/assets/images/websiteQRCode_noFrame.png'),
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromRGBO(0, 214, 99, 1),
              width: 10,
            )),
      );
    } else {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromRGBO(75, 105, 255, 1),
              width: 10,
            )),
        child: new QRReaderPreview(controller),
      );
    }
  }
}
