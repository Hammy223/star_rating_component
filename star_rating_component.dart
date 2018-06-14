import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';

@Component(
  selector: 'mat-star-rating',
  templateUrl: './star_rating_component.html',
  styleUrls: [
    './star_rating_component.css',
    "https://fonts.googleapis.com/icon?family=Material+Icons"
  ],
  encapsulation: ViewEncapsulation.Emulated,
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
    NgFor
  ]
)
class StarRatingComponent implements OnInit {

  @Input() int rating;
  @Input() int starCount;
  @Input() String starColor;
  final ratingUpdated = new StreamController.broadcast();
  @Output() Stream get onRatingClick => ratingUpdated.stream;

  var ratingArr = [];

  @override
  void ngOnInit() {
    for (var index = 0; index < starCount; index++) {
      ratingArr.add(index);
    }
  }

  onClick(int rating) {
    this.rating = rating;
    ratingUpdated.add(rating);
    return false;
  }

  showIcon(int index) {
    if (rating >= index + 1) {
      return 'star';
    } else {
      return 'star_border';
    }
  }
}