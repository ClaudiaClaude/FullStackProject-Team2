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
        
        $dishes = $this->getDoctrine()->getRepository(Dishes::class)->findAll();

        return $this->render('meal_planner/index.html.twig', [
            "dishes" => $dishes
        ]);
    }

    #[Route('/create', name: 'dish-create')]
    public function create(Request $request): Response
    {
        $dish = new Dishes();
        $form = $this->createFormBuilder($dish)
            ->add("dish_name", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("image", FileType::class, array('attr'=>array("class"=>"form-control", "style"=>"margin-bottom:15px"), 'label' => 'Image (png/jpg file)', 'mapped'=> false, 'required'=> false, 'constraints'=>[ new File(['maxSize' =>'2048k', 'mimeTypes' => ['image/*'], 'mimeTypesMessage' =>'Please upload a valid image document',])]))
            ->add("description", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("nutrition_facts", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("ingredients", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("recipe", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("type", ChoiceType::class, [
                'choices' => [
                    'Vegan' => 'Vegan',
                    'Vegetarian' => 'Vegeterian'
                ]
            ], array('choice_attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("category", ChoiceType::class, [
                'choices' => [
                    'Breakfast' => 'Breakfast',
                    'Lunch' => 'Lunch',
                    'Dinner' => 'Dinner',
                ]
            ] )
            ->add("calories", NumberType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("dish_status", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            
            ->add('fk_user_id', EntityType::class, [
                'class' => User::class,
                'choice_label' => 'email',
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

        $dish = $this->getDoctrine()->getRepository(Dishes::class)->find($id);
        return $this->render('meal_planner/details.html.twig', [
            "dish" => $dish
        ]);
    }

    #[Route('/delete/{id}', name: 'dish-delete')]
    public function delete($id): Response
    {


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

        $dish = $this->getDoctrine()->getRepository(Dishes::class)->find($id);
        $form = $this->createFormBuilder($dish)
            ->add("dish_name", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("image", FileType::class, array('attr'=>array("class"=>"form-control", "style"=>"margin-bottom:15px"), 'label' => 'Image (png/jpg file)', 'mapped'=> false, 'required'=> false, 'constraints'=>[ new File(['maxSize' =>'2048k', 'mimeTypes' => ['image/*'], 'mimeTypesMessage' =>'Please upload a valid image document',])]))
            ->add("description", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("nutrition_facts", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("ingredients", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("recipe", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("type", ChoiceType::class, [
                'choices' => [
                    'Vegan' => 'Vegan',
                    'Vegetarian' => 'Vegeterian'
                ]
            ] )
            ->add("category", ChoiceType::class, [
                'choices' => [
                    'Breakfast' => 'Breakfast',
                    'Lunch' => 'Lunch',
                    'Dinner' => 'Dinner',
                ]
            ] )
            ->add("calories", NumberType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("dish_status", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            
            ->add('fk_user_id', EntityType::class, [
                'class' => User::class,
                'choice_label' => 'email',
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

      
       

        return $this->render('meal_planner/block.html.twig', [
            
        ]);
    }

    #[Route('/profile/{id}', name: 'profile')]
    public function  profile($id, Request $request): Response
    {

        $user = $this->getDoctrine()->getRepository(User::class)->find($id);
        $form = $this->createFormBuilder($user)
            ->add("email", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            // ->add("roles", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("password", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("username", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
            ->add("avatar", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
         

            ->add("save", SubmitType::class, array('attr' => array("class" => "btn btn-success", "style" => "margin-bottom: 15px; margin-top: 15px;"), "label" => "Submit"))->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $email = $form["email"]->getData();
            // $roles = $form["roles"]->getData();
            $password = $form["password"]->getData();
            $username = $form["username"]->getData();
            $avatar = $form["avatar"]->getData();
            
       



            $user->setEmail($email);
            // $user->setRoles($roles);
            $user->setPassword($password);
            $user->setUsername($username);
            $user->setAvatar($avatar);
            

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
        $users = $this->getDoctrine()->getRepository(User::class)->findAll();

        return $this->render('meal_planner/dashboard.html.twig', [
            "users" => $users
        ]);
    }

    #[Route('/remove/{id}', name: 'remove-profile')]
    public function remove($id): Response
    {


        $em = $this->getDoctrine()->getManager();
        $user = $em->getRepository(User::class)->find($id);
        $em->remove($user);
        $em->flush();

        $this->addFlash("notice", "Dish removed");

        return $this->redirectToRoute("dashboard");
    }

}