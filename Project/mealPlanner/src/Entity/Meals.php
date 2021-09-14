<?php

namespace App\Entity;

use App\Repository\MealsRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MealsRepository::class)
 */
class Meals
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     */
    private $date_time;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="meals")
     * @ORM\JoinColumn(nullable=false)
     */
    private $fk_user_id;

    /**
     * @ORM\ManyToOne(targetEntity=Dishes::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $fk_dish_id;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateTime(): ?\DateTimeInterface
    {
        return $this->date_time;
    }

    public function setDateTime(\DateTimeInterface $date_time): self
    {
        $this->date_time = $date_time;

        return $this;
    }

    public function getFkUserId(): ?User
    {
        return $this->fk_user_id;
    }

    public function setFkUserId(?User $fk_user_id): self
    {
        $this->fk_user_id = $fk_user_id;

        return $this;
    }

    public function getFkDishId(): ?Dishes
    {
        return $this->fk_dish_id;
    }

    public function setFkDishId(?Dishes $fk_dish_id): self
    {
        $this->fk_dish_id = $fk_dish_id;

        return $this;
    }
}
