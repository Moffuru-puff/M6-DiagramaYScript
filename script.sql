-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci ;
USE `DB` ;

-- -----------------------------------------------------
-- Table `DB`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`users` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`notes` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NULL,
  `description` LONGTEXT NULL,
  `creation_date` DATETIME NULL,
  `last_modified_date` DATETIME NULL,
  `status` VARCHAR(45) NULL,
  `users_Id` INT NOT NULL,
  `discard_note` TINYINT NULL,
  PRIMARY KEY (`Id`, `users_Id`),
  INDEX `fk_notes_users1_idx` (`users_Id` ASC),
  CONSTRAINT `fk_notes_users1`
    FOREIGN KEY (`users_Id`)
    REFERENCES `DB`.`users` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB`.`notes_has_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB`.`notes_has_category` (
  `notes_Id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`notes_Id`, `category_id`),
  INDEX `fk_notes_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_notes_has_category_notes1_idx` (`notes_Id` ASC),
  CONSTRAINT `fk_notes_has_category_notes1`
    FOREIGN KEY (`notes_Id`)
    REFERENCES `DB`.`notes` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notes_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `DB`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

# Tabla users INSERTS
INSERT INTO users VALUES (DEFAULT, 'Angelica', 'López','angelicalopez123@empresa.org');
INSERT INTO users VALUES (DEFAULT, 'Iván', 'Félix','felixivan_12@universidades.edu');
INSERT INTO users VALUES (DEFAULT,'Mariana', 'Peña','mari_pena90@universidades.edu');
INSERT INTO users VALUES (DEFAULT, 'José', 'Carrasco','j.carr@universidades.edu');
INSERT INTO users VALUES (DEFAULT, 'Enrique', 'Pérezlara','ricoperez.1@empresa.org');
INSERT INTO users VALUES (DEFAULT, 'Connor', 'Meade','connor_meade_0@universidades.edu');
INSERT INTO users VALUES (DEFAULT,'Taylor', 'Swift','taylor.swift.13@music.com');
INSERT INTO users VALUES (DEFAULT, 'Jessica', 'Reed','jessireed_45_67@empresa.org');
INSERT INTO users VALUES (DEFAULT, 'Agustin', 'Melgar','agust_melgar.123@empresa.org');
INSERT INTO users VALUES (DEFAULT, 'David', 'Ruiz','sirdeivid7@empresa.org');

# Tabla category INSERTS
INSERT INTO category VALUES (DEFAULT, 'Music');
INSERT INTO category (name) VALUES ('Entretainment');
INSERT INTO category (name) VALUES ('To Do');
INSERT INTO category (name) VALUES ('Workout');
INSERT INTO category (name) VALUES ('Recipie');
INSERT INTO category (name) VALUES ('Travel');
INSERT INTO category (name) VALUES ('Work');
INSERT INTO category (name) VALUES ('Education');
INSERT INTO category (name) VALUES ('Finantial');
INSERT INTO category (name) VALUES ('Health');

# Tabla notes INSERTS
INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Song writing', 'Last night I dreamt about the moon and the stars.', NOW(), NOW(), 'creada', false,(SELECT id FROM users WHERE name = 'Angelica'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Warm up', '1: Knee to chest, 2: open hips, 3: Lunge Walk 4: Drills', NOW(), NOW(), 'creada', false,(SELECT id FROM users WHERE name = 'Iván'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Tikka Masala', 'Ingredients: Chicken, Gran Masala, Cumin, Salt, Pepper, Onion, Garlic', NOW(), NOW(), 'creada', true,(SELECT id FROM users WHERE name = 'Taylor'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Brownies', 'Ingredients: Cocoa Powder, Sugar, Flour, Butter, Chocolate chips', NOW(), NOW(), 'creada', true,(SELECT id FROM users WHERE name = 'Taylor'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Italy', 'Rome, Pisa, Verona, Milano', NOW(), NOW(), 'creada', true,(SELECT id FROM users WHERE name = 'Enrique'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('México', 'Oaxaca, Puebla, Quintana Roo, Los Cabos', NOW(), NOW(), 'creada', true,(SELECT id FROM users WHERE name = 'Connor'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Movies I like', 'Inception, Bohemian Rhapsody, Interestellar ', NOW(), NOW(), 'creada', true,(SELECT id FROM users WHERE name = 'Mariana'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Favorite Songs', 'Adore you, Begin Again, Red, Daylight, Cornelia Street, Renegade', NOW(), NOW(), 'creada', false,(SELECT id FROM users WHERE name = 'José'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('House Daily Chores', 'Trash, kitchen, bathroom, livingroom ', NOW(), NOW(), 'creada', false,(SELECT id FROM users WHERE name = 'Agustin'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Leg day', 'Squat, Deadlift, Sumo Deadlift, Sumo squat, Box jump', NOW(), NOW(), 'creada', false,(SELECT id FROM users WHERE name = 'Jessica'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Arm day', 'Pullups, Pushups, Bench press, Shoulder press', NOW(), NOW(), 'creada', false,(SELECT id FROM users WHERE name = 'Jessica'));


INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Wim Hof Meditation', 'Start with 1 min breathing...', NOW(), NOW(), 'creada', true,(SELECT id FROM users WHERE name = 'Jessica'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Savings', 'April: $40, May: $50, June: $60', NOW(), NOW(), 'creada', false,(SELECT id FROM users WHERE name = 'Agustin'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Programming Course', 'DH Full Stack Course', NOW(), NOW(), 'creada', false,(SELECT id FROM users WHERE name = 'David'));

INSERT INTO notes (title, description, creation_date, last_modified_date, status, discard_note, users_id) 
VALUES ('Work daily meetings', '9:00 Meeting with Angela: deadline of database', NOW(), NOW(), 'creada', false,(SELECT id FROM users WHERE name = 'Connor'));


# Tabla notes_has_category INSERTS

INSERT INTO notes_has_category (category_id, notes_id) 
VALUES ((SELECT id FROM category WHERE name = 'Music'),(SELECT id FROM notes WHERE title = 'Favorite Songs')),
((SELECT id FROM category WHERE name = 'Music'),(SELECT id FROM notes WHERE title = 'Song writing'));

INSERT INTO notes_has_category (category_id, notes_id) 
VALUES ((SELECT id FROM category WHERE name = 'Workout'),(SELECT id FROM notes WHERE title = 'Arm day')),
((SELECT id FROM category WHERE name = 'Workout'),(SELECT id FROM notes WHERE title = 'Leg day')),
((SELECT id FROM category WHERE name = 'Workout'),(SELECT id FROM notes WHERE title = 'Warm up'));

INSERT INTO notes_has_category (category_id, notes_id) 
VALUES ((SELECT id FROM category WHERE name = 'Entretainment'),(SELECT id FROM notes WHERE title = 'Movies I like'));

INSERT INTO notes_has_category (category_id, notes_id) 
VALUES ((SELECT id FROM category WHERE name = 'To Do'),(SELECT id FROM notes WHERE title = 'House Daily Chores'));

INSERT INTO notes_has_category (category_id, notes_id) 
VALUES ((SELECT id FROM category WHERE name = 'Recipie'),(SELECT id FROM notes WHERE title = 'Tikka Masala')),
((SELECT id FROM category WHERE name = 'Recipie'),(SELECT id FROM notes WHERE title = 'Brownies'));

INSERT INTO notes_has_category (category_id, notes_id) 
VALUES ((SELECT id FROM category WHERE name = 'Travel'),(SELECT id FROM notes WHERE title = 'Italy')),
((SELECT id FROM category WHERE name = 'Travel'),(SELECT id FROM notes WHERE title = 'México'));

INSERT INTO notes_has_category (category_id, notes_id) 
VALUES ((SELECT id FROM category WHERE name = 'Health'),(SELECT id FROM notes WHERE title = 'Wim Hof Meditation'));

INSERT INTO notes_has_category (category_id, notes_id) 
VALUES ((SELECT id FROM category WHERE name = 'Finantial'),(SELECT id FROM notes WHERE title = 'Savings'));

INSERT INTO notes_has_category (category_id, notes_id) 
VALUES ((SELECT id FROM category WHERE name = 'Education'),(SELECT id FROM notes WHERE title = 'Programming Course'));

INSERT INTO notes_has_category (category_id, notes_id) 
VALUES ((SELECT id FROM category WHERE name = 'Work'),(SELECT id FROM notes WHERE title = 'Work daily meetings'));


# RUN SELECTS

SELECT * FROM users;
SELECT * FROM notes;
SELECT * FROM category;
SELECT * FROM notes_has_category;






