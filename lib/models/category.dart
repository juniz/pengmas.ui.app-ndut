part of 'models.dart';

class Category {
  final int id;
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.id, this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) =>
        Category(item['id'], item['name'], item['courses'], item['image']))
    .toList();

var categoriesData = [
  {
    "id": 1,
    "name": "Mindfulness",
    'courses': 8,
    'image': "assets/images/newpack/10-SCENE.png"
  },
  {
    "id": 2,
    "name": "Komunikasi",
    'courses': 8,
    'image': "assets/images/newpack/8 SCENE.png"
  },
  {
    "id": 3,
    "name": "Kebahagiaan",
    'courses': 8,
    'image': "assets/images/newpack/9-SCENE.png"
  },
  // {"name": "Kepribadian", 'courses': 17, 'image': "assets/images/business.png"},
];
