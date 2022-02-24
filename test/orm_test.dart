import 'package:sqlite_orm_example_app/database/models.dart';

void main() async {

}

Future<int?> _createRestaurant() async {
  return await Restaurant(name: "Sopes el autentico").save();
}

Future<List<Restaurant>?> _getRestaurants() async {
  return await Restaurant().select().toList();
}
