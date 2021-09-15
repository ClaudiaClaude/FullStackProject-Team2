<?php

namespace App\Controller;

use App\Entity\Meals;
use App\Entity\Dishes;
use App\Entity\Users;
use App\Form\MealsType;
use App\Repository\MealsRepository;
use App\Repository\DishesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use Symfony\Component\Validator\Constraints\DateTime;
use Symfony\Component\Validator\Constraints\DateTimeValidator;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

#[Route('/schedule/meals')]
class ScheduleMealsController extends AbstractController
{
    #[Route('/', name: 'schedule_meals_index', methods: ['GET'])]
    public function index(MealsRepository $mealsRepository): Response
    {


        $conn = $this->getDoctrine()->getManager()->getConnection();

        $sql = '
        SELECT meals.date_time, meals.id, meals.fk_dish_id_id, dishes.dish_name, dishes.image, meals.fk_user_id_id FROM meals JOIN dishes on meals.fk_dish_id_id = dishes.id
            ';

        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAllAssociative();

        // $meals = $mealsRepository->findAll();
        // $em = $this->getDoctrine()->getManager();
        // $query = $em->createQueryBuilder();
        // //         ->select('m', 'd')
        // //         ->join('dishes', 'd', 'm.fk_dish_id = d.dish_id')
        // //         // ->where('meals.fk_dish_id = d.dish_id')
        // //         ->getQuery()->getResult();

        // $query->select(array('m', 'd'))
        // ->from('Meals', 'm')
        // ->innerJoin('Dishes', 'd', 'm.fk_dish_id = d.dish_id');

        // $result = $query->getQuery();

        // $query = $em->createQuery("SELECT dishes.dish_name dishes.image meals.id meals.fk_user_id meals.fk_dish_id meals.date_time FROM 'app\Entity\Meals' meals JOIN app\Entity\Dishes dishes");
        // $result = $query->getResult();

        // dd($result);

            // $today = new \DateTime();

           


            $days = array();

            function calDays(){
                $days = array();
                for($i = 0; $i < 7; $i++){

                    $day = new \DateTime('now +'.$i.' day');
                    $day = $day->format('d-m-Y');
                    array_push( $days , $day);
                }
                return $days;
            }

          
            $bf_s = array();
            function times($time, $var){
                $days = array();
                for($i = 0; $i < 7; $i++){
                    $day = new \DateTime('now +'.$i.' day');
                    $day = $day->format('d-m-Y');
                    array_push( $days , $day);
                }
                
                $var = array();
                foreach($days as $day){

                    $data = $day.' '.$time;
                    array_push($var, $data);

                }
                return $var;
            }

            $breakfast_s = '05:00:00';
            $b_s = array();

            $lunch_s = '12:00:00';
            $l_s = array();

            $dinner_s = '19:00:00';
            $d_s = array();

            $night_s = '23:00:00';
            $n_s = array();


            calDays();
            times($breakfast_s, $b_s);
            times($lunch_s, $l_s);
            times($dinner_s, $d_s);
            times($night_s, $n_s);


            // THIS IS ONLY TO SHOW THE TWIG LOGIC!!! THIS SOLUTION WOULD NEED HARD CODING
            $today = new \DateTime();
            $day1 = $today->format('Y-m-d');   
            $today = $today->format('Y-m-d');
            // END OF EVIL HARD CODING SOLUTION

            // dd($today.$dinner_s);


            return $this->render('schedule_meals/index.html.twig', [
            'meals' => $mealsRepository->findAll(),
            'result' => $result,
            'today' => $day1,
            'breakfast_start' => $today.' '.$breakfast_s,
            'lunch_start' => $today.' '.$lunch_s,
            'dinner_start' => $today.' '.$dinner_s,
            'night_start' => $today.' '.$night_s,
            'days' => $days,
            'b_time' => $b_s,
            'l_time' => $l_s,
            'd_time' => $d_s,
            'n_time' => $n_s,

            

        ]);
    }

    #[Route('/new', name: 'schedule_meals_new', methods: ['GET', 'POST'])]
    public function new(Request $request): Response
    {


        $user = $this->getUser();
        $meal = new Meals();
        $form = $this->createFormBuilder($meal)
        ->add("date_time", DateTimeType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),'input' => 'datetime',
        'data' => new \DateTime(),
        'minutes' => array(
           0, 15, 30, 45
        ),  'label' => 'Choose the date and time',))
        ->add('fk_dish_id', EntityType::class, ['attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"),'class' => Dishes::class, 'choice_label' => 'dish_name', 'label' => 'Pick a dish'])

        ->add("save", SubmitType::class, array('attr' => array("class" => "btn btn-success", "style" => "margin-bottom: 15px; margin-top: 15px;"), "label" => "Submit"))->getForm();



        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $date_time = $form["date_time"]->getData();
            $fk_user_id = $user;
            $fk_dish_id = $form["fk_dish_id"]->getData();

            $meal->setDateTime($date_time);
            $meal->setFkUserId($fk_user_id);
            $meal->setFkDishId($fk_dish_id);
            
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($meal);
            $entityManager->flush();



            return $this->redirectToRoute('schedule_meals_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('schedule_meals/new.html.twig', [
            'meal' => $meal,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'schedule_meals_show', methods: ['GET'])]
    public function show(Meals $meal): Response
    {
        return $this->render('schedule_meals/show.html.twig', [
            'meal' => $meal,
        ]);
    }

    #[Route('/{id}/edit', name: 'schedule_meals_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Meals $meal): Response
    {

        
        
        $user = $this->getUser();
     
        $form = $this->createFormBuilder($meal)
        ->add("date_time", DateTimeType::class, array('attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;")))

        ->add('fk_dish_id', EntityType::class, [ 'attr' => array("class" => "form-control", "style" => "margin-bottom: 15px;"), 'class' => Dishes::class, 'choice_label' => 'dish_name', 'label' => 'Pick a dish'])

        ->add("save", SubmitType::class, array('attr' => array("class" => "btn btn-success", "style" => "margin-bottom: 15px; margin-top: 15px;"), "label" => "Submit"))->getForm();

        $form->handleRequest($request);


        if ($form->isSubmitted() && $form->isValid()) {

            $date_time = $form["date_time"]->getData();
            $fk_user_id = $user;
            $fk_dish_id = $form["fk_dish_id"]->getData();

            $meal->setDateTime($date_time);
            $meal->setFkUserId($fk_user_id);
            $meal->setFkDishId($fk_dish_id);
            
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($meal);
            $entityManager->flush();



            return $this->redirectToRoute('schedule_meals_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('schedule_meals/edit.html.twig', [
            'meal' => $meal,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'schedule_meals_delete', methods: ['POST'])]
    public function delete(Request $request, Meals $meal): Response
    {
        if ($this->isCsrfTokenValid('delete'.$meal->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($meal);
            $entityManager->flush();
        }

        return $this->redirectToRoute('schedule_meals_index', [], Response::HTTP_SEE_OTHER);
    }
}
