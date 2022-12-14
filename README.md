# project_asbin
This is my course (college) assignment about trash bin monitoring by an mobile app which developed with Flutter Framework 

Project AsBin (Automated System of Trash Bin) are IoT projects that integrated with an Mobile App to monitor the capacity of trash bin.

Hardware :
  - ESP32 (Microcontroller)
  - LoadCell (Sensor)
  - HCSR04 (Sensor)
  - Selenoid Lock and Relay (Actuator)
 
Software :
  - VSCode + Flutter Framework (for mobile apps development) 
  - Arduino IDE (for hardware programs)

There are 2 parameters that would be processed wtih Fuzzy Logicto get the capacity of the trash bin, those are weight (detected by LoadCell) and height(detected by HCSR04). When the trash approach the 'maximum point' of the trash, the Selenoid lock will released and the trashbin will be LOCKED. The user can monitor their trash bin by the Asbin App and control the lock (to unlock/lock) so their can manage their trash more efficiently.  


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
