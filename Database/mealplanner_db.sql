-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 15, 2021 at 02:08 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mealplanner_db`
--
CREATE DATABASE IF NOT EXISTS `mealplanner_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mealplanner_db`;

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` int(11) NOT NULL,
  `fk_user_id_id` int(11) DEFAULT NULL,
  `dish_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(750) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nutrition_facts` varchar(750) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` varchar(750) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipe` varchar(755) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `calories` int(11) NOT NULL,
  `dish_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not Approved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `fk_user_id_id`, `dish_name`, `image`, `description`, `nutrition_facts`, `ingredients`, `recipe`, `type`, `category`, `calories`, `dish_status`) VALUES
(12, 1, 'Crunchy Veggie Tacos', '1-6141c4c79a4a7.jpg', 'Mexican-Flair at Home!', '2 tacos: 22g fat (5g saturated fat), 14mg cholesterol, 770mg sodium, 47g carbohydrate (8g sugars, 10g fiber), 12g protein', '2 tablespoons canola oil, 3 cups shredded cabbage, 1 medium sweet red pepper-julienned, 1 medium onion, halved and sliced, 2 teaspoons sugar, 1 can (15 ounces) black beans, rinsed and drained, 1 cup salsa, 1 can (4 ounces) chopped green chiles, 1 teaspoon minced garlic, 1 teaspoon chili powder, 1/4 teaspoon ground cumin, 8 taco shells, warmed, 1/2 cup shredded cheddar cheese, 1 medium ripe avocado, peeled and sliced,', 'Step1: In a large skillet, heat oil over medium-high heat; saute cabbage, pepper and onion until crisp-tender, about 5 minutes. Sprinkle with sugar. 	Step2: Stir in beans, salsa, chiles, garlic, chili powder and cumin; bring to a boil. Reduce heat; simmer, covered, until flavors are blended, about 5 minutes. 	Step3: Serve in taco shells. Top with cheese and avocado.', 'Vegetarian', 'Breakfast', 430, 'Not Approved'),
(13, 1, 'Zucchini slice', '2-6141c552c34ac.jpg', 'Easy to make an healthy at the same tim', '10g Fat, 9g Protein, 333mg Sodium, 1g Sugar, 8g Carbs, 1g  Fibre', '5 eggs, 150g flour, 375g zucchini, 1 large onion, 200g rindless bacon, 1 cup cheddar cheese, 60ml oil', 'Step1: Preheat oven to 170C.  	Step2:Beat the eggs in a large bowl until combined. Add the flour and beat until smooth, then add zucchini, onion, bacon, cheese and oil and stir to combine. 	Step3: Grease and line a 30 x 20cm lamington pan. Pour into the prepared pan and bake in oven for 30 minutes or until cooked through.', 'Vegan', 'Dinner', 160, 'Approved'),
(14, 1, 'Pumpkin soup', '3-6141c5d05eeaf.jpg', 'Most common in Australia and a must have in your planer!', '15g Fat, 6g Fibre, 5g Protein, 695mg Sodium, 18g Carbs, 12g Sugar, 985kj Energie', '2tbsp olive oil, 1 onion, 1 leek, 1 gralic clove, 1/2 tsp ground coriander, 1tsp ground cumin, 1/2tsp freshly grated nutmeg, 1kg peeled pumkin, 1 large potato, 1L Massel chicken style liquid stock or vegetable liquid stock, 1/2 cup thin cream (125ml)', 'Heat oil in a large saucepan over low heat, add onion and leek and cook for 2-3 minutes, until softened but not coloured. Add garlic and spices and cook, stirring, for 30 seconds. Add pumpkin, potato and stock and bring to the boil. Turn heat to low, cover and simmer for 30 minutes. Allow to cool slightly, then blend in batches.', 'Vegan', 'Lunch', 235, 'Approved'),
(15, 1, 'Easy Pesto Pizza', '4-6141c68179ddd.jpg', 'Another way to enjoy Pizza', '1piece: 11g fat (4g saturated fat), 17mg cholesterol, 513mg sodium, 31g carbohydrate (3g sugars, 2g fiber), 12g protein', '1 loaf (1 pound) frozen bread dough-thawed, 1/2 cup shredded Parmesan cheese-divided, 1/2 teaspoon dried basil, 1/2 teaspoon dried oregano, 1/4 cup prepared pesto, 1 cup sliced fresh mushrooms, 1 cup shredded part-skim mozzarella cheese', 'Step1: Preheat oven to 425°. Place dough on a lightly floured surface; let rest for 10 minutes. Knead in 1/4 cup cheese, basil and oregano. Roll into a 12-in. circle; place on a greased 14-in. pizza pan. Prick with a fork. Bake for 10 minutes. 	Step2: Spread pesto sauce over the crust. Sprinkle with mushrooms, mozzarella cheese and remaining Parmesan cheese. Bake until golden brown, 8-10 minutes longer.', 'Vegetarian', 'Dinner', 259, 'Approved'),
(16, 1, 'Easy Jambalaya', '5-6141c75b3c71f.jpg', 'Easy andy tasty Sunday-Dish', '1-1/2 cups: 32g fat (14g saturated fat), 127mg cholesterol, 2159mg sodium, 48g carbohydrate (3g sugars, 1g fiber), 28g protein.', '1 package (8 ounces) jambalaya mix, 1 package (14 ounces) hot smoked sausage, cut into 1/2-inch slices, 1 cup uncooked shrimp (16-20 per pound), peeled and deveined, cut into 3/4-inch pieces, 3 green onions, thinly sliced, 1/2 cup shredded cheddar cheese, 1/2 cup pico de gallo', 'Prepare jambalaya mix according to package directions, adding sausage and shrimp during the last 5 minutes of cooking. Remove from the heat. Stir in cheese, pico de gallo and green onions; heat through.', 'Meat', 'Lunch', 601, 'Approved'),
(17, 12, 'Five-Cheese Ziti al Forno', '6-6141cba475835.jpg', 'Give your meal an Italian-flair!', '1 cup: 15g fat (8g saturated fat), 32mg cholesterol, 960mg sodium, 59g carbohydrate (11g sugars, 4g fiber), 21g protein.', '1-1/2 pounds (about 7-1/2 cups) uncooked ziti or small tube pasta, 2 jars (24 ounces each) marinara sauce, 1 jar (15 ounces) Alfredo sauce, 2 cups shredded part-skim mozzarella cheese, divided, 1/2 cup reduced-fat ricotta cheese, 1/2 cup shredded provolone cheese, 1/2 cup grated Romano cheese TOPPING: 1/2 cup grated Parmesan cheese, 1/2 cup panko bread crumbs, 3 garlic cloves, minced, 2 tablespoons olive oil,', 'Step1: Preheat oven to 350°. Cook the pasta according to the package directions for al dente; drain. 	Step2: Meanwhile, in a large saucepan, combine the marinara sauce, Alfredo sauce, 1 cup mozzarella and the ricotta, provolone and Romano. Cook over medium heat until sauce begins to simmer and cheeses are melted. Stir in cooked pasta; pour mixture into a greased 13x9-in. baking dish. Top with remaining mozzarella cheese. 	Step3: In a small bowl, stir together Parmesan, bread crumbs, garlic and olive oil; sprinkle over the pasta. 	Step4: Bake, uncovered, until mixture is bubbly and topping is golden brown, 30-40 minutes. Let stand 10 minutes before serving. Garnish with fresh parsley or basil if desired.', 'Meat', 'Lunch', 449, 'Approved'),
(18, 12, 'Ham & Spinach Casserole', '7-6141cc2a35a4b.jpg', 'The best compination of Ham and Veggies!', '1 serving: 13g fat (3g saturated fat), 65mg cholesterol, 2334mg sodium, 37g carbohydrate (11g sugars, 6g fiber), 28g protein.', '3 cups cubed fully cooked ham, 1 package (16 ounces) frozen sliced carrots, thawed, 1 can (10-3/4 ounces) condensed cream of potato soup, undiluted, 1 package (10 ounces) frozen creamed spinach, thawed, 1/4 cup water, 1/4 teaspoon pepper, 1/8 teaspoon salt, 1 tube (4 ounces) refrigerated crescent rolls', '3 cups cubed fully cooked ham, 1 package (16 ounces) frozen sliced carrots, thawed, 1 can (10-3/4 ounces) condensed cream of potato soup, undiluted, 1 package (10 ounces) frozen creamed spinach, thawed, 1/4 cup water, 1/4 teaspoon pepper, 1/8 teaspoon salt, 1 tube (4 ounces) refrigerated crescent rolls', 'Meat', 'Dinner', 376, 'Approved'),
(19, 12, 'Fettuccine Alfredo', '8-6141ccb06ee9a.jpg', 'Italian-kitchen can also be so easy!', '1 cup: 73g fat (45g saturated fat), 290mg cholesterol, 835mg sodium, 45g carbohydrate (5g sugars, 2g fiber), 23g protein.', '1 cup: 73g fat (45g saturated fat), 290mg cholesterol, 835mg sodium, 45g carbohydrate (5g sugars, 2g fiber), 23g protein.', 'Step1: Cook fettuccine according to package directions. Meanwhile, in a saucepan, melt butter over medium-low heat. Stir in the cream, 1/4 cup cheese, Romano cheese, egg yolk, salt, pepper and nutmeg. Cook and stir over medium-low heat until a thermometer reads 160° (do not boil). Drain fettuccine; combine with Alfredo sauce and remaining Parmesan cheese. If desired, sprinkle with parsley.', 'Vegetarian', 'Lunch', 907, 'Approved'),
(20, 12, 'Chana Masala', '9-6141cd4f98188.jpg', 'Traditional Indian kitchen at home', '8g fat (1g saturated fat), 2mg cholesterol, 616mg sodium, 64g carbohydrate (8g sugars, 9g fiber), 10g protein.', '1 tablespoon canola oil, 1/2 cup finely chopped onion, 1 tablespoon minced fresh gingerroot, 2 garlic cloves, minced, 1 jalapeno pepper, seeded and finely chopped-optional, 1/2 teaspoon salt, 1 teaspoon garam masala, 1/2 teaspoon ground coriander, 1/2 teaspoon ground cumin, 1 can (15 ounces) diced tomatoes-undrained, 1 can (15 ounces) chickpeas or garbanzo beans-rinsed and drained, 3 cups hot cooked brown rice, 1/4 cup plain yogurt, Minced fresh cilantro', 'Step1: In a large skillet, heat oil over medium heat. Add onion, ginger, garlic and, if desired, jalapeno; cook and stir until onion is softened and lightly browned, 4-5 minutes. Add salt and spices; cook and stir 1 minute. 	Step2: Stir in tomatoes and garbanzo beans; bring to a boil. Reduce heat; simmer, covered, until flavors are blended, 12-15 minutes, stirring occasionally. Serve with rice. Top with yogurt and cilantro. 	Step3:Freeze option: Freeze cooled garbanzo bean mixture in freezer containers. To use, partially thaw in refrigerator overnight. Heat through in a saucepan, stirring occasionally and adding a little water if necessary.', 'Vegan', 'Breakfast', 359, 'Approved'),
(21, 12, 'Black Bean Burritos', '10-6141cdcb47976.jpg', 'Healthy and delicious!', '16g fat (6g saturated fat), 25mg cholesterol, 610mg sodium, 46g carbohydrate (2g sugars, 7g fiber), 16g protein.', '1 tablespoon canola oil, 3 tablespoons chopped onion, 3 tablespoons chopped green pepper, 1 can (15 ounces) black beans, rinsed and drained, 4 flour tortillas (8 inches)-warmed, 1 cup shredded Mexican cheese blend, 1 medium tomato, chopped, 1 cup shredded lettuce,', 'Step1: In a nonstick skillet, heat oil over medium heat; saute onion and green pepper until tender. Stir in beans; heat through. 	Step2: Spoon about 1/2 cup of vegetable mixture off center on each tortilla. Sprinkle with the cheese, tomato and lettuce. Fold sides and ends over filling and roll up. Serve with optional toppings as desired.', 'Vegan', 'Dinner', 395, 'Approved'),
(22, 13, 'Shrimp Pad Thai', '11-6141ced2dc28d.jpg', 'Asian Food easier than thought!', '7g fat (1g saturated fat), 115mg cholesterol, 1675mg sodium, 52g carbohydrate (23g sugars, 3g fiber), 17g protein.', '4 ounces uncooked thick rice noodles, 1/2 pound uncooked small shrimp, peeled and deveined, 2 teaspoons canola oil, 1 large onion, chopped, 1 garlic clove, minced, 1 large egg, lightly beaten, 3 cups coleslaw mix, 4 green onions, thinly sliced, 1/3 cup rice vinegar, 1/4 cup sugar, 3 tablespoons reduced-sodium soy sauce, 2 tablespoons fish sauce or additional reduced-sodium soy sauce, 2 to 3 teaspoons chili garlic sauce, 2 tablespoons chopped salted peanuts, Chopped fresh cilantro leaves,', 'Step1: Cook noodles according to package directions. 	Step2: In a large nonstick skillet or wok, stir-fry shrimp in oil until shrimp turn pink; remove and set aside. Add onion and garlic to the pan. Make a well in the center of the onion mixture; add egg. Stir-fry for 2-3 minutes or until egg is completely set. 	Step3: Add the coleslaw mix, green onions, vinegar, sugar, soy sauce, fish sauce, chili garlic sauce and peanuts; heat through. Return shrimp to the pan and heat through. Drain noodles; toss with shrimp mixture. Garnish with cilantro.', 'Meat', 'Lunch', 338, 'Approved'),
(23, 13, 'Turkey Scallopini', '12-6141cf6feb0eb.jpg', 'Litte time but big appetite?', '4 ounces cooked turkey: 17g fat (10g saturated fat), 169mg cholesterol, 463mg sodium, 12g carbohydrate (1g sugars, 0 fiber), 38g protein.', '1 package (17.6 ounces) turkey breast cutlets, 1/4 cup all-purpose flour, 1/8 teaspoon salt, 1/8 teaspoon pepper, 1 large egg, 2 tablespoons water, 1 cup soft bread crumbs, 1/2 cup grated Parmesan cheese, 1/4 cup butter, cubed, Minced fresh parsley', 'Step1: Flatten turkey to 1/4-in. thickness. In a shallow bowl, combine the flour, salt and pepper. In another bowl, beat egg and water. In a third shallow bowl, combine bread crumbs and cheese. 	Step2: Dredge turkey in flour mixture, then dip in egg mixture and coat with crumbs. Let stand for 5 minutes. 	Step3: Melt butter in a large skillet over medium-high heat; cook turkey for 2-3 minutes on each side or until meat is no longer pink and coating is golden brown. Sprinkle with parsley.', 'Meat', 'Dinner', 358, 'Approved'),
(24, 13, 'Garlic Chicken with Herbs', '13-6141cfd820230.jpg', 'Round your afternoon with this dish!', '12g fat (3g saturated fat), 76mg cholesterol, 487mg sodium, 3g carbohydrate (0 sugars, 0 fiber), 22g protein.', '4 boneless skinless chicken thighs (about 1 pound), 1/2 teaspoon salt, 1/4 teaspoon pepper, 1 tablespoon butter, 10 garlic cloves, peeled and halved, 1/4 cup white wine or chicken broth, 1-1/2 teaspoons minced fresh rosemary, 1/2 teaspoon minced fresh sage, 1 cup chicken broth, Hot cooked rice of your choice', 'Step1: Sprinkle chicken with salt and pepper. In a large skillet, heat butter over medium-high heat; brown chicken on both sides. Remove from pan, reserving drippings. 	Step2: In same skillet, saute garlic in drippings over medium-high heat until light golden brown. Add wine and herbs; bring to a boil, stirring to loosen browned bits from pan. Cook until mixture is almost evaporated. Add broth and chicken; bring to a boil. Reduce heat; simmer, covered, until a thermometer inserted in chicken reads at least 170°, 10-12 minutes. 	Step3: To serve, spoon pan juices over chicken. Serve with rice.', 'Meat', 'Lunch', 214, 'Approved'),
(25, 13, 'Chocolate Malted Cookies', '14-6141d0463c69d.jpg', 'The sweet Touch to your Meal!', '18g fat (7g saturated fat), 14mg cholesterol, 172mg sodium, 47g carbohydrate (33g sugars, 2g fiber), 4g protein.', '1 cup butter-flavored shortening, 1-1/4 cups packed brown sugar, 1/2 cup malted milk powder, 2 tablespoons chocolate syrup, 1 tablespoon vanilla extract, 1 large egg, room temperature, 2 cups all-purpose flour, 1 teaspoon baking soda, 1/2 teaspoon salt, 1-1/2 cups semisweet chocolate chunks, 1 cup milk chocolate chips,', 'Step1: Preheat oven to 375°. In a large bowl, beat the shortening, brown sugar, malted milk powder, chocolate syrup and vanilla for 2 minutes. Add egg. 	Step2: Combine the flour, baking soda and salt; gradually add to creamed mixture, mixing well after each addition. Stir in chocolate chunks and chips. 	Step3: Shape into 2-in. balls; place 3 in. apart on ungreased baking sheets. Bake for 12-14 minutes or until golden brown. Cool for 2 minutes before removing to a wire rack.', 'Vegetarian', 'Breakfast', 363, 'Approved'),
(26, 13, 'Weekday Beef Stew', '15-6141d0cb96ce6.jpg', 'For the cold winter', '25g fat (8g saturated fat), 73mg cholesterol, 960mg sodium, 65g carbohydrate (10g sugars, 9g fiber), 32g protein.', 'sheet frozen puff pastry-thawed, 1 package (15 ounces) refrigerated beef roast au jus, 2 cans (14-1/2 ounces each) diced tomatoes, undrained, 1 package (16 ounces) frozen vegetables for stew, 3/4 teaspoon pepper, 2 tablespoons cornstarch, 1-1/4 cups water', 'Step1: Preheat oven to 400°. Unfold puff pastry. Using a 4-in. round cookie cutter, cut out 4 circles. Place 2 in. apart on a greased baking sheet. Bake until golden brown, 14-16 minutes. 	Step2: Meanwhile, shred beef with 2 forks; transfer to a large saucepan. Add tomatoes, vegetables and pepper; bring to a boil. In a small bowl, mix cornstarch and water until smooth; stir into beef mixture. Return to a boil, stirring constantly; cook and stir until thickened, 1-2 minutes.', 'Vegan', 'Lunch', 604, 'Not Approved');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210907091954', '2021-09-07 11:20:02', 39);

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `id` int(11) NOT NULL,
  `fk_user_id_id` int(11) NOT NULL,
  `fk_dish_id_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`, `avatar`) VALUES
(1, 'user@gmail.com', '[]', '$2y$13$uaiYUf7//n4RAvWAkmkh9uYivtTct4lPUVvAH5nQRXUQQC3hPnVEW', 'Jacob', 'avatar-6141e0dea66b6.png'),
(8, 'admin@mail.com', '[\"ROLE_ADMIN\"]', '$2y$13$owtYfBLLfg8K5gM.dgC9wOXt1RNNJunNko.aYh/roOLodTtuKN2gG', 'admin', 'avatar-614070193545f.png'),
(12, 'doe@mail.com', '[]', '$2y$13$ysea0jEPSTmXyMXLbJWR6.3RQwndNoUH00P73CMiD.KuyNdgJImM6', 'Doe', 'avatar-6141b43da3a1f.png'),
(13, 'thomas@mail.com', '[]', '$2y$13$jHzDv4MGe9cGP8zBWBt98.tdsyqwY/1TlotN77YVhT.xK1b9Ct3dq', 'Thomas', 'avatar2-6141b4fcaa9dc.png'),
(14, 'testblock@mail.com', '[\"ROLE_BLOCKED\"]', '$2y$13$0Ff.IM8hYF0eZCM8rg8u8.CzQC5Nm/Mj8LW98EP5KWKt9BGakLCRC', 'Block', 'avatar2-6141b59b9dcc7.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_584DD35D6DE8AF9C` (`fk_user_id_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E229E6EA6DE8AF9C` (`fk_user_id_id`),
  ADD KEY `IDX_E229E6EAE5107689` (`fk_dish_id_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `FK_584DD35D6DE8AF9C` FOREIGN KEY (`fk_user_id_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `meals`
--
ALTER TABLE `meals`
  ADD CONSTRAINT `FK_E229E6EA6DE8AF9C` FOREIGN KEY (`fk_user_id_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_E229E6EAE5107689` FOREIGN KEY (`fk_dish_id_id`) REFERENCES `dishes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
