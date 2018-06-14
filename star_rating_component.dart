import 'package:angular/angular.dart';
import 'dart:async';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';

@Component(
  selector: 'mat-star-rating',
  templateUrl: './star_rating_component.html',
  styleUrls: ['./star_rating_component.css'],
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
  @Input() String color;
  final ratingUpdated = new StreamController.broadcast();
  @Output() Stream get onRatingUpdated => ratingUpdated.stream;

  int snackBarDuration = 2000;
  var ratingArr;



  @override
  void ngOnInit() {
    for (var index = 0; index < this.starCount; index++) {
      this.ratingArr.add(index);
    }
  }

  onClick(int rating) {
    print(rating);
    ratingUpdated.add(rating);
    return false;
  }

  showIcon(int index) {
    if (this.rating >= index + 1) {
      return 'star';
    } else {
      return 'star_border';
    }
  }
}

enum StarRatingColor {
  primary,
  accent,
  warn
}