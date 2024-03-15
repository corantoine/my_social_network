-------------------------- Requête d'insertion en base d'un utilisateur : --------------------------
INSERT INTO users (gender, first_name, last_name, street_address, city, zipcode, birthday, country, email, username, password) 
 VALUES (:gender, :first_name, :last_name, :street_address, :city, :zipcode, :birthday, :country, :email, :username, :password)


-------------------------- Requête pour lire les données d'un profil à partir d'un nom d'utilisateur --------------------------
SELECT first_name, last_name, city, username, birthday FROM users
WHERE username = :username;

Exemple : 
SELECT first_name, last_name, city, birthday FROM users
WHERE username = 'Shoutered' ;


-------------------------- Requête pour afficher les commentaires et le nombre de likes sur un post --------------------------
SELECT p.*, COUNT (l.user_id) 
AS like_count 
FROM like_post l 
RIGHT JOIN post p ON l.post_id = p.id 
WHERE p.parent_comment = 1 
GROUP BY p.id;


-------------------------- Requête pour récupérer un post et ses commentaires : --------------------------
SELECT content, parent_comment, user_id, id
FROM post
WHERE parent_comment = 1 OR id = 1;


-------------------------- Requête pour créer un nouveau post avec pièce jointe : --------------------------
WITH :expression_commune_de_table AS (
        INSERT INTO post (user_id)
        VALUES (:user_id)
        RETURNING id
)
INSERT INTO attachments (picture, post_id)
SELECT ':picture', id
FROM :expression_commune_de_table


-------------------------- Requête pour récupérer les posts pour chacun des fils d'actualités avec leurs nombre de "like" et de partages --------------------------
CREATE VIEW like_n_share AS
SELECT p.*, COUNT (l.user_id) AS like_count, COUNT (a.post_id) AS share_count
 FROM like_post l 
RIGHT JOIN post p ON l.post_id = p.id 
LEFT JOIN attachments a ON a.post_id = p.id
GROUP BY p.id;

SELECT * FROM like_n_share;

-------------------------- Requête pour récupérer toutes les réponses d'un commentaire: -------------------------------------------------

SELECT content FROM post WHERE parent_comment = 3;


-------------------------- Requête pour modifier les paramètres des notifications -------------------------- 
-- Par défaut, lees notifications sont activées grâce à 'true'

-- Pour les désactiver : 
UPDATE users SET notification = FALSE;

-- Pour les activer il suffit de remettre la valeur sur TRUE
