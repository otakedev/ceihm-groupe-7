import 'package:alergo/mocks/ingredients_mock.dart';

const PRODUCTS_MOCK = [
  {
    "id": "1",
    "name": "Cookie",
    "description": "Une Description",
    "urlImage": "https://otakedev.com/share/images/brand/cookie.png",
    "ingredients": [
      {"quantity": "100g", ...INGREDIENT_FLOUR_MOCK},
      {"quantity": "20g", ...INGREDIENT_BUTTER_MOCK},
      {"quantity": "2", ...INGREDIENT_EGG_MOCK},
      {"quantity": "50g", ...INGREDIENT_MILK_CHOCOLATE_MOCK},
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Issue de L'Agriculture Biologique"
      }
    ]
  },
  {
    "id": "2",
    "name": "Coca Cola",
    "description": "Une Description",
    "urlImage": "https://otakedev.com/share/images/brand/coca.png",
    "ingredients": [
      {"quantity": "80g", ...INGREDIENT_SUGAR_MOCK},
      {"quantity": "4ml", ...INGREDIENT_CITRIC_ACIDE_MOCK},
      {"quantity": "80%", ...INGREDIENT_WATER_MOCK},
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Issue de L'Agriculture Biologique"
      },
    ]
  },
  {
    "id": "3",
    "name": "Kinder Bueno",
    "description": "Une Description",
    "urlImage": "https://otakedev.com/share/images/brand/bueno.png",
    "ingredients": [
      {"quantity": "25%", ...INGREDIENT_MILK_CHOCOLATE_MOCK},
      {"quantity": "25%", ...INGREDIENT_WHITE_CHOCOLATE_MOCK},
      {"quantity": "15%", ...INGREDIENT_BUTTER_MOCK},
      {"quantity": "20%", ...INGREDIENT_PALM_OIL_MOCK},
      {"quantity": "15%", ...INGREDIENT_HAZELNUT_MOCK},
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Issue de L'Agriculture Biologique"
      },
    ]
  },
];
