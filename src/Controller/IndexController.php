<?php

namespace App\Controller;

use App\Repository\ModelRepository;
use App\Repository\PhoneRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class IndexController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(PhoneRepository $phoneRepository, ModelRepository $modelRepository): Response
    {
        return $this->render('index/index.html.twig', [
            'controller_name' => 'IndexController',
            'numPhones' => count($phoneRepository->findAll())
        ]);
    }
}
