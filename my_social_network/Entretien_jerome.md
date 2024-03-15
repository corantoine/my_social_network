# Entretien avec Jérôme pour la présentation de sa base de données

Jérôme a fait le choix d'utiliser **Mocodo** pour créer son diagramme et de modéliser ses tables avec **drawio** également.

### Pourquoi utiliser mocodo ET drawio ? 
Il a fait ce choix pour avoir une meilleure visibilité de ses tables et retravailler ses cardinalités afin de bien intégrer le concept.

Il a donc redétaillé ses cardinalités à l'écrit sous son diagramme afin de les expliquer clairement. 

### Pourquoi avoir mis les notifications sur **true** par défaut ? 
L'utilisateur recevra des notifications par défaut, ce qui l'incitera à revenir sur le réseau social. C'est un choix judicieux.

### Pourquoi avoir mis 'role' dans la table share ? 

C'est la table share qui fait le lien entre le groupe et l'utilisateur en fonction de ce que l'utilisateur va faire, son rôle définira donc les interactions qu'il pourra avoir avec le groupe. (Simple lecture, ajout de contenu, modifications de paramètres, etc.)


### Y'a-t-il une possibilité de répondre à un commentaire ? 

Jérôme n'avait pas pris en compte ce paramètre, après un échange à ce propos, il a compris que oui, on peut répondre à un commentaire avec la façon dont il a créé sa base de données.

### La création de groupes
Jérôme a créé les groupes ainsi que les rôles et a bien intégré la possibilité de changer les rôles des utilisateurs.

<!-- 
Utilisation de : 
WHERE IN AND
WHERE va chercher le nom
IN relie l'id du compte au nom de son propriétaire 
AND séléctionne le groupe 1  -->

### Remarques : 
Lors de sa manipulation de données, il manque une condition plus restrictive pour regrouper l'id et le nom, car ici on cherche une correspondance partielle. Cela fonctionne dans le cas où une seule personne remplit les critères, cependant, cela risque de poser problème lors du changement de rôle si plusieurs personnes remplissent les critères, il risque de ne pas avoir le résultat escompté.

*Jérôme a pris en compte ma remarque.*

### Bonus : 
Jérôme a pris en compte mon souhait concernant la possibilité de lier un compte discord, google ou autre grâce au token.



Jérôme a bien compris les attentes du client et la manipulation des données.
Les fichiers de Jérôme correspondent bien aux attentes du client, tout est clair, détaillés et j'ai pu voir lors de ses explications qu'il maitrisait et comprenait ce qu'il fait. **Bravo** !


