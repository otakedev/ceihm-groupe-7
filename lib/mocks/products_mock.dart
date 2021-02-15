const PRODUCTS_MOCK = [
  {
    "id": "1",
    "name": "Cookie Granola",
    "description": "Une Description",
    "urlImage": "assets/products/cookie.png",
    "ingredients": [
      {
        "quantity": "100g",
        "name": "Farine",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 4,
      },
      {
        "quantity": "20g",
        "name": "Beurre",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 5,
      },
      {
        "quantity": "2",
        "name": "Oeuf",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 6,
      },
      {
        "quantity": "50g",
        "name": "Chocolat au lait",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 7,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Provient de L'Agriculture Biologique"
      },
    ],
    "origin": {
      "name": "United States of America",
      "assetPath": "assets/origin/USA.png",
      "id": 433,
      "city": "NewYork"
    }
  },
  {
    "id": "2",
    "name": "Coca Cola",
    "description": "Une Description",
    "urlImage": "assets/products/coca.png",
    "ingredients": [
      {
        "quantity": "10%",
        "name": "Sucre",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 1,
      },
      {
        "quantity": "5%",
        "name": "Acide citrique",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 2,
      },
      {
        "quantity": "80%",
        "name": "Eau",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 3,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Provient de L'Agriculture Biologique"
      },
    ],
    "origin": {
      "name": "United States of America",
      "assetPath": "assets/origin/USA.png",
      "id": 433,
      "city": "NewYork"
    }
  },
  {
    "id": "3",
    "name": "Kinder Bueno",
    "description": "Une Description",
    "urlImage": "assets/products/bueno.png",
    "ingredients": [
      {
        "quantity": "25%",
        "name": "Chocolat au lait",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 7,
      },
      {
        "quantity": "25%",
        "name": "Chocolat blanc",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 8,
      },
      {
        "quantity": "15%",
        "name": "Beurre",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 5,
      },
      {
        "quantity": "20%",
        "name": "Huile de palme",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 9,
      },
      {
        "quantity": "15%",
        "name": "Noisettes",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 10,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Provient de L'Agriculture Biologique"
      },
    ],
    "origin": {
      "name": "United States of America",
      "assetPath": "assets/origin/USA.png",
      "id": 433,
      "city": "NewYork"
    }
  },
  {
    "id": "4",
    "name": "Coca Cola Zéro",
    "description": "Une Description",
    "urlImage":
        "https://cdn.metro-group.com/fr/fr_pim_397419001002_01.png?w=400&h=400&mode=pad",
    "ingredients": [
      {
        "quantity": "4ml",
        "name": "Acide citrique",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 2,
      },
      {
        "quantity": "80%",
        "name": "Eau",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 3,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Provient de L'Agriculture Biologique"
      },
    ],
    "origin": {
      "name": "United States of America",
      "assetPath": "assets/origin/USA.png",
      "id": 433,
      "city": "NewYork"
    }
  },
  {
    "id": "5",
    "name": "Coca Cola Light",
    "description": "Une Description",
    "urlImage": "https://pngimg.com/uploads/cocacola/coca_cola_PNG8912.png",
    "ingredients": [
      {
        "quantity": "10g",
        "name": "Sucre",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 1,
      },
      {
        "quantity": "4ml",
        "name": "Acide citrique",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 2,
      },
      {
        "quantity": "80%",
        "name": "Eau",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 3,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Provient de L'Agriculture Biologique"
      },
    ],
    "origin": {
      "name": "United States of America",
      "assetPath": "assets/origin/USA.png",
      "id": 433,
      "city": "NewYork"
    }
  },
  {
    "id": "6",
    "name": "Les Saladières Niçoise",
    "description": "Salade typiquement Niçoise",
    "urlImage": "assets/products/salad-nicoise.png",
    "ingredients": [
      {
        "quantity": "25%",
        "name": "Tomates",
        "assetPath": "assets/ingredients/tomatoes.jpg",
        "id": 18,
      },
      {
        "quantity": "5%",
        "name": "Oeuf",
        "assetPath": "assets/ingredients/egg.jpeg",
        "id": 6,
      },
      {
        "quantity": "30%",
        "name": "Salade",
        "assetPath": "assets/ingredients/salad.jpg",
        "id": 11,
      },
      {
        "quantity": "20%",
        "name": "Pommes de terre",
        "assetPath": "assets/ingredients/potatoes.jpg",
        "id": 20,
      },
    ],
    "labels": [],
    "origin": {
      "name": "Nice",
      "assetPath": "assets/origin/NICE.jpeg",
      "id": 433,
      "city": "Nice"
    }
  },
  {
    "id": "7",
    "name": "Boeuf Bourguignon Marie",
    "description": "Recette de grand mère",
    "urlImage": "assets/products/boeuf-bourguignon-marie.png",
    "ingredients": [
      {
        "quantity": "6,6%",
        "name": "Carottes",
        "assetPath": "assets/ingredients/carrots.jpg",
        "id": 17,
      },
      {
        "quantity": "25%",
        "name": "Boeuf",
        "assetPath": "assets/ingredients/beef.jpg",
        "id": 13,
      },
      {
        "quantity": "37%",
        "name": "Pâtes",
        "assetPath": "assets/ingredients/pasta.jpg",
        "id": 19,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Provient de L'Agriculture Biologique"
      },
      {
        "name": "Made in France",
        "assetPath": "assets/labels/FR.png",
        "id": 148,
        "description": "Fabriqué en france"
      },
    ],
    "origin": {
      "name": "France",
      "assetPath": "assets/origin/FR.png",
      "id": 433,
      "city": "Nice"
    }
  },
  {
    "id": "8",
    "name": "Beurre de Cacahuètes Jif",
    "description": "Pate à tartiner à base de cacahuètes",
    "urlImage": "assets/products/peanut-butter.png",
    "ingredients": [
      {
        "quantity": "25%",
        "name": "Cacahuètes",
        "assetPath": "assets/ingredients/peanuts.jpg",
        "id": 15,
      },
      {
        "quantity": "15%",
        "name": "Beurre",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 5,
      },
      {
        "quantity": "20%",
        "name": "Huile de palme",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 9,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Issue de L'Agriculture Biologique"
      },
    ],
    "origin": {
      "name": "United States of America",
      "assetPath": "assets/origin/USA.png",
      "id": 433,
      "city": "NewYork"
    }
  },
  {
    "id": "9",
    "name": "Snickers",
    "description": "Barre au chocolat",
    "urlImage": "assets/products/snickers.png",
    "ingredients": [
      {
        "quantity": "25%",
        "name": "Chocolat au lait",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 7,
      },
      {
        "quantity": "25%",
        "name": "Cacahuètes",
        "assetPath": "assets/ingredients/peanuts.jpg",
        "id": 15,
      },
      {
        "quantity": "15%",
        "name": "Beurre",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 5,
      },
      {
        "quantity": "20%",
        "name": "Huile de palme",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 9,
      },
      {
        "quantity": "15%",
        "name": "Noisette",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 10,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Issue de L'Agriculture Biologique"
      },
    ],
    "origin": {
      "name": "United States of America",
      "assetPath": "assets/origin/USA.png",
      "id": 433,
      "city": "NewYork"
    }
  },
  {
    "id": "6",
    "name": "Les Saladières Niçoise",
    "description": "Salade typiquement Niçoise",
    "urlImage": "assets/products/salad-nicoise.png",
    "ingredients": [
      {
        "quantity": "25%",
        "name": "Tomates",
        "assetPath": "assets/ingredients/tomatoes.jpg",
        "id": 18,
      },
      {
        "quantity": "5%",
        "name": "Oeuf",
        "assetPath": "assets/ingredients/egg.jpeg",
        "id": 6,
      },
      {
        "quantity": "30%",
        "name": "Salade",
        "assetPath": "assets/ingredients/salad.jpg",
        "id": 11,
      },
      {
        "quantity": "20%",
        "name": "Pomme de terre",
        "assetPath": "assets/ingredients/potatoes.jpg",
        "id": 20,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Issue de L'Agriculture Biologique"
      },
    ],
    "origin": {
      "name": "Nice",
      "assetPath": "assets/origin/NICE.jpeg",
      "id": 433,
      "city": "Nice"
    }
  },
  {
    "id": "7",
    "name": "Boeuf Bourguignon Marie",
    "description": "Recette de grand mère",
    "urlImage": "assets/products/boeuf-bourguignon-marie.png",
    "ingredients": [
      {
        "quantity": "6,6%",
        "name": "Carottes",
        "assetPath": "assets/ingredients/carrots.jpg",
        "id": 17,
      },
      {
        "quantity": "25%",
        "name": "Boeuf",
        "assetPath": "assets/ingredients/beef.jpg",
        "id": 13,
      },
      {
        "quantity": "37%",
        "name": "Pâtes",
        "assetPath": "assets/ingredients/pasta.jpg",
        "id": 19,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Issue de L'Agriculture Biologique"
      },
      {
        "name": "Made in France",
        "assetPath": "assets/labels/FR.png",
        "id": 148,
        "description": "Fabriqué en france"
      },
    ],
    "origin": {
      "name": "France",
      "assetPath": "assets/origin/FR.png",
      "id": 433,
      "city": "Nice"
    }
  },
  {
    "id": "8",
    "name": "Beurre de Cacahuètes Jif",
    "description": "Pate à tartiner à base de cacahuètes",
    "urlImage": "assets/products/peanut-butter.png",
    "ingredients": [
      {
        "quantity": "25%",
        "name": "Cacahuètes",
        "assetPath": "assets/ingredients/peanuts.jpg",
        "id": 15,
      },
      {
        "quantity": "15%",
        "name": "Beurre",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 5,
      },
      {
        "quantity": "20%",
        "name": "Huile de palme",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 9,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Issue de L'Agriculture Biologique"
      },
    ],
    "origin": {
      "name": "United States of America",
      "assetPath": "assets/origin/USA.png",
      "id": 433,
      "city": "NewYork"
    }
  },
  {
    "id": "9",
    "name": "Snickers",
    "description": "Barre au chocolat",
    "urlImage": "assets/products/snickers.png",
    "ingredients": [
      {
        "quantity": "25%",
        "name": "Chocolat au lait",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 7,
      },
      {
        "quantity": "25%",
        "name": "Cacahuètes",
        "assetPath": "assets/ingredients/peanuts.jpg",
        "id": 15,
      },
      {
        "quantity": "15%",
        "name": "Beurre",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 5,
      },
      {
        "quantity": "20%",
        "name": "Huile de palme",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 9,
      },
      {
        "quantity": "15%",
        "name": "Noisette",
        "assetPath": "assets/diets/vegan.jpg",
        "id": 10,
      },
    ],
    "labels": [
      {
        "name": "Agriculture Biologique",
        "assetPath": "assets/labels/AB.png",
        "id": 143,
        "description": "Issue de L'Agriculture Biologique"
      },
    ],
    "origin": {
      "name": "United States of America",
      "assetPath": "assets/origin/USA.png",
      "id": 433,
      "city": "NewYork"
    }
  },
];
