import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Recipemodel {
  late final String title;
  late final String image;
  late final String youtube;
  late final String ingredient;
  late final String recipe;


  Recipemodel(this.title, this.image, this.youtube, this.ingredient, this.recipe);


  Recipemodel.fromSnapshot (DocumentSnapshot snapshot, this.title, this.image, this.youtube, this.ingredient, this.recipe) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    title = data['title'];
    image = data['image'];
    youtube = data['youtube'];
    ingredient = data['ingredient'];
    recipe = data['recipe'];
  }
}





