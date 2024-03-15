------------------------------------------------- Création de la base de données -------------------------------------------------
CREATE DATABASE my_social_network;

------------------------------------------------- Création de la table users -------------------------------------------------
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  gender         VARCHAR(42) NOT NULL,
  first_name     VARCHAR(42) NOT NULL,
  last_name      VARCHAR(42) NOT NULL,
  street_address VARCHAR(100) NOT NULL,
  city           VARCHAR(100) NOT NULL,
  zipcode        VARCHAR(42) NOT NULL,
  birthday       VARCHAR(42) NOT NULL,
  country        VARCHAR(100) NOT NULL,
  email          VARCHAR(100) NOT NULL,
  username       VARCHAR(42) NOT NULL,
  password       VARCHAR(42) NOT NULL
);

-- Ajout de la colonne notifications pour permettre aux utilisateurs d'accéder aux paramètres de notifications 
ALTER TABLE users ADD COLUMN notification bool DEFAULT true;

------------------------------------------------- Création de la table POST -------------------------------------------------
-- 2 clés étrangères : user_id, parent_comment
-- Ici si l'id de "parent_comment" est NULL alors il s'agit d'un post
-- Si l'id de "parent_comment" n'est pas NULL alors il s'agit d'un commentaire ou d'une réponse à un commentaire.
CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    content VARCHAR (250),
    created_at TIMESTAMP,
    parent_comment INT REFERENCES post(id)
);

------------------------------------------------- Création de la table follow -------------------------------------------------
-- 2 clés étrangères user_id, followed_id pour déterminer qui suit qui 
CREATE TABLE follow(
    user_id INT REFERENCES users(id),
    followed_id INT REFERENCES users(id),
    follow_date TIMESTAMP,
-- La PK est définie ainsi car ça garanti que chaque paire de valeurs dans ces deux colonnes est unique. 
-- C-à-d qu’un utilisateur ne peut pas suivre le même utilisateur plusieurs fois.
    PRIMARY KEY (user_id, followed_id)
);


------------------------------------------------- Création de la table like_post -------------------------------------------------
-- Il y avait une erreur sur la table alors je l'ai remodifiée
-- CREATE TABLE like_post(
--     id SERIAL PRIMARY KEY,
--     post_id INT REFERENCES post(id)
-- );

-- J'enlève la contrainte de pk sur l'id
ALTER TABLE like_post DROP CONSTRAINT like_post_pkey;
-- Pour renommer "id" en "user_id" :
ALTER TABLE like_post RENAME COLUMN id to user_id ;
-- Je rajoute une fk sur "user_id" :
ALTER TABLE like_post 
ADD CONSTRAINT fk_like_post
FOREIGN KEY (user_id) REFERENCES users(id);
-- Je rajoute la PK
ALTER TABLE like_post 
ADD CONSTRAINT pk_like_post PRIMARY KEY (user_id, post_id);

-- Avec les modifs, si j'avais déclaré la TABLE correctement, elle aurait été créee comme ça :
CREATE TABLE like_post(
    user_id INT REFERENCES users(id),
    post_id INT REFERENCES post(id),
    PRIMARY KEY (user_id, post_id)
);

------------------------------------------------- Création de la table attachments : -------------------------------------------------

CREATE TABLE attachments(
    id SERIAL PRIMARY KEY,
    link VARCHAR (100),
    picture VARCHAR (100),
    post_id INT REFERENCES post(id)
);

CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR (100),
    creation_date TIMESTAMP, 
    user_id INT REFERENCES users(id),
    post_id INT REFERENCES post(id),
    role_id INT REFERENCES user_role(role_id)
);

CREATE TABLE user_role (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);