import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

//defien classes to organize game and field data
class Game{
  String gametype;
  Field playspace;
  int players;

  Game();

  Game.full(String title, Field fieldspace){
    this.gametype = title;
    this.playspace = fieldspace;
    this.players = 1;
  }
}

class Field{
  String name;
  double lat;
  double lon;
  int pos;

  Field(String fname, double up, double down, int id){
    this.name = fname;
    this.lat = up;
    this.lon = down;
    this.pos = id;
  }
}
//premade field list
var fields = [createField('Ferrand', 40.006009, -105.267693, 1), createField('Norlin Quad', 40.008729, -105.271468, 2), createField('Kittridge Fields', 40.002974, -105.259576, 3), createField('Engineering Quad', 40.006813, -105.264942, 4)];

//connect to firebase
final dbref = FirebaseDatabase.instance.reference();

//function to create a field
//takes name, both coorinates, id = pos in fields array
Field createField(String fname, double lat, double lon, int id){
  var field = new Field(fname, lat, lon, id);
  return field;
}


//function to create game, push to server
//takes name of game and a field object
void createGame(String title, Field location){
  var game = new Game.full(title, location);
  dbref.child(game.gametype).set({ //create game in database
    'location': game.playspace,
    'players': game.players,
  });
  dbref.child(title).child('field').set({ //create field in game
    'name': location.name,
    'lat' : location.lat,
    'lon' : location.lon,

  });
}



/*
void readFields(){
  dbref.once().then((DataSnapshot fields){

    Widget build(BuildContext context){
      return MaterialApp(
        title: fields.value
      );
    }
    print('Data: ${fields.value}');
  }
  );
  }*/