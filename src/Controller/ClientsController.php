<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Repository\ClientRepository;
use App\Form\ClientType;
use App\Entity\Client;
use App\Entity\Address;

use Knp\Component\Pager\PaginatorInterface;

class ClientsController extends AbstractController
{


    /**
     * @Route("/", name="clients")
     */
    public function index(Request $request, PaginatorInterface $paginator)
    {
        $em = $this->getDoctrine()->getManager();

        $clients = $this->getDoctrine()
        ->getRepository(Client::class)
        ->findAll();
        
        $clients = $paginator->paginate(
            $clients,
            $request->query->getInt('page', 1),
            10
        );

        return $this->render('clients/index.html.twig', [
            'clients' => $clients
        ]);
    }
                     



    /**
     * @Route("/client/{id}", name="client_show")
     */
    public function show(Client $client)
    {
        $addresses = $client->getAddresses();
        $histories = $client->getHistories();

        if (!$client) {
            return $this->redirectToRoute('clients');
        }

        return $this->render('clients/show.html.twig', [

           'client' => $client,
            'addresses' => $addresses,
             'histories' => $histories,
        ]);
    }


    

    /**
     * @Route("/client/delete/{id}", name="client_delete")
     */
    public function deleteClient(Client $client)
    {
        $em = $this->getDoctrine()->getManager();
        $em->remove($client);
        $em->flush();

        return $this->redirectToRoute('clients');
    }


   

    /**
     * @Route("/address/delete/{id}", name="address_delete")
     */
    public function deleteAddress(Address $address)
    {
        $em = $this->getDoctrine()->getManager();
        $em->remove($address);
        $em->flush();

        return $this->redirectToRoute('client_show', [
                'id' => $address->getClient()->getId()
            ]);
    }



  
    /**
     * @Route("/new_client", name="new_client")
     */
    public function new(Request $request)
    {
        $client = new Client();

        $form = $this->createForm(ClientType::class, $client);
        $form->handleRequest($request);
 

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($client);
            $em->flush();

            return $this->redirectToRoute('client_show', [
                'id' => $client->getId()
            ]);
        }

        return $this->render('clients/new.html.twig', [
            'form' => $form->createView(),
        ]);
    }



   
    /**
    *
    * @Route("/client/edit/{id}", name="client_edit")
    */
    public function edit(Client $client, Request $request, $id)
    {
        $form = $this->createForm(ClientType::class, $client);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $client = $entityManager->getRepository(Client::class)->find($id);

            $entityManager->flush();

            return $this->redirectToRoute('client_show', [
                'id' => $client->getId()
             ]);
        }

        return $this->render('clients/new.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
