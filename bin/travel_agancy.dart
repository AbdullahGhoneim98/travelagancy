
import 'dart:io';

import 'trip2.dart';
import 'trip.dart';

void main() {
  var tr = tripList();

  while (true)
    {

      print('1-Add Trip');
      print('2-Edit Trip');
      print('3-Delete Trip');
      print('4-Search Trip');
      print('5-View Trips');
      print('6-Reserve');
      print('7-View Passengers');
      print('8-Last Trips');
      print('0-Exit\n');
      print('-'*54);
      stdout.write('Choose an option: ');
      var i = int.parse(stdin.readLineSync());
      switch(i){
        case 0:
          print('Thank you');
          return;
          break;
        case 1:
          tr.addTrip();
          break;
        case 2:
          tr.editTrip();
          break;
        case 3:
          tr.deleteTrip();
          break;
        case 4:
          tr.search();
          return;
          break;
        case 5:
          tr.viewTrip();
          break;
        case 6:
          tr.reserve();
          break;
        case 7:
          tr.viewPassengers();
          break;
        case 8:
          tr.tripLast();
          break;

      }

    }
 }


  