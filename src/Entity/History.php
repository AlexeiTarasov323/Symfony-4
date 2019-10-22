<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\HistoryRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class History
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Client", inversedBy="histories")
     */
    private $client;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $action;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $desription;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $createdAt;

    

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getClient(): ?Client
    {
        return $this->client;
    }


    public function setClient(?Client $client): self
    {
        $this->client = $client;

        return $this;
    }

    public function getDesription(): ?string
    {
        return $this->desription;
    }

    public function setDesription(?string $desription): self
    {
        $this->desription = $desription;

        return $this;
    }

    public function getAction(): ?string
    {
        return $this->action;
    }

    public function setAction(?string $action): self
    {
        $this->action = $action;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    /**
     * @ORM\PrePersist
     */
    public function setCreatedAt()
    {
        $this->createdAt = new \DateTime();

        return $this;
    }
}
