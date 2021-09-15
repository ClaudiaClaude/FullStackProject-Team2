<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\String\Slugger\SluggerInterface;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use App\Entity\Dishes;
use App\Entity\User;

class MealPlannerController extends AbstractController
{

    #[Route('/', name: 'meal_planner')]
    
    public function index(): Response
    {
        
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $dishes = $this->getDoctrine()->getRepository(Dishes::class)->findBy(["dish_status" => "Approved"]);;

        return $this->render('meal_planner/index.html.twig', [
            "dishes" => $dishes
        ]);
    }

    #[Route('/create', name: 'dish-create')]
    public function create(Request $request): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $dish = new Dishes();
        $form = $this->createFormBuilder($dish)
            ->add("dish_name", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("image", FileType::class, array('attr'=>array("class"=>"form-control", "style"=>"margin-bottom:15px"), 'label' => 'Image (png/jpg file)', 'mapped'=> false, 'required'=> false, 'constraints'=>[ new File(['maxSize' =>'2048k', 'mimeTypes' => ['image/*'], 'mimeTypesMessage' =>'Please upload a valid image document',])]))
            ->add("description", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("nutrition_facts", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("ingredients", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("recipe", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("type", ChoiceType::class, [ 'attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),
                'choices' => [
                    'Vegan' => 'Vegan',
                    'Vegetarian' => 'Vegetarian',
                    'Meat' => 'Meat'
                ]
            ], array('choice_attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("category", ChoiceType::class, [ 'attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),
                'choices' => [
                    'Breakfast' => 'Breakfast',
                    'Lunch' => 'Lunch',
                    'Dinner' => 'Dinner',
                ]
            ] )
            ->add("calories", NumberType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("dish_status", ChoiceType::class, [ 'attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),
                'choices' => [
                    'Not Approved' => 'Not Approved',
                ]
            ] )
            ->add('fk_user_id', EntityType::class, [ 'attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),
                'class' => User::class,
                'choice_label' => 'username',
            ])

            ->add("save", SubmitType::class, array('attr' => array("class" => "btn btn-success", "style" => "margin-bottom: 15px; margin-top: 15px;"), "label" => "Submit"))->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            
            $dish_name = $form["dish_name"]->getData();
            $image = $form["image"]->getData();
            $description = $form["description"]->getData();
            $nutrition_facts = $form["nutrition_facts"]->getData();
            $ingredients = $form["ingredients"]->getData();
            $recipe = $form["recipe"]->getData();
            $type = $form["type"]->getData();
            $category = $form["category"]->getData();
            $calories = $form["calories"]->getData();
            $dish_status = $form["dish_status"]->getData();
       
            if ($image){
                $originalFilename = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $originalFilename;
                $newFilename = $safeFilename.'-'.uniqid().'.'.$image->guessExtension();
                try {
                    $image->move($this->getParameter('picture_directory'), $newFilename);
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                }
                $dish->setImage($newFilename);
            }



            $dish->setDishName($dish_name);
            // $dish->setImage($image);
            $dish->setDescription($description);
            $dish->setNutritionFacts($nutrition_facts);
            $dish->setIngredients($ingredients);
            $dish->setRecipe($recipe);
            $dish->setType($type);
            $dish->setCategory($category);
            $dish->setCalories($calories);
            $dish->setDishStatus($dish_status);
           

            $em = $this->getDoctrine()->getManager();

            $em->persist($dish);
            $em->flush();

            $this->addFlash('notice', 'Event added');

            return $this->redirectToRoute('meal_planner');
        }

        return $this->render('meal_planner/create.html.twig', [
            "form" => $form->createView()
        ]);
    }

    #[Route('/details/{id}', name: 'dish-details')]
    public function details($id): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $dish = $this->getDoctrine()->getRepository(Dishes::class)->find($id);
        return $this->render('meal_planner/details.html.twig', [
            "dish" => $dish
        ]);
    }

    #[Route('/delete/{id}', name: 'dish-delete')]
    public function delete($id): Response
    {

        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $em = $this->getDoctrine()->getManager();
        $event = $em->getRepository(Dishes::class)->find($id);
        $em->remove($event);
        $em->flush();

        $this->addFlash("notice", "Dish removed");

        return $this->redirectToRoute("meal_planner");
    }

    #[Route('/edit/{id}', name: 'dish-edit')]
    public function  edit($id, Request $request): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $dish = $this->getDoctrine()->getRepository(Dishes::class)->find($id);
        $form = $this->createFormBuilder($dish)
            ->add("dish_name", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("image", FileType::class, array('attr'=>array("class"=>"form-control", "style"=>"margin-bottom:15px"), 'label' => 'Image (png/jpg file)', 'mapped'=> false, 'required'=> false, 'constraints'=>[ new File(['maxSize' =>'2048k', 'mimeTypes' => ['image/*'], 'mimeTypesMessage' =>'Please upload a valid image document',])]))
            ->add("description", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("nutrition_facts", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("ingredients", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("recipe", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("type", ChoiceType::class, ['attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),
                'choices' => [ 
                    'Vegan' => 'Vegan',
                    'Vegetarian' => 'Vegetarian',
                    'Meat' => 'Meat'
                ]
            ] )
            ->add("category", ChoiceType::class, [ 'attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),
                'choices' => [
                    'Breakfast' => 'Breakfast',
                    'Lunch' => 'Lunch',
                    'Dinner' => 'Dinner',
                ]
            ] )
            ->add("calories", NumberType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("dish_status", TextType::class, ['attr' => array("class" => "form-control", "style" => "margin-bottom: 15px; pointer-events:none")])
               
            
            ->add('fk_user_id', EntityType::class, [ 'attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),
                'class' => User::class,
                'choice_label' => 'username',
            ])

            ->add("save", SubmitType::class, array('attr' => array("class" => "btn btn-success", "style" => "margin-bottom: 15px; margin-top: 15px;"), "label" => "Submit"))->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $dish_name = $form["dish_name"]->getData();
            $image = $form["image"]->getData();
            $description = $form["description"]->getData();
            $nutrition_facts = $form["nutrition_facts"]->getData();
            $ingredients = $form["ingredients"]->getData();
            $recipe = $form["recipe"]->getData();
            $type = $form["type"]->getData();
            $category = $form["category"]->getData();
            $calories = $form["calories"]->getData();
            $dish_status = $form["dish_status"]->getData();
       

            if ($image){
                $originalFilename = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $originalFilename;
                $newFilename = $safeFilename.'-'.uniqid().'.'.$image->guessExtension();
                try {
                    $image->move($this->getParameter('picture_directory'), $newFilename);
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                }
                $dish->setImage($newFilename);
            }


            $dish->setDishName($dish_name);
            // $dish->setImage($image);
            $dish->setDescription($description);
            $dish->setNutritionFacts($nutrition_facts);
            $dish->setIngredients($ingredients);
            $dish->setRecipe($recipe);
            $dish->setType($type);
            $dish->setCategory($category);
            $dish->setCalories($calories);
            $dish->setDishStatus($dish_status);

            $em = $this->getDoctrine()->getManager();

            $em->persist($dish);
            $em->flush();


            $this->addFlash('notice', 'Dish edited');

            return $this->redirectToRoute('meal_planner');
        }

        return $this->render('meal_planner/edit.html.twig', [
            "form" => $form->createView()
        ]);
    }

    #[Route('/block', name: 'block')]
    public function block(): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
      
       

        return $this->render('meal_planner/block.html.twig', [
            
        ]);
    }

    #[Route('/profile/{id}', name: 'profile')]
    public function  profile($id, Request $request): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $user = $this->getDoctrine()->getRepository(User::class)->find($id);
        $form = $this->createFormBuilder($user)
            ->add("email", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            // ->add("roles", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("password", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("username", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("avatar", FileType::class, array('attr'=>array("class"=>"form-control", "style"=>"margin-bottom:15px"), 'label' => 'Image (png/jpg file)', 'mapped'=> false, 'required'=> false, 'constraints'=>[ new File(['maxSize' =>'2048k', 'mimeTypes' => ['image/*'], 'mimeTypesMessage' =>'Please upload a valid image document',])]))
            // ->add("avatar", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
         

            ->add("save", SubmitType::class, array('attr' => array("class" => "btn btn-success", "style" => "margin-bottom: 15px; margin-top: 15px;"), "label" => "Submit"))->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $email = $form["email"]->getData();
            // $roles = $form["roles"]->getData();
            $password = $form["password"]->getData();
            $username = $form["username"]->getData();
            $avatar = $form["avatar"]->getData();

            if ($avatar){
                $originalFilename = pathinfo($avatar->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $originalFilename;
                $newFilename = $safeFilename.'-'.uniqid().'.'.$avatar->guessExtension();
                try {
                    $avatar->move($this->getParameter('user_picture_directory'), $newFilename);
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                }
                $user->setAvatar($newFilename);
            }

            $user->setEmail($email);
            // $user->setRoles($roles);
            $user->setPassword($password);
            $user->setUsername($username);
            // $user->setAvatar($avatar);
            

            $em = $this->getDoctrine()->getManager();

            $em->persist($user);
            $em->flush();


            $this->addFlash('notice', 'User edited');

            return $this->redirectToRoute('meal_planner');
        }

        return $this->render('meal_planner/profile.html.twig', [
            "form" => $form->createView()
        ]);

       
    }

    #[Route('/dashboard', name: 'dashboard')]
    public function dashboard(): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $users = $this->getDoctrine()->getRepository(User::class)->findAll();

        return $this->render('meal_planner/dashboard.html.twig', [
            "users" => $users
        ]);
    }

    #[Route('/remove/{id}', name: 'remove-profile')]
    public function remove($id): Response
    {

        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $em = $this->getDoctrine()->getManager();
        $user = $em->getRepository(User::class)->find($id);
        $em->remove($user);
        $em->flush();

        $this->addFlash("notice", "User removed");

        return $this->redirectToRoute("dashboard");
    }

    #[Route('/mydishes/{id}', name: 'mydishes')]
    public function mydishes($id): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $dishes = $this->getDoctrine()->getRepository("App:Dishes")->findBy(["fk_user_id" => $id]);
        $users = $this->getDoctrine()->getRepository(User::class)->find($id);
        return $this->render("meal_planner/mydishes.html.twig", [
            "users" => $users,
            "dishes" => $dishes
        ]);
    }

    #[Route('/editstatus/{id}', name: 'dish-status')]
    public function  editstatus($id, Request $request): Response
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $dish = $this->getDoctrine()->getRepository(Dishes::class)->find($id);
        $form = $this->createFormBuilder($dish)
            ->add("dish_name", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("image", FileType::class, array('attr'=>array("class"=>"form-control", "style"=>"margin-bottom:15px"), 'label' => 'Image (png/jpg file)', 'mapped'=> false, 'required'=> false, 'constraints'=>[ new File(['maxSize' =>'2048k', 'mimeTypes' => ['image/*'], 'mimeTypesMessage' =>'Please upload a valid image document',])]))
            ->add("description", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("nutrition_facts", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("ingredients", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("recipe", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("type", ChoiceType::class, ['attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),
                'choices' => [ 
                    'Vegan' => 'Vegan',
                    'Vegetarian' => 'Vegetarian',
                    'Meat' => 'Meat'
                ]
            ] )
            ->add("category", ChoiceType::class, [ 'attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),
                'choices' => [
                    'Breakfast' => 'Breakfast',
                    'Lunch' => 'Lunch',
                    'Dinner' => 'Dinner',
                ]
            ] )
            ->add("calories", NumberType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("dish_status", ChoiceType::class, ['attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),
                'choices' => [ 
                    'Not Approved' => 'Not Approved',
                    'Approved' => 'Approved'

                    
                ]
            ] )
            
            ->add('fk_user_id', EntityType::class, [ 'attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),
                'class' => User::class,
                'choice_label' => 'username',
            ])

            ->add("save", SubmitType::class, array('attr' => array("class" => "btn btn-success", "style" => "margin-bottom: 15px; margin-top: 15px;"), "label" => "Submit"))->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $dish_name = $form["dish_name"]->getData();
            $image = $form["image"]->getData();
            $description = $form["description"]->getData();
            $nutrition_facts = $form["nutrition_facts"]->getData();
            $ingredients = $form["ingredients"]->getData();
            $recipe = $form["recipe"]->getData();
            $type = $form["type"]->getData();
            $category = $form["category"]->getData();
            $calories = $form["calories"]->getData();
            $dish_status = $form["dish_status"]->getData();
       

            if ($image){
                $originalFilename = pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $originalFilename;
                $newFilename = $safeFilename.'-'.uniqid().'.'.$image->guessExtension();
                try {
                    $image->move($this->getParameter('picture_directory'), $newFilename);
                } catch (FileException $e) {
                    // ... handle exception if something happens during file upload
                }
                $dish->setImage($newFilename);
            }


            $dish->setDishName($dish_name);
            // $dish->setImage($image);
            $dish->setDescription($description);
            $dish->setNutritionFacts($nutrition_facts);
            $dish->setIngredients($ingredients);
            $dish->setRecipe($recipe);
            $dish->setType($type);
            $dish->setCategory($category);
            $dish->setCalories($calories);
            $dish->setDishStatus($dish_status);

            $em = $this->getDoctrine()->getManager();

            $em->persist($dish);
            $em->flush();


            $this->addFlash('notice', 'Dish edited');

            return $this->redirectToRoute('meal_planner');
        }

        return $this->render('meal_planner/editstatus.html.twig', [
            "form" => $form->createView()
        ]);
    }
    #[Route('/notapproved', name: 'not')]
    
    public function not(): Response
    {
        
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $dishes = $this->getDoctrine()->getRepository(Dishes::class)->findBy(["dish_status" => "Not Approved"]);;

        return $this->render('meal_planner/notapproved.html.twig', [
            "dishes" => $dishes
        ]);
    }

    #[Route('/vegan', name: 'vegan')]
    
    public function vegan(): Response
    {
        
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $dishes = $this->getDoctrine()->getRepository(Dishes::class)->findBy(["dish_status" => "Approved","type" => "Vegan"]);;

        return $this->render('meal_planner/vegan.html.twig', [
            "dishes" => $dishes
        ]);
    }

    #[Route('/vegetarian', name: 'vegetarian')]
    
    public function vegetarian(): Response
    {
        
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $dishes = $this->getDoctrine()->getRepository(Dishes::class)->findBy(["dish_status" => "Approved","type" => "Vegetarian"]);;

        return $this->render('meal_planner/vegetarian.html.twig', [
            "dishes" => $dishes
        ]);
    }

    #[Route('/meat', name: 'meat')]
    
    public function meat(): Response
    {
        
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $dishes = $this->getDoctrine()->getRepository(Dishes::class)->findBy(["dish_status" => "Approved","type" => "Meat"]);;

        return $this->render('meal_planner/meat.html.twig', [
            "dishes" => $dishes
        ]);
    }
}