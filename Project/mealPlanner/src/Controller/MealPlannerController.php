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
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use App\Entity\Dishes;
use App\Entity\User;

class MealPlannerController extends AbstractController
{
    #[Route('/index', name: 'meal_planner')]
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
            ->add("image", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
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
            ->add("category", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
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
       



            $dish->setDishName($dish_name);
            $dish->setImage($image);
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
            ->add("image", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
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
            ->add("category", TextType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))
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
       



            $dish->setDishName($dish_name);
            $dish->setImage($image);
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
}
