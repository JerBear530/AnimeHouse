


import 'Anime.dart';

class WatchingList{
    List<Anime> watching;
    bool empty;

    WatchingList({this.watching,this.empty});

  }

  class FavoritesList{
    List<Anime> favorites;
    bool empty;

    FavoritesList({this.favorites,this.empty});

  }

  class CompletedList{
    List<Anime> completed;
    bool empty;

    CompletedList({this.completed,this.empty});

  }
  class WantToWatchList{
    List<Anime> wantToWatch;
    bool empty;

    WantToWatchList({this.wantToWatch,this.empty});

  }

  class DroppedList{
    List<Anime> dropped;
    bool empty;

    DroppedList({this.dropped,this.empty});

  }

  class OnHoldList{
    List<Anime> onHold;
    bool empty;

    OnHoldList({this.onHold,this.empty});

  }