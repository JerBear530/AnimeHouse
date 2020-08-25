import 'package:flutter/material.dart';

/*DropdownButton dropdown (String dropdownValue,bool complete,bool watching, bool wanttowatch, bool dropped,bool onhold,List<String> originalList) {
  return DropdownButton<String>(
    value: dropdownValue,
    icon: Icon(Icons.arrow_downward),
    iconSize: 24,
    elevation: 16,
    style: TextStyle(color: Colors.deepPurple),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
    ),
    onChanged: (String newValue) {
      if (dropdownValue == newValue) {
        print('you chose the same value');
      } else {
        setState(() {
          switch (dropdownValue) {
            case 'Completed':
              {
                complete = !complete;
                print('Removed from completed list');

                break;
              }
            case 'Watching':
              {
                watching = !watching;
                print('Removed from watching list');
                break;
              }
            case 'Want to Watch':
              {
                wanttowatch = !wanttowatch;
                print('Removed from want to want to watchlist');
                break;
              }
            case 'On Hold':
              {
                onhold = !onhold;
                print('Removed from on holding');
                break;
              }

            case 'Dropped':
              {
                dropped = !dropped;
                print('Removed from dropped list');
                break;
              }


            default:
              {
                originalList.removeWhere((element) =>
                element == 'Add to Library');
                originalList.add('Remove');
                print(
                    'added removed to drop down list and renoved add to library');
              }
          }
          switch (newValue) {
            case'Completed':
              {
                complete = !complete;
                print('added to completed list');
                dropdownValue = 'Completed';
                break;
              }
            case'Watching':
              {
                watching = !watching;
                print('added to watching list');
                dropdownValue = 'Watching';
                break;
              }

            case'Want to Watch':
              {
                wanttowatch = !wanttowatch;
                print('added to want to watch list');
                dropdownValue = 'Want to Watch';
                break;
              }

            case 'On Hold':
              {
                onhold = !onhold;
                print('added to on holding');
                dropdownValue = 'On Hold';
                break;
              }

            case 'Dropped':
              {
                dropped = !dropped;
                print('added to dropped list');
                dropdownValue = 'Dropped';
                break;
              }


            default:
              {
                print('removing from library');
                originalList.removeWhere((element) => element == 'Remove');
                originalList.insert(0, 'Add to Library');
                dropdownValue = 'Add to Library';
              }
          }


//dropdownValue = newValue;
        });
      }
    },
    items: originalList
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
  );
}*/