<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class RealisationsController extends AbstractController
{
    #[Route('/realisations', name: 'app_realisations')]
    public function index(): Response
    {
        return $this->render('realisations/index.html.twig', [
            'controller_name' => 'RealisationsController',
        ]);
    }
}
