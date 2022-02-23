<?php

namespace App\Entity;

use App\Repository\ModelRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ModelRepository")
 */
class Model
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotNull(message="Ce champs est obligatoire")
     */
    private $brand;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotNull(message="Ce champs est obligatoire")
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $creationYear;

    /**
     * @ORM\Column(type="text")
     */
    private $description;

    /**
     * @ORM\Column(type="integer")
     */
    private $stockLimit;

    /**
     * @ORM\Column(type="datetime_immutable")
     */
    private $updateDatetime;

    /**
     * @ORM\Column(type="boolean")
     */
    private $active;

    /**
     * @ORM\OneToMany(mappedBy="model", targetEntity="App\Entity\Phone", orphanRemoval=true)
     */
    private $imeis;

    public function __construct()
    {
        $this->imeis = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getBrand(): ?string
    {
        return $this->brand;
    }

    public function setBrand(string $brand): self
    {
        $this->brand = $brand;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getCreationYear(): ?string
    {
        return $this->creationYear;
    }

    public function setCreationYear(?string $creationYear): self
    {
        $this->creationYear = $creationYear;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getStockLimit(): ?int
    {
        return $this->stockLimit;
    }

    public function setStockLimit(int $stockLimit): self
    {
        $this->stockLimit = $stockLimit;

        return $this;
    }

    public function getUpdateDatetime(): ?\DateTimeImmutable
    {
        return $this->updateDatetime;
    }

    public function setUpdateDatetime(\DateTimeImmutable $updateDatetime): self
    {
        $this->updateDatetime = $updateDatetime;

        return $this;
    }

    public function getActive(): ?bool
    {
        return $this->active;
    }

    public function setActive(bool $active): self
    {
        $this->active = $active;

        return $this;
    }

    /**
     * @return Collection<int, phone>
     */
    public function getImeis(): Collection
    {
        return $this->imeis;
    }

    public function addImei(phone $imei): self
    {
        if (!$this->imeis->contains($imei)) {
            $this->imeis[] = $imei;
            $imei->setModel($this);
        }

        return $this;
    }

    public function removeImei(phone $imei): self
    {
        if ($this->imeis->removeElement($imei)) {
            // set the owning side to null (unless already changed)
            if ($imei->getModel() === $this) {
                $imei->setModel(null);
            }
        }

        return $this;
    }
}
