import 'package:alergo/mocks/ingredients_mock.dart';

const DIETS_MOCK = [
  {
    "id": 1,
    "name": "Végétarien",
    "assetPath": "assets/diets/vegetarian.jpg",
    "forbiddenIngredients": [
      INGREDIENT_BEEF_MOCK,
      INGREDIENT_CHICKEN_MOCK,
    ],
    "compatibleIngredients": [
    ],
    "uncompatibleIngredients": [],
  },
    {
    "id": 2,
    "name": "Pesco-végétarien",
    "assetPath": "assets/diets/pesco-vegetarian.jpg",
    "forbiddenIngredients": [
    ],
    "compatibleIngredients": [
    ],
    "uncompatibleIngredients": [],
  },
      {
    "id": 3,
    "name": "Végan",
    "assetPath": "assets/diets/vegan.jpg",
    "forbiddenIngredients": [
      INGREDIENT_BEEF_MOCK,
      INGREDIENT_CHICKEN_MOCK,
      INGREDIENT_CHICKEN_MOCK,
      INGREDIENT_EGG_MOCK
    ],
    "compatibleIngredients": [
    ],
    "uncompatibleIngredients": [],
  },
  {
    "id": 4,
    "name": "Sans gluten",
    "assetPath": "assets/diets/no-gluten.jpg",
    "forbiddenIngredients": [
    ],
    "compatibleIngredients": [
    ],
    "uncompatibleIngredients": [],
  },
  {
    "id": 5,
    "name": "Sans lactose",
    "assetPath": "assets/diets/no-lactose.jpg",
    "forbiddenIngredients": [
      INGREDIENT_MILK_CHOCOLATE_MOCK
    ],
    "compatibleIngredients": [
    ],
    "uncompatibleIngredients": [],
  },
  {
    "id": 6,
    "name": "Cétogène",
    "assetPath": "assets/diets/cetogen.jpg",
    "forbiddenIngredients": [
    ],
    "compatibleIngredients": [
    ],
    "uncompatibleIngredients": [],
  },
  {
    "id": 7,
    "name": "Sans porc",
    "assetPath": "assets/diets/no-pork.jpg",
    "forbiddenIngredients": [
    ],
    "compatibleIngredients": [
    ],
    "uncompatibleIngredients": [],
  },
];
