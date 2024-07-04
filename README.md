# redltd_rilac

RilacPMS(Point Management System)

## Getting Started

**Use**
```dart
import 'package:redltd_rilac/redltd_rilac.dart';

RedltdRilac.config(baseURL: "", userName: "", userPassword: "", module: "", customerMobileNumber: "");
```

| Variable Name          | Description                                | Default Value      |
|------------------      |--------------------------------------------|------------------- |
| `baseURL`              | provide from service holder                | `localhost`        |
| `userName`             | provide from service holder                | `your-userName`    |
| `userPassword`         | provide from service holder                | `your-userPassword`|
| `module`               | provide from service holder                | `your-api-key`     |
| `customerMobileNumber` | Login User number                          | `your-loginNumber`|

## Device information
### Note: using this code get device info
```dart
import 'package:device_info_plus/device_info_plus.dart';

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
late AndroidDeviceInfo androidInfo; 
late IosDeviceInfo iosInfo;
    
if (Platform.isAndroid) {   
  androidInfo = await deviceInfo.androidInfo;
} else if (Platform.isIOS) {   
  iosInfo = await deviceInfo.iosInfo;
}

String deviceOS = Platform.isAndroid ? androidInfo.version.release : iosInfo.systemVersion; 
String deviceBrand = Platform.isAndroid ? androidInfo.brand : 'Apple'; 
String deviceModel = Platform.isAndroid ? androidInfo.model : iosInfo.utsname.machine; 
String? uniqueId = Platform.isAndroid ? androidInfo.id : iosInfo.identifierForVendor;
```


## Example:
[Demo example](https://github.com/INFINITITECHUK/Rilac_SDK_Flutter/blob/main/example/lib/main.dart)

for more visit [Rilac Documentation](https://github.com/INFINITITECHUK/Rilac_SDK_Flutter/blob/main/RILAC%20SDK%20Documentation.pdf)


This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

