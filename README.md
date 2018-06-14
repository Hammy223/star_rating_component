# Star Rating Component for AngularDart

Usage:
```dart
<mat-star-rating class="recommendbutton"  [rating]="0" [starCount]="5" 
[starColor]="'gold'" (onRatingClick)="onRatingChanged($event)"></mat-star-rating>


void onRatingChanged(rating){
    print(rating);
    //this.rating = rating;
  }
```
