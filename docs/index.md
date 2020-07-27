# The Basis of the Game

The game can have up to 30 players, each siding to one of three teams - Red, Blue or Grey. Despite the number of players, the run time is kept to under 15 minutes!

Two definitive teams - red and blue. The red team aims to kill the President by ensuring the Bomber is **in** the same room as the President at the end of the game. The blue team aims to do the opposite, ensure the president is **not** in the same room as the Bomber at the end of the game. The game also has "grey" roles that are not on a definitive team but affect the game in their unique way with a separate objective. 

The game has 3 rounds, each shorter than the last. Starting at 3 minutes, the rounds decrease by a minute (3 -> 2 -> 1). However, this can vary depending on the number of players. The group is split into half with each half going into a different room and having 3 minutes and then 2 etc, to discuss. At the end of each round, the leader (who is appointed at some point in the time allotted in the round) decides to send someone to the other room.


## Game / App Requirements

The few elements of the game are still difficult to organise, regardless of location (in today's climate of virtual play). To play the game, a group would require:

  - A medium to distribute roles
  - A timer

Using a deck of cards can prove to be confusing if a group was to incorporate some of the unique roles the game has to offer. Alongside this, each room needs to have a timer that ideally would be synchronised to avoid a room having potentially more time than the other to discuss.

## Approach

I have decided to use [Flutter](https://flutter.dev "Flutter Homepage") to create the app as I feel that it provides a comprehensive set of UI widgets written with [Dart](https://dart.dev "Dart Homepage"). I debated using [React Native](https://reactjs.org "React Homepage") however I felt incorporating a DB with Flutter was easier as opposed to React since [Firebase](https://firebase.google.com "Firebase Homepage") is **easy to integrate** into Flutter projects. 

However, I did have my concerns about Flutter, Dart in particular. Since Dart is a fairly new language, I felt that finding online support for bugs would be harder which did give React an advantage as it is written in Javascript which has a large community. Nevertheless, I felt the features Firebase provides met my requirements well and due to the aforementioned easy integration I still went with Flutter.

## Setting Up

Setting up a Flutter Application in [Android Studio](https://developer.android.com/studio "Android Studio Homepage") and playing around with the example code Flutter provides was a good starting point. By watching a few videos and using a website called [Material](https://material.io "Material Homepage") I learnt the key constructs of writing in Dart and making an app with Flutter. Integrating Firebase into my Flutter Project was quite simple with the aid of the instructions Firebase provides.

After I had set up the Flutter App and had linked it to my Firebase DB, I was ready to start developing!

# CRUD with Firebase & Flutter

CRUD stands for Create, Read, Update & Delete and are the four basic functions of **persistent storage**. I will begin with *reading data* as it is the most basic of the four functions and progress from there.

## Reading Data from Firebase

Reading data from a Database is vital for this project as without it I cannot see what is actually in the database from the app. Since this app would require multiple clients reading the same data, I need to be able to access this data in the first place and display it somehow in my app. To initially access the data from a *collection* in Firebase we need to set up a **stream of data** into our Application. This stream will **automatically** receive updates from the database without having to query any data! This is one of the advantages of using Firebase, it is a Real-Time Database - to further understand it, [click here](https://firebase.google.com/docs/database). 

We set this stream up in the body of our app which is an attribute of the [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) Widget,

```dart
 body: StreamBuilder(
                stream: Firestore.instance
                    .collection(COLLECTION_NAME)
                    .document(DOCUMENT_NAME)
                    .snapshots(), 
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  return _buildContent();
                })));
```

Above you can see that the [StreamBuilder](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html) Widget also takes in a 'builder' attribute which returns widgets that will be displayed in the app itself. In this case, I have written a separate method to build the content of the app to make the code more readable. I have also included an if statement in the case that the document I am attempting to stream does not have data and if this is true I return a '[loading](https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html)' widget.

To display the data, we use the [Text](https://flutter.dev/docs/development/ui/widgets/text) Widget. As said before, the StreamBuilder Widget will receive updates from the database automatically and through the use of 'snapshots()', my application will get a '*picture*' of the document. Not literally of course, but this 'picture' will only change when another update is received in which case another 'picture' is taken, kind of overwriting the previous 'picture'. So below, I am getting the most recent 'picture' of the field "players" and simply displaying it on the screen.

```dart
Text(snapshot.data["players"],
    style: TextStyle(fontSize: 18.0),
           textAlign: TextAlign.center)
```

Since I will receive a new snapshot or 'picture' when an update is made, this Text Widget will also change when an update is made.
