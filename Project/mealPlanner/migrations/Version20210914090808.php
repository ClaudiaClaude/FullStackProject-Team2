<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210914090808 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE meals (id INT AUTO_INCREMENT NOT NULL, fk_user_id_id INT NOT NULL, fk_dish_id_id INT NOT NULL, date_time DATETIME NOT NULL, INDEX IDX_E229E6EA6DE8AF9C (fk_user_id_id), INDEX IDX_E229E6EAE5107689 (fk_dish_id_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE meals ADD CONSTRAINT FK_E229E6EA6DE8AF9C FOREIGN KEY (fk_user_id_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE meals ADD CONSTRAINT FK_E229E6EAE5107689 FOREIGN KEY (fk_dish_id_id) REFERENCES dishes (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE meals');
    }
}
