-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Sep 2021 um 14:53
-- Server-Version: 10.4.20-MariaDB
-- PHP-Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mealplanner_db`
--
CREATE DATABASE IF NOT EXISTS `mealplanner_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mealplanner_db`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dishes`
--

CREATE TABLE `dishes` (
  `id` int(11) NOT NULL,
  `fk_user_id_id` int(11) DEFAULT NULL,
  `dish_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nutrition_facts` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipe` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calories` int(11) NOT NULL,
  `dish_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `dishes`
--

INSERT INTO `dishes` (`id`, `fk_user_id_id`, `dish_name`, `image`, `description`, `nutrition_facts`, `ingredients`, `recipe`, `type`, `category`, `calories`, `dish_status`) VALUES
(5, 1, 'Macarons', 'macarons-2548827_1280-6138ef7ecd430.jpg', 'Heavenly fancy cookies that I\'ve never tried.', 'Once you eat one you get a french accent', 'Sugar, Almond Flour, salt, egg whites etc..', 'Open the pastry box, place them on a plate, tell everyone you made them!', 'Vegan', 'Dessert', 173, 'yee'),
(6, NULL, 'Crunchy Veggie Tacos', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Veggie-Tacos_EXPS_SDFM17_32191_C10_06_5b-3.jpg?w=1200', 'Mexican-Flair at Home!', '2 tacos: 22g fat (5g saturated fat), 14mg cholesterol, 770mg sodium, 47g carbohydrate (8g sugars, 10g fiber), 12g protein.', '2 tablespoons canola oil, 3 cups shredded cabbage, 1 medium sweet red pepper-julienned, 1 medium onion, halved and sliced, 2 teaspoons sugar, 1 can (15 ounces) black beans, rinsed and drained, 1 cup salsa, 1 can (4 ounces) chopped green chiles, 1 teaspoon', 'Step1: In a large skillet, heat oil over medium-high heat; saute cabbage, pepper and onion until crisp-tender, about 5 minutes. Sprinkle with sugar.\r\nStep2: Stir in beans, salsa, chiles, garlic, chili powder and cumin; bring to a boil. Reduce heat; simmer', '', 'Snack', 430, ''),
(7, NULL, 'Zucchini slice', '', 'Easy to make an healthy at the same time', '10g Fat, 9g Protein, 333mg Sodium, 1g Sugar, 8g Carbs, 1g  Fibre', '5 eggs, 150g flour, 375g zucchini, 1 large onion, 200g rindless bacon, 1 cup cheddar cheese, 60ml oil', 'Step1: Preheat oven to 170C. \r\nStep2:Beat the eggs in a large bowl until combined. Add the flour and beat until smooth, then add zucchini, onion, bacon, cheese and oil and stir to combine.\r\nStep3: Grease and line a 30 x 20cm lamington pan. Pour into the p', '', 'Snack', 160, ''),
(8, NULL, 'Pumpkin soup', 'https://img.taste.com.au/UsHF1xqD/w720-h480-cfill-q80/taste/2016/11/pumpkin-soup-9530-1.jpeg', 'Most common in Australia and a must have in your planer!', '15g Fat, 6g Fibre, 5g Protein, 695mg Sodium, 18g Carbs, 12g Sugar, 985kj Energie', '2tbsp olive oil, 1 onion, 1 leek, 1 gralic clove, 1/2 tsp ground coriander, 1tsp ground cumin, 1/2tsp freshly grated nutmeg, 1kg peeled pumkin, 1 large potato, 1L Massel chicken style liquid stock or vegetable liquid stock, 1/2 cup thin cream (125ml)', 'Step1: Heat oil in a large saucepan over low heat, add onion and leek and cook for 2-3 minutes, until softened but not coloured. Add garlic and spices and cook, stirring, for 30 seconds. Add pumpkin, potato and stock and bring to the boil. Turn heat to lo', '', 'Soup', 235, ''),
(9, NULL, 'Easy Pesto Pizza', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Easy-Pesto-Pizza_EXPS_TOHAM21_18813_B12_01_4b.jpg?fit=700,1024', 'Another way to enjoy Pizza', '1piece: 11g fat (4g saturated fat), 17mg cholesterol, 513mg sodium, 31g carbohydrate (3g sugars, 2g fiber), 12g protein', '1 loaf (1 pound) frozen bread dough-thawed, 1/2 cup shredded Parmesan cheese-divided, 1/2 teaspoon dried basil, 1/2 teaspoon dried oregano, 1/4 cup prepared pesto, 1 cup sliced fresh mushrooms, 1 cup shredded part-skim mozzarella cheese', 'Step1: Preheat oven to 425°. Place dough on a lightly floured surface; let rest for 10 minutes. Knead in 1/4 cup cheese, basil and oregano. Roll into a 12-in. circle; place on a greased 14-in. pizza pan. Prick with a fork. Bake for 10 minutes.\r\n\r\nStep2: S', '', 'Pizza', 259, ''),
(10, NULL, 'Easy Jambalaya', 'https://www.tasteofhome.com/wp-content/uploads/2019/10/Easy-Jambalaya_EXPS_TOHFM20_241013_B09_20_2b-2.jpg?fit=700,1024', 'Easy andy tasty Sunday-Dish', '1-1/2 cups: 32g fat (14g saturated fat), 127mg cholesterol, 2159mg sodium, 48g carbohydrate (3g sugars, 1g fiber), 28g protein.', '1 package (8 ounces) jambalaya mix, 1 package (14 ounces) hot smoked sausage, cut into 1/2-inch slices, 1 cup uncooked shrimp (16-20 per pound), peeled and deveined, cut into 3/4-inch pieces, 3 green onions, thinly sliced, 1/2 cup shredded cheddar cheese,', 'Step1: Prepare jambalaya mix according to package directions, adding sausage and shrimp during the last 5 minutes of cooking. Remove from the heat. Stir in cheese, pico de gallo and green onions; heat through.', '', 'Rice', 601, ''),
(11, NULL, 'Five-Cheese Ziti al Forno', '//www.tasteofhome.com/wp-content/uploads/2019/07/Five-Cheese-Ziti-al-Forno_EXPS_THAS19_237475_B04_17_7b-19.jpg?fit=700,1024', 'Give your meal an Italian-flair!', '1 cup: 15g fat (8g saturated fat), 32mg cholesterol, 960mg sodium, 59g carbohydrate (11g sugars, 4g fiber), 21g protein.', '1-1/2 pounds (about 7-1/2 cups) uncooked ziti or small tube pasta, 2 jars (24 ounces each) marinara sauce, 1 jar (15 ounces) Alfredo sauce, 2 cups shredded part-skim mozzarella cheese, divided, 1/2 cup reduced-fat ricotta cheese, 1/2 cup shredded provolon', 'Step1: Preheat oven to 350°. Cook the pasta according to the package directions for al dente; drain.\r\nStep2: Meanwhile, in a large saucepan, combine the marinara sauce, Alfredo sauce, 1 cup mozzarella and the ricotta, provolone and Romano. Cook over mediu', '', 'Baked-nudels', 449, ''),
(12, NULL, 'Ham & Spinach Casserole', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Ham-Spinach-Casserole_EXPS_BFCBBZ19_45173_E01_11_2b.jpg?w=1200', 'The best compination of Ham and Veggies!', '1 serving: 13g fat (3g saturated fat), 65mg cholesterol, 2334mg sodium, 37g carbohydrate (11g sugars, 6g fiber), 28g protein.', '3 cups cubed fully cooked ham, 1 package (16 ounces) frozen sliced carrots, thawed, 1 can (10-3/4 ounces) condensed cream of potato soup, undiluted, 1 package (10 ounces) frozen creamed spinach, thawed, 1/4 cup water, 1/4 teaspoon pepper, 1/8 teaspoon sal', 'Step1: In a large skillet coated with cooking spray, cook ham over medium heat until lightly browned. Stir in the carrots, soup, spinach, water, pepper and salt; heat through. Pour into a greased 8-in. square baking dish.\r\n\r\nStep2: Unroll crescent dough; ', '', 'Casserole', 376, ''),
(13, NULL, 'Fettuccine Alfredo', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Homemade-Fettuccini-Alfredo_EXPS_TOHAM21_21260_B12_02_13b-1.jpg?fit=700,1024', 'Italian-kitchen can also be so easy!', '1 cup: 73g fat (45g saturated fat), 290mg cholesterol, 835mg sodium, 45g carbohydrate (5g sugars, 2g fiber), 23g protein.', ' 4 ounces uncooked fettuccine, 3 tablespoons butter, 1 cup heavy whipping cream, 1/4 cup plus 2 tablespoons grated Parmesan cheese-divided, 1/4 cup grated Romano cheese, 1 large egg yolk, lightly beaten, 1/8 teaspoon salt, Dash each pepper and ground nutm', 'Step1: Cook fettuccine according to package directions. Meanwhile, in a saucepan, melt butter over medium-low heat. Stir in the cream, 1/4 cup cheese, Romano cheese, egg yolk, salt, pepper and nutmeg. Cook and stir over medium-low heat until a thermometer', '', 'Nudels', 907, ''),
(14, NULL, 'Chana Masala', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Easy-Chana-Masala_EXPS_SDON17_175124_B06_30_3b-3.jpg?fit=700,1024', 'Traditional Indian kitchen at home', '0.750 cup garbanzo bean mixture with 3/4 cup rice: 8g fat (1g saturated fat), 2mg cholesterol, 616mg sodium, 64g carbohydrate (8g sugars, 9g fiber), 10g protein.', '1 tablespoon canola oil, 1/2 cup finely chopped onion, 1 tablespoon minced fresh gingerroot, 2 garlic cloves, minced, 1 jalapeno pepper, seeded and finely chopped-optional, 1/2 teaspoon salt, 1 teaspoon garam masala, 1/2 teaspoon ground coriander, 1/2 tea', 'Step1: In a large skillet, heat oil over medium heat. Add onion, ginger, garlic and, if desired, jalapeno; cook and stir until onion is softened and lightly browned, 4-5 minutes. Add salt and spices; cook and stir 1 minute.\r\nStep2: Stir in tomatoes and ga', '', 'Rice', 359, ''),
(15, NULL, 'Black Bean Burritos', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Black-Bean-Burritos_EXPS_SDJJ18_11231_B02_08_2b-2.jpg?fit=700,1024', 'Healthy and delicious!', '1 burrito: 16g fat (6g saturated fat), 25mg cholesterol, 610mg sodium, 46g carbohydrate (2g sugars, 7g fiber), 16g protein.', '1 tablespoon canola oil, 3 tablespoons chopped onion, 3 tablespoons chopped green pepper, 1 can (15 ounces) black beans, rinsed and drained, 4 flour tortillas (8 inches)-warmed, 1 cup shredded Mexican cheese blend, 1 medium tomato, chopped, 1 cup shredded', 'Step1: In a nonstick skillet, heat oil over medium heat; saute onion and green pepper until tender. Stir in beans; heat through.\r\nStep2: Spoon about 1/2 cup of vegetable mixture off center on each tortilla. Sprinkle with the cheese, tomato and lettuce. Fo', '', 'Sandwich', 395, ''),
(16, NULL, 'Shrimp Pad Thai', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Shrimp-Pad-Thai_EXPS_THN18_45967_D05_23_6b-6.jpg?fit=700,1024', 'Asian Food easier than thought!', '1-1/4 cups: 7g fat (1g saturated fat), 115mg cholesterol, 1675mg sodium, 52g carbohydrate (23g sugars, 3g fiber), 17g protein.', '4 ounces uncooked thick rice noodles, 1/2 pound uncooked small shrimp, peeled and deveined, 2 teaspoons canola oil, 1 large onion, chopped, 1 garlic clove, minced, 1 large egg, lightly beaten, 3 cups coleslaw mix, 4 green onions, thinly sliced, 1/3 cup ri', 'Step1: Cook noodles according to package directions.\r\nStep2: In a large nonstick skillet or wok, stir-fry shrimp in oil until shrimp turn pink; remove and set aside. Add onion and garlic to the pan. Make a well in the center of the onion mixture; add egg.', '', 'Nudels', 338, ''),
(17, NULL, 'Turkey Scallopini', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Turkey-Scallopini_EXPS_SDAM19_12514_B12_11_2b-4.jpg?fit=700,1024', 'Litte time but big appetite?', '4 ounces cooked turkey: 17g fat (10g saturated fat), 169mg cholesterol, 463mg sodium, 12g carbohydrate (1g sugars, 0 fiber), 38g protein.', '1 package (17.6 ounces) turkey breast cutlets, 1/4 cup all-purpose flour, 1/8 teaspoon salt, 1/8 teaspoon pepper, 1 large egg, 2 tablespoons water, 1 cup soft bread crumbs, 1/2 cup grated Parmesan cheese, 1/4 cup butter, cubed, Minced fresh parsley', 'Step1: Flatten turkey to 1/4-in. thickness. In a shallow bowl, combine the flour, salt and pepper. In another bowl, beat egg and water. In a third shallow bowl, combine bread crumbs and cheese.\r\nStep2: Dredge turkey in flour mixture, then dip in egg mixtu', '', 'Fried-chicken', 358, ''),
(18, NULL, 'Garlic Chicken with Herbs', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Garlic-Chicken-with-Herbs_EXPS_SDAM17_179241_C12_08_2b.jpg?fit=700,1024', 'Round your afternoon with this dish!', '1 serving: 12g fat (3g saturated fat), 76mg cholesterol, 487mg sodium, 3g carbohydrate (0 sugars, 0 fiber), 22g protein.', '4 boneless skinless chicken thighs (about 1 pound), 1/2 teaspoon salt, 1/4 teaspoon pepper, 1 tablespoon butter, 10 garlic cloves, peeled and halved, 1/4 cup white wine or chicken broth, 1-1/2 teaspoons minced fresh rosemary, 1/2 teaspoon minced fresh sag', 'Step1: Sprinkle chicken with salt and pepper. In a large skillet, heat butter over medium-high heat; brown chicken on both sides. Remove from pan, reserving drippings.\r\nStep2: In same skillet, saute garlic in drippings over medium-high heat until light go', '', 'Rice ', 214, ''),
(19, NULL, 'Chocolate Malted Cookies', 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Chocolate-Malted-Cookies_EXPS_HCCBZ19_1304_E04_30_9b-2.jpg?fit=700,1024', 'The sweet Touch to your Meal!', '1 cookie: 18g fat (7g saturated fat), 14mg cholesterol, 172mg sodium, 47g carbohydrate (33g sugars, 2g fiber), 4g protein.', '1 cup butter-flavored shortening, 1-1/4 cups packed brown sugar, 1/2 cup malted milk powder, 2 tablespoons chocolate syrup, 1 tablespoon vanilla extract, 1 large egg, room temperature, 2 cups all-purpose flour, 1 teaspoon baking soda, 1/2 teaspoon salt, 1', 'Step1: Preheat oven to 375°. In a large bowl, beat the shortening, brown sugar, malted milk powder, chocolate syrup and vanilla for 2 minutes. Add egg.\r\nStep2: Combine the flour, baking soda and salt; gradually add to creamed mixture, mixing well after ea', '', 'Sweet', 363, ''),
(20, NULL, 'Weekday Beef Stew', '//www.tasteofhome.com/wp-content/uploads/2018/01/exps50887_TH153345B07_24_9b-10.jpg?fit=700,1024', 'For the cold winter', '1-1/2 cups with 1 pastry round: 25g fat (8g saturated fat), 73mg cholesterol, 960mg sodium, 65g carbohydrate (10g sugars, 9g fiber), 32g protein.', 'sheet frozen puff pastry-thawed, 1 package (15 ounces) refrigerated beef roast au jus, 2 cans (14-1/2 ounces each) diced tomatoes, undrained, 1 package (16 ounces) frozen vegetables for stew, 3/4 teaspoon pepper, 2 tablespoons cornstarch, 1-1/4 cups water', 'Step1: Preheat oven to 400°. Unfold puff pastry. Using a 4-in. round cookie cutter, cut out 4 circles. Place 2 in. apart on a greased baking sheet. Bake until golden brown, 14-16 minutes.\r\nStep2: Meanwhile, shred beef with 2 forks; transfer to a large sau', '', 'Stew', 604, ''),
(21, NULL, 'Burger Sliders', 'https://www.tasteofhome.com/wp-content/uploads/2021/03/Burger-Sliders-with-Secret-Sauce_EXPS_MTBZ21_260175_B03_11_2b-1.jpg?fit=700,1024', 'Home Made Burger Sliders to enjoy your Evening!', '1 slider: 21g fat (8g saturated fat), 105mg cholesterol, 785mg sodium, 26g carbohydrate (6g sugars, 2g fiber), 22g protein.', '2 pounds ground beef, 2 large eggs, beaten, 3/4 cup minced onion, divided, 2 teaspoons garlic powder, 1 teaspoon salt, 1 teaspoon pepper, 1 package (17 ounces) dinner rolls, 1/2 cup Thousand Island salad dressing, divided, 10 slices American cheese, 12 sl', 'Step1: Preheat oven to 350°. In a large bowl, mix beef, eggs, 1/2 cup minced onion, garlic powder, salt and pepper just until combined; do not overmix. Place meat mixture on a large, parchment-lined baking sheet; shape into two, 6x8-in. rectangles, each a', '', 'Burger', 397, ''),
(22, NULL, 'Luscious lemon baked cheesecake', '//images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-22204_10-836d350.jpg?quality=90&webp=true&resize=300,272', 'A simple but very impressive pud, light enough to have a slice to finish a big meal', 'fat57g, saturates34g, carbs43g, sugars25g, fibre0g, protein7g, salt1.08g', '225g digestive biscuits\r\n100g butter, melted\r\n250g tub mascarpone\r\n600g soft cheese\r\n2 eggs, plus 2 yolks\r\nzest 3 lemons, juice of 1\r\n4 tbsp plain flour\r\n175g caster sugar\r\n½ a 284ml pot soured cream\r\n3 tbsp lemon curd', 'Heat oven to 180C/fan 160C/gas 4. Line the bottom of a 23cm springform tin with greaseproof paper. Tip the biscuits and melted butter into a food processor, then blitz to make fine crumbs. Press into the tin and chill.\r\nWhisk all the other ingredients in ', '', 'Sweet', 705, ''),
(23, NULL, 'Teriyaki salmon & green beans', 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/teriyaki-salmon-green-beans-e15a777.jpg?quality=90&webp=true&resize=300,272', 'Buy a whole piece of salmon for this traybake if you\'re feeding a family and cut into adult and children-sized portions. It\'s cooked in a delicious teriyaki sauce', 'fat15g, saturates3g, carbs9g, sugars5g, fibre1g, protein28g, salt0.8g', '4 salmon fillets\r\n100g green beans , ends trimmed\r\n1 lemon , cut into wedges\r\n2 tbsp low-salt soy sauce\r\n1 tbsp honey\r\n1 tbsp mirin\r\n1 garlic clove , crushed', 'Heat oven to 180C/160C fan/gas 4. If you have a whole piece of salmon, cut it into four fillets. Place a sheet of baking parchment on a baking tray and lay the salmon diagonally across it.\r\nCook the beans in boiling water for 1 min and drain. Arrange the ', '', 'Fish', 288, ''),
(24, NULL, 'Chorizo & mozzarella gnocchi bake', 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/gnocchi-1d16725.jpg?quality=90&webp=true&resize=300,272', 'Upgrade cheesy tomato pasta with gnocchi, chorizo and mozzarella for a comforting bake that makes an excellent midweek meal', 'fat 13g, saturates 6g, carbs 36g, sugars 8g, fibre 4g, protein 13g, salt 1.7g', '1 tbsp olive oil \r\n1 onion , finely chopped\r\n2 garlic cloves , crushed\r\n120g chorizo , diced\r\n2 x 400g cans chopped tomatoes\r\n1 tsp caster sugar\r\n600g fresh gnocchi\r\n125g mozzarella ball, cut into chunks\r\nsmall bunch of basil , torn\r\ngreen salad , to serv', 'Heat the oil in a medium pan over a medium heat. Fry the onion and garlic for 8-10 mins until soft.\r\nAdd the chorizo and fry for 5 mins more. Tip in the tomatoes and sugar, and season. Bring to a simmer, then add the gnocchi and cook for 8 mins, stirring ', '', 'Pasta', 318, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210907091954', '2021-09-07 11:20:02', 39),
('DoctrineMigrations\\Version20210914090808', '2021-09-14 11:08:22', 2231);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `meals`
--

CREATE TABLE `meals` (
  `id` int(11) NOT NULL,
  `fk_user_id_id` int(11) NOT NULL,
  `fk_dish_id_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`, `avatar`) VALUES
(1, 'user@gmail.com', '[]', '$2y$13$uaiYUf7//n4RAvWAkmkh9uYivtTct4lPUVvAH5nQRXUQQC3hPnVEW', 'trial1', ''),
(2, 'mealadmin@mail.com', '[\"ROLE_ADMIN\"]', '$2y$13$SkiF2S.tRgA98107s7Q1C.nyOm5lREgc0pN9Mcb/d8iT8D1wazE0u', 'trial2', 'girl-1867092_1280-613f1a93389fa.jpg'),
(3, 'test@mail.com', '[\"ROLE_BLOCKED\"]', '$2y$13$WKCIfle37G3cXp0dC50F5O5Rfhcq6U4p8H3v0ZTxE2iITkQeCaeOO', 'hi', 'image.jpg'),
(4, 'test2@mail.com', '[]', '$2y$13$LXfymmQAe8aRxcaeh.BNienVjZ91MTtH/5yCMNCCUM1FSCIzdUUIO', 'test2@mail.com', 'https://www.w3schools.com/howto/img_avatar.png'),
(5, 'admin@mail.com', '[]', '$2y$13$7eiJFdTqP41FhznQGcLuS.CekkUyr8iOrcsohUTrP1aSdeO2W/Umi', 'the admin', 'https://cdn.pixabay.com/photo/2014/03/25/17/01/key-297850_960_720.png'),
(6, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$Xd0k9/o0dVpHjAxJiY8tE.y1jBbyfPqmmfZTnR4UsXtx2/czWKgm2', 'the admin', 'https://cdn.pixabay.com/photo/2014/03/25/17/01/key-297850_960_720.png');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_584DD35D6DE8AF9C` (`fk_user_id_id`);

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E229E6EA6DE8AF9C` (`fk_user_id_id`),
  ADD KEY `IDX_E229E6EAE5107689` (`fk_dish_id_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT für Tabelle `meals`
--
ALTER TABLE `meals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `FK_584DD35D6DE8AF9C` FOREIGN KEY (`fk_user_id_id`) REFERENCES `user` (`id`);

--
-- Constraints der Tabelle `meals`
--
ALTER TABLE `meals`
  ADD CONSTRAINT `FK_E229E6EA6DE8AF9C` FOREIGN KEY (`fk_user_id_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_E229E6EAE5107689` FOREIGN KEY (`fk_dish_id_id`) REFERENCES `dishes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
