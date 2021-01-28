import 'dart:io';
import 'package:intl/intl.dart';
import 'passenger.dart';
import 'trip.dart';

class tripList {
  List<Trip> listOfTrips= <Trip>[];
  List<Passenger> listOfPassenger =<Passenger>[];

    List<Trip> temp= <Trip>[];


    void addTrip(){
      int id, passengerLimit, price;

      String location;
      DateTime date;
      stdout.write('-PassengerLimit : ');
      passengerLimit =int.parse(stdin.readLineSync()) ;
      stdout.write('-Price : ');
      price =int.parse(stdin.readLineSync()) ;

      stdout.write('-location : ');
      location = stdin.readLineSync();

      print('Trip Date');
      var day,month,year;

        stdout.write('*Day : ');
        day = int.parse(stdin.readLineSync()) ;
        stdout.write('*Month : ');
        month = int.parse(stdin.readLineSync()) ;
        stdout.write('*Year : ');
        year = int.parse(stdin.readLineSync()) ;

      date = DateFormat('dd/MM/yyyy').parse('$day/$month/$year');

      id =listOfTrips.length + 1 ;
      listOfTrips.add(Trip(
        id: id,
        price: price,
        location: location,
        date: date,
        passengerLimit: passengerLimit
      ));
       print('trip with ${id} is Added');
   }

   void viewTrip(){
     listOfTrips.forEach((trip) { 
      
       print("trip id : ${trip.id}");
       print("location : ${trip.location}");
       print("date : ${trip.date}");
       print("price : ${trip.price}");
       print("passenger limit : ${trip.passengerLimit}");
       if(trip.price >= 10000 ){
         trip.discount = trip.price*(80/100);
         print('you have 20% discount : ${trip.discount}\n');
       }
       print(".........................................\n");
     });

 
   }

   void reserve(){
     stdout.write('-ID : ');
     int id =int.parse(stdin.readLineSync()) ;
     stdout.write('Name : ');
     String name = stdin.readLineSync() ;
     stdout.write('-Trip ID : ');
     int tripId =int.parse(stdin.readLineSync()) ;

     if(tripId > listOfTrips.length || tripId < 0){
       return;
     }
     
     listOfPassenger.add(Passenger(id: id, name: name, tripId: tripId));
     
     print("trip is reserved\n");

   }

   void viewPassengers(){
    listOfPassenger.forEach((Passenger) {
      print('passenger id : ${Passenger.id}');
      print('passenger name : ${Passenger.name}\n');
      
       print("id : ${listOfTrips[Passenger.tripId - 1].id}");
       print("location : ${listOfTrips[Passenger.tripId - 1].location}");
       print("date : ${listOfTrips[Passenger.tripId - 1].date}");
       print("price : ${listOfTrips[Passenger.tripId - 1].price}");
       print("passenger limit : ${listOfTrips[Passenger.tripId - 1].passengerLimit}");
       if(listOfTrips[Passenger.tripId - 1].price >= 10000 ){
         listOfTrips[Passenger.tripId - 1].discount = listOfTrips[Passenger.tripId - 1].price*(80/100);
         print('you have 20% discount : ${listOfTrips[Passenger.tripId - 1].discount}\n');
       }
       print(".........................................\n");

     });
   }

   void deleteTrip(){
      int id ;
     stdout.write('-ID : ');
     id =int.parse(stdin.readLineSync()) ;
     id--;
     if(id < 0 || id > listOfTrips.length - 1 ){
       print("invalid id");
       return;
     }
     for(int i =id; i < listOfTrips.length ; i++)
     {
       listOfTrips[i].id--;
     }
      listOfTrips.removeAt(id);
      print("trip ${id+1} has removed");
   }

   void editTrip(){
     int id, passengerLimit, price;

     String location;
     DateTime date;

     stdout.write('-ID : ');
     id =int.parse(stdin.readLineSync()) ;
      id--;
      if(id > listOfTrips.length-1 || id < 0){
        print('sorry invaild id ');

        return;
      }

     stdout.write('-PassengerLimit : ');
     passengerLimit =int.parse(stdin.readLineSync()) ;
     stdout.write('-Price : ');
     price =int.parse(stdin.readLineSync()) ;

     stdout.write('-location : ');
     location = stdin.readLineSync();

     print('Trip Date');
     var day,month,year;

     stdout.write('*Day : ');
     day = int.parse(stdin.readLineSync()) ;
     stdout.write('*Month : ');
     month = int.parse(stdin.readLineSync()) ;
     stdout.write('*Year : ');
     year = int.parse(stdin.readLineSync()) ;

     date = DateFormat('dd/MM/yyyy').parse('$day/$month/$year');

      listOfTrips[id].location = location ?? listOfTrips[id].location ;
      listOfTrips[id].date = date ?? listOfTrips[id].date ;
      listOfTrips[id].price = price ?? listOfTrips[id].price ;
      listOfTrips[id].passengerLimit =passengerLimit  ?? listOfTrips[id].passengerLimit ;

      print('trip with ${id} is edit');


   }
    void tripLast (){
      int last10 =0;
      for(int i = listOfTrips.length-1 ; last10 !=10 && i >= 0 ; i--){
        last10++; 
        print("id : ${listOfTrips[i].id}");
        print("location : ${listOfTrips[i].location}");
        print("date : ${listOfTrips[i].date}");
        print("price : ${listOfTrips[i].price}");
        if(listOfTrips[i].discount != null){
         print("discount : ${listOfTrips[i].discount}");
        }
        print("Passenger Limit : ${listOfTrips[i].passengerLimit}");
        print(".........................................\n");

      
      }
       
    }

  void search(){

    stdout.write('-Price : ');
    int price =int.parse(stdin.readLineSync()) ;

    listOfTrips.forEach((trip) {
      if(price == trip.price){
        print("trip id : ${trip.id}");
       print("location : ${trip.location}");
       print("date : ${trip.date}");
       print("price : ${trip.price}");
       print("passenger limit : ${trip.passengerLimit}");
       if(trip.price >= 10000 ){
         trip.discount = trip.price*(80/100);
         print('you have 20% discount : ${trip.discount}\n');
       }
       print(".........................................\n");
      }

     });

  }

} 