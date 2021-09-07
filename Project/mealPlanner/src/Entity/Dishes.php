<?php

namespace App\Entity;

use App\Repository\DishesRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=DishesRepository::class)
 */
class Dishes
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    public $id;

    /**
     * @ORM\Column(type="string", length=50)
     */
    public $dish_name;

    /**
     * @ORM\Column(type="string", length=255)
     */
    public $image;

    /**
     * @ORM\Column(type="string", length=255)
     */
    public $description;

    /**
     * @ORM\Column(type="string", length=255)
     */
    public $nutrition_facts;

    /**
     * @ORM\Column(type="string", length=255)
     */
    public $ingredients;

    /**
     * @ORM\Column(type="string", length=255)
     */
    public $recipe;

    /**
     * @ORM\Column(type="string", length=50)
     */
    public $type;

    /**
     * @ORM\Column(type="string", length=50)
     */
    public $category;

    /**
     * @ORM\Column(type="integer")
     */
    public $calories;

    /**
     * @ORM\Column(type="string", length=50)
     */
    public $dish_status;

    /**
     * @ORM\ManyToOne(targetEntity=User::class)
     */
    public $fk_user_id;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDishName(): ?string
    {
        return $this->dish_name;
    }

    public function setDishName(string $dish_name): self
    {
        $this->dish_name = $dish_name;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): self
    {
        $this->image = $image;

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

    public function getNutritionFacts(): ?string
    {
        return $this->nutrition_facts;
    }

    public function setNutritionFacts(string $nutrition_facts): self
    {
        $this->nutrition_facts = $nutrition_facts;

        return $this;
    }

    public function getIngredients(): ?string
    {
        return $this->ingredients;
    }

    public function setIngredients(string $ingredients): self
    {
        $this->ingredients = $ingredients;

        return $this;
    }

    public function getRecipe(): ?string
    {
        return $this->recipe;
    }

    public function setRecipe(string $recipe): self
    {
        $this->recipe = $recipe;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): self
    {
        $this->type = $type;

        return $this;
    }

    public function getCategory(): ?string
    {
        return $this->category;
    }

    public function setCategory(string $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getCalories(): ?int
    {
        return $this->calories;
    }

    public function setCalories(int $calories): self
    {
        $this->calories = $calories;

        return $this;
    }

    public function getDishStatus(): ?string
    {
        return $this->dish_status;
    }

    public function setDishStatus(string $dish_status): self
    {
        $this->dish_status = $dish_status;

        return $this;
    }

    public function getFkUserId(): ?user
    {
        return $this->fk_user_id;
    }

    public function setFkUserId(?user $fk_user_id): self
    {
        $this->fk_user_id = $fk_user_id;

        return $this;
    }
}
