# Project set up

## 1) Download fvm
To manage flutter version, we use FVM
Download fvm from : https://fvm.app/

## 2) Check into .fvmrc file flutter version

## 3) Install the same version
```
fvm use {version}
```

## 4) Run pub get
```
fvm flutter pub get
```
Run this command to get all the dependencies listed in the pubspec.yaml file
If you don't have the flutter version, fvm will ask if you want to download it.

## 5) Change project config
Go to Android Studio => Settings => Preferences => Languages & Frameworks
DART : change dart SDK path to {fvmPath normally "/Users/name"}/fvm/versions/{projectFlutterVersion}/bin/cache/dart-sdk
Flutter : change flutter SDK path to {fvmPath normally "/Users/name"}/fvm/versions/{projectFlutterVersion}

## 6) Create an emulator to run the project

## 7) Run with the correct environment
Go to run/debug config

![Run/debug config](/screenshots/path.png)


Add new flutter

![Run/debug config part 2](/screenshots/add_flutter.png)


Set dart entry point to : {pathToProject}/flutter_01_brindalo/lib/main_local.dart, if you want to run the project locally

## 8) Generate assets / internalization / .g files
```
fvm flutter pub global activate intl_utils
fvm flutter pub global run intl_utils:generate
fvm flutter packages pub run r_flutter:generate; 
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

## 9) Run the project

Directly from run button or by running:
```
fvm flutter run -t lib/main_local.dart
```