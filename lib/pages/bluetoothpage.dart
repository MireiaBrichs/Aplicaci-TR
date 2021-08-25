import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';


class BluetoothRoute extends StatefulWidget {
  @override
  _BluetoothRouteState createState() => _BluetoothRouteState();
}

class _BluetoothRouteState  extends State<BluetoothRoute>{
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FlutterBluetoothSerial _bluetooth =FlutterBluetoothSerial.instance;
  late BluetoothConnection connection;
  late int _deviceState;
  bool isDisconnecting = false;

  bool get isConnected => connection.isConnected;

  List<BluetoothDevice> _devicesList =[];
  var _device;
  bool _connected = false;
  bool _isButtonUnavailable = false;

  @override
  void initState(){
    super.initState();
    _bluetooth.state.then((state){
      setState(() {
        _bluetoothState =state;
      });
    });
    _deviceState =0;

    enableBluetooth();
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state){
      setState(() {
        _bluetoothState = state;
        if(_bluetoothState == BluetoothState.STATE_OFF){
          _isButtonUnavailable =true;
        }
        getPairedDevices();
      });
    });
  }
  @override
  void dispose(){
    if (isConnected){
      isDisconnecting = true;
      connection.dispose();
      connection = null as BluetoothConnection;
    }
    super.dispose();
  }

  Future<bool> enableBluetooth() async{
    _bluetoothState = await FlutterBluetoothSerial.instance.state;

    if (_bluetoothState == BluetoothState.STATE_OFF){
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      return true;
    } else {
      await getPairedDevices();
    }
    return false;
  }

  Future<void> getPairedDevices() async{
    List<BluetoothDevice> devices =[];

    try{
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException{
      print("ERROR");
    }

    if (!mounted){
      return;
    }

    setState((){
      _devicesList = devices;
    });
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text ("Connexió Bluetooth"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children:<Widget>[
              Visibility(
                visible: _isButtonUnavailable &&
                    _bluetoothState == BluetoothState.STATE_ON,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white54,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Expanded(
                      child: const Text('Encendre Bluetooth',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Switch(
                      value: _bluetoothState.isEnabled,
                      onChanged: (bool value) {
                        future() async {
                          if (value) {
                            await FlutterBluetoothSerial.instance
                                .requestEnable();
                          } else {
                            await FlutterBluetoothSerial.instance
                                .requestDisable();
                          }

                          await getPairedDevices();
                          _isButtonUnavailable = false;

                          if (_connected) {
                            _disconnect();
                          }
                        }
                        future().then((_) {
                          setState(() {});
                        });
                      },
                    )
                  ],
                ),
              ),
              Stack(
                children:<Widget>[
                  Column(
                    children:<Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          color: Colors.grey,
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children:<Widget>[
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget> [
                                    Text('Seleccionar',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    DropdownButton(
                                      items: _getDeviceItems(),
                                      onChanged: (value) {
                                        setState(() {
                                          _device = value;
                                        });
                                      },
                                      value: _devicesList.isNotEmpty
                                          ? _device
                                          :null,
                                      iconSize: 30,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: _isButtonUnavailable
                                          ? null
                                          : _connected ? _disconnect : _connect,
                                      child: Text(
                                        _connected ? 'Desconnectar' :'Connectar',
                                        style: TextStyle (
                                          color:Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      child: Text("Actualitzar",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      onPressed: () async {
                                        await getPairedDevices().then((_){
                                          show('Llista de dispositius actualitzats');
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List <DropdownMenuItem<BluetoothDevice>> _getDeviceItems(){
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty){
      items.add(DropdownMenuItem(
        child: Text ('Cap'),
      ));
    } else {
      _devicesList.forEach((device){
        items.add(DropdownMenuItem(
          child: Text(device.address),
          value: device,
        ));
      });
    }
    return items;
  }
  void _connect()async{
    setState((){
      _isButtonUnavailable = true;
    });
    if (_device == null) {
      show ('No hi ha dispositius connectats');
    } else{
      if (!isConnected){
        await BluetoothConnection.toAddress(_device.address)
            .then((_connection){
          print('Connectat al dispositiu');
          connection: _connection;
          setState(() {
            _connected = true;
          });
          connection.input!.listen(null).onDone(() {
            if (isDisconnecting) {
              print ('Desconnectat localment');
            } else {
              print ('Desconnectat remotament');
            }
            if (this.mounted){
              setState(() {});
            }
          });
        }).catchError((error){
          print ('No es pot connectar, hi ha hagut un error');
          print (error);
        });
        show ('Dispositiu connectat');
        setState(() => _isButtonUnavailable = false);

      }
    }
  }
  void _disconnect() async {
    setState(() {
      _isButtonUnavailable = true;
      _deviceState = 0;
      // connection.output.add(utf8.encode("0"));
    });
    await connection.close();
    show('Dispositiu desconnectat');
    if (!connection.isConnected){
      setState(() {
        _connected = false;
        _isButtonUnavailable = false;
      });
    }
  }

  Future show(
      String message, {
        Duration duration: const Duration (seconds: 3),
      }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        duration: duration,
      ),
    );
  }
}


