<?php

namespace App\EventListener;

use Doctrine\ORM\Event\OnFlushEventArgs;
use App\Entity\History;
use App\Entity\Client;
use App\Entity\Address;

class HistoryListener
{
    public function onFlush(OnFlushEventArgs $eventArgs)
    {
        $em = $eventArgs->getEntityManager();

        $uow = $em->getUnitOfWork();

  
        foreach ($uow->getScheduledEntityUpdates() as $entity) {
            $entityChangeSet = $uow->getEntityChangeSet($entity);

            $action = 'Изменение';

            foreach ($entityChangeSet as $key => $value) {
                foreach ($value as $k => $v) {
                    $changes[] = $v;
                }
            }


            if ($entity instanceof Address) {
                $array = (array) $entity;


                foreach ($array as $key => $value) {
                    if (is_object($value)) {
                        $entity = $value;
                    }
                }
            }
        }



        $result = '';

        if (isset($changes)) {
            foreach ($changes as $key => $value) {
                if ($key % 2 == 0) {
                    $result .= $value.' -> ';
                } else {
                    $result .= $value. ', ';
                }
            }

            $description = substr($result, 0, -2);
        }

        if (!empty($entity)) {
            $history = new History();

            $history->setClient($entity);
            $history->setAction($action);
            $history->setDesription($description);

            $em->persist($history);

            $classMetadata = $em->getClassMetadata(get_class($history));

            $uow->computeChangeSet($classMetadata, $history);
        }
    }
}
