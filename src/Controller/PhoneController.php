<?php

namespace App\Controller;

use App\Entity\Model;
use App\Entity\Phone;
use App\Form\ModelCreationFormType;
use App\Form\ModelEditType;
use App\Repository\ModelRepository;
use App\Repository\PhoneRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class PhoneController extends AbstractController
{
    /**
     * @Route("/phones", name="phone.list")
     */
    public function list(ModelRepository $modelRepository): Response
    {
        return $this->render('phone/index.html.twig', [
            'controller_name' => 'PhoneController',
            'models' => $modelRepository->findAll()
        ]);
    }

    /**
     * @Route ("/phones/new", name="phone.new")
     */
    public function  new(Request $request, EntityManagerInterface $manager) : Response
    {
        $model = new Model();
        $form = $this->createForm(ModelCreationFormType::class, $model);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid())
        {
            $model->setUpdateDatetime(new \DateTimeImmutable());
            $model->setActive(1);
            $manager->persist($model);
            $manager->flush();
            $this->addFlash('success', 'Le modèle à été ajouté avec succès');
            return $this->redirectToRoute('phone.list');
        }

        return $this->render('phone/new.html.twig', [
            'controller_name' => 'PhoneController',
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/phones/{id}", name="phone.show")
     */
    public function show(Model $model, Request $request, EntityManagerInterface $manager) : Response
    {
        $form = $this->createForm(ModelEditType::class, $model);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid())
        {
            $model->setUpdateDatetime(new \DateTimeImmutable());
            $manager->persist($model);
            $manager->flush();
            $this->addFlash('success', 'Le modèle à été modifié avec succès');
            return $this->redirectToRoute('phone.list');
        }
        return $this->render('phone/show.html.twig', [
            'form' => $form->createView(),
            'model' => $model
        ]);
    }


    /**
     * @Route("/phones/{id}/addImei", name="phone.addImei", methods={"POST"})
     */
    public function addImei(Model $model, EntityManagerInterface $manager, PhoneRepository $phoneRepository, Request $request, SerializerInterface $serializer)
    {
        $imei = $serializer->deserialize($request->getContent(), Phone::class, 'json');
        if ($phoneRepository->findOneBy(array('imei' => $imei->getImei())))
        {
            return $this->json(['code' => 400, 'message' => 'Cet imei existe deja en base'], 400);
        }

        $phone = new Phone();
        $phone->setModel($model)
            ->setActive(1)
            ->setImei($imei->getImei());
        $manager->persist($phone);
        $manager->flush();
        return $this->json($phone, 201, [], ['groups' => 'read']);
    }
}
