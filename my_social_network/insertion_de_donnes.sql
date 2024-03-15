-------------------------- Ajout de données utilisateurs dans la table users --------------------------
INSERT INTO users (gender, first_name, last_name, street_address, city, zipcode, birthday, country, email, username, password) 
 VALUES (
 'male',
 'Theodore',
 'Tougas',
 '42 rue Marguerite',
 'VINCENNES',
 '94300',
 '7/19/1982',
 'France',
 'TheodoreTougas@cuvox.de',
 'Loncend82',
 'Xo2uNgee5Oh'
 ),
 (
  'male',
 'Theodore',
 'Varieur',
 '46 avenue de Bouvines',
 'SCHOELCHER',
 '97233',
 '11/1/1961',
 'France',
 'TheodoreVarieur@einrot.com',
 'Muctlandly',
 'aQuiecoo0j'
 ),
 (
  'male',
  'Zacharie',
  'Lanteigne',
  '24 Rue du Limas',
  'BEAUNE',
  '21200',
  '3/29/1946',
  'France',
  'ZacharieLanteigne@jourrapide.com',
  'Foldishow',
  'shiw9deePh'
  ),
  (
    'male',
    'Franck',
    'Baril',
    '34 rue de la Boetie',
    'PLAISIR',
    '78370',
    '1/23/1981',
    'France',
    'FranckBaril@dayrep.com',
    'Lantoo81',
    'mai9IPheemu'
 ),
 (
     'female',
     'Luce',
     'Devost',
     '88 rue Ernest Renan',
     'CHERBOURG',
     '50100',
     '8/13/1997',
     'France',
     'LuceDevost@dayrep.com',
     'Condets',
     'ohng1KaeC'
 ),
 (
       'male',
       'Alain',
       'Genereux',
       '42 rue Marie de Medicis',
       'BETHUNE',
       '62400',
       '10/11/1995',
       'France',
       'AlainGenereux@dayrep.com',
       'Wilovents',
       'zohRiisie2'
       ),
       (
         'female',
         'Noemie',
         'Francoeur',
         '65 Place de la Gare',
         'COLMAR',
         '68000',
         '9/15/2001',
         'France',
         'NoemieFrancoeur@rhyta.com',
         'Spern2001',
         'aikeejae7Oh'),
         (
           'female',
           'Xavierre',
           'Dupont',
           '1 Chemin Des Bateliers',
           'ANGOULEME',
           '16000',
           '2/8/1981',
           'France',
           'XavierreDupont@teleworm.us',
           'Shoutered',
           'ThaiX0ph'
           ),
           (
             'female',
             'Gabrielle',
             'Gougeon',
             '24 rue Beauvau',
             'MARSEILLE',
             '13004',
             '2/20/2000',
             'France',
             'GabrielleGougeon@superrito.com',
             'Rall2000',
             'Nig3ebia'
             ),
             (
               'female',
               'Marine',
               'Frappier',
               '63 rue Marie de Medicis',
               'BETHUNE',
               '62400',
               '1/13/1987',
               'France',
               'MarineFrappier@gustr.com',
               'Jamet1987',
               'Ohchod1eiz'
);

-------------------------- Ajout de posts initiaux dans la table post : --------------------------
INSERT INTO post (id, user_id, content, created_at ) VALUES (1, :user_id, :content, :created_at);

Exemples : 
-- Ici on utilise ' pour échapper la chaine de caractères
INSERT INTO post (user_id, content, created_at ) VALUES (1, 'Challenge du jour : Essayer de paraître concentré lors d''une visioconférence, alors que je regarde des vidéos de chat', '2024-03-13 09:44:55');
-- Dans ces insertions de données, je saisis l'id du post en dur donc je l'indique au début avec "id"
INSERT INTO post (id, user_id, content, created_at ) VALUES (1, 2, 'Quelqu''un pourrait me dire pourquoi la machine à café est toujours en maintenance PENDANT ma pause ?', '2024-03-13 10:12:55');
INSERT INTO post (id, user_id, content, created_at ) VALUES (2, 7, 'Quand tu commences une nouvelle série à minuit et que tu te dis que tu regarderas juste un épisode...', '2024-03-13 11:00:12');
INSERT INTO post (id, user_id, content, created_at ) VALUES (4, 10, 'Devinez qui a ENCORE préparé son repas pour ce midi et l''a ENCORE oublié à la maison ? ...', '2024-03-13 11:08:32');
INSERT INTO post (id, user_id, content, created_at ) VALUES (5, 9, 'Bonjour à tous ! Je viens d''arriver sur réseau !', '2024-03-13 09:12:25');
INSERT INTO post (id, user_id, content, created_at ) VALUES (7, 4, 'Je suis paniqué dès que je vois un long mot... Quelqu''un sait comment s''appelle cette phobie ?', '2024-03-13 11:11:11');
-- Ici j'arrête d'insérer l'id en dur
INSERT INTO post (user_id, content, created_at ) VALUES (5, 'Regardez ce que je viens d''acheter !', '2024-03-13 11:37:23');
INSERT INTO post (user_id, content, created_at ) VALUES (8, 'Certains jours on ferait mieux de rester au lit...', '2024-03-13 07:12:34');


-------------------------- Trier par popularité : --------------------------
SELECT post_id, COUNT (user_id) AS like_count FROM like_post GROUP BY post_id ORDER BY like_count DESC;

SELECT * FROM like_n_share ORDER BY like_count DESC;

-------------------------- Trier par date de publication (Le plus récent) avec pagination : --------------------------
-- Page 1 -- 
SELECT * FROM post WHERE parent_comment IS NULL ORDER BY created_AT DESC
LIMIT 5 OFFSET 0;

-- Page 2 --
SELECT * FROM post WHERE parent_comment IS NULL ORDER BY created_AT DESC
LIMIT 5 OFFSET 5;

SELECT * FROM like_n_share WHERE parent_comment IS NULL ORDER BY created_at DESC;

-------------------------- Liker un post : --------------------------
INSERT INTO like_post (post_id, user_id) VALUES (:post_id, :user_id);

Exemples:
INSERT INTO like_post (post_id, user_id) 
VALUES 
(5, 2),
(12, 1),
(14, 1),
(14, 2),
(14, 3),
(14, 5),
(14, 7),
(15, 4),
(3, 8),
(2, 6),
(10, 10),
(10, 9);


-------------------------- Créer un commentaire : --------------------------
-- Ici, j'ajoute juste le "parent_comment" pour indiquer qu'il s'agit d'un commentaire
INSERT INTO post (user_id, content, created_at, parent_comment ) VALUES (:user_id, :content, :created_at, :parent_comment);

Exemples :
INSERT INTO post (user_id, content, created_at, parent_comment) VALUES (2, 'Ah ! Les priorités !' , '2024-03-13 09:45:37', 6);
INSERT INTO post (user_id, content, created_at, parent_comment) VALUES (6, 'La loi de Murphy...' , '2024-03-13 10:17:22', 1);
INSERT INTO post (user_id, content, created_at, parent_comment) VALUES (5, 'Tout le monde s''en fou Gabrielle !' , '2024-03-13 09:49:12', 5);
INSERT INTO post (user_id, content, created_at, parent_comment) VALUES (5, 'Peut-être parce que tu passes ta journée en pause ? Enfin je dis ça comme ça...' , '2024-03-13 10:13:48', 1);
INSERT INTO post (user_id, content, created_at, parent_comment) VALUES (8, 'Hippopotomonstrosesquippedaliophobie, de rien' , '2024-03-13 11:12:58', 7);


-------------------------- Créer une réponse de commentaire --------------------------
-- Ici, je choisis de répondre un "post" où le parent_comment n'est pas NULL pour m'assurer qu'il s'agit bien d'une réponse à un commentaire
INSERT INTO post (user_id, content, created_at, parent_comment) VALUES (3, 'Oui... On n''a pas tous les mêmes !' , '2024-03-13 09:49:12', 6);
INSERT INTO post (user_id, content, created_at, parent_comment) VALUES (4, 'Aaaaaaaaaaaaaaaah' , '2024-03-13 11:15:16', 14);


-------------------------- Créer un post avec une pièce-jointe --------------------------

-- Créer un post avec une image : 
WITH inserted_pic AS (
    INSERT INTO post (user_id)
    VALUES (3) 
    RETURNING id
)
INSERT INTO attachments (picture, post_id)
SELECT 'C:\Workspaces\my_social_network\ferrari.jpg', id
FROM inserted_pic;

-- Créer un post qui partage un post :
WITH share_post AS (
    INSERT INTO post (user_id)
    VALUES (6)
    RETURNING id
)
INSERT INTO attachments (post_id, id)
SELECT 1, id
FROM share_post;

SELECT post_id FROM attachments;

--Joindre une image à un post existant 
INSERT INTO attachments (picture, post_id) VALUES ('C:\Workspaces\my_social_network\ferrrari.jpg', 12);


-------------------------- Système de recherche par mot clé pour les utilisateurs et les publications --------------------------
Système de recherche par prénom d''utilisateur :

SELECT * FROM users WHERE first_name ILIKE '%theodore%';

-- Possibilité de faire par nom de famille ou nom d'utilisateur avec :last_name ou :username --------------------------

Système de recherche par mot clé dans un post :
SELECT * FROM post WHERE (content) ILIKE '%Journée%';

-------------------------- Filtrer les publications par auteur, date --------------------------
SELECT * FROM post WHERE id = 2;

SELECT * FROM post WHERE created_at >= '2024-03-13 00:00:00'
AND created_at <= '2024-03-13 23:59:59';


-------------------------- Insertion des rôles dans la table user_role --------------------------
INSERT INTO user_role (role_name) VALUES 
    ('Super utilisateur'),
    ('Administrateur'),
    ('Modérateur'),
    ('Editeur'),
   ('Visiteur');


-------------------------- Création de différents groupes --------------------------   

INSERT INTO groups (group_name, creation_date) 
VALUES
('Maines coons et cie', '2024-03-15 13:14:15'),
('Les chasseurs de tornades', '2024-03-15 15:16:17'),
('Disney Lovers', '2024-03-15 16:17:18');

SELECT * FROM groups;
-------------------------- Insertion de membres dans des groupes et avec des rôles --------------------------

INSERT INTO groups (group_name, user_id, role_id) VALUES
('Maines coons et cie', 3, 1),
('Maines coons et cie', 2, 2),
('Maines coons et cie', 1, 3),
('Maines coons et cie', 5, 5),
('Les chasseurs de tornades', 10, 1),
('Les chasseurs de tornades', 8, 4),
('Les chasseurs de tornades', 6, 2),
('Disney Lovers', 4, 1),
('Disney Lovers', 5, 5),
('Disney Lovers', 7, 2),
('Disney Lovers', 9, 5);

-------------------------- Suivre quelqu'un --------------------------
INSERT INTO follow (user_id, followed_id, follow_date) VALUES (:user.id, :followed.id, :followed_date)

Exemples : 
INSERT INTO follow (user_id, followed_id, follow_date) 
VALUES 
(1, 2,'2024-03-13 11:12:13'),
(1, 7,'2024-03-13 12:13:14'),
(2, 7,'2024-03-13 13:14:15'),
(3, 10,'2024-03-13 15:16:17'),
(4, 3,'2024-03-13 15:54:18'),
(5, 8,'2024-03-13 17:12:10'),
(7, 4,'2024-03-13 21:45:54'),
(9, 6,'2024-03-13 22:15:11'),
(6, 2,'2024-03-13 23:17:16');


------------------------------------------------------------------------
CREATE VIEW all_posts AS
SELECT u.first_name, u.last_name, p.content 
FROM users u 
INNER JOIN post p
ON p.user_id = u.id;
