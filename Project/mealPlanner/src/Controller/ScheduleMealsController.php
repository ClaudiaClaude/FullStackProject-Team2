<?php

namespace App\Controller;

use App\Entity\Meals;
use App\Form\MealsType;
use App\Repository\MealsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/schedule/meals')]
class ScheduleMealsController extends AbstractController
{
    #[Route('/', name: 'schedule_meals_index', methods: ['GET'])]
    public function index(MealsRepository $mealsRepository): Response
    {
        return $this->render('schedule_meals/index.html.twig', [
            'meals' => $mealsRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'schedule_meals_new', methods: ['GET', 'POST'])]
    public function new(Request $request): Response
    {
        $meal = new Meals();
        $form = $this->createForm(MealsType::class, $meal);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
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
        $form = $this->createForm(MealsType::class, $meal);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

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
