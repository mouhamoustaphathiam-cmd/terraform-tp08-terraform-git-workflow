# 🚀 TP08 — Terraform & Git Workflow

![Terraform](https://img.shields.io/badge/Terraform-1.x-7B42BC?logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-EC2-FF9900?logo=amazonaws&logoColor=white)
![Git](https://img.shields.io/badge/Git-Workflow-F05032?logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-Pull%20Request-181717?logo=github&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success)

---

## 📌 Présentation

Ce TP08 a pour objectif de mettre en pratique un **workflow Git professionnel appliqué à un projet Terraform**.

L'objectif n'est plus uniquement de savoir écrire du code Terraform, mais de comprendre comment travailler proprement sur une infrastructure **Infrastructure as Code (IaC)** avec Git et GitHub.

Le TP simule un environnement de développement dans lequel les modifications sont réalisées sur une branche dédiée, vérifiées, puis intégrées à la branche principale via une **Pull Request**.

---

## 🎯 Objectifs du TP

À la fin de ce TP, les compétences suivantes sont maîtrisées :

- Comprendre le fonctionnement de Git dans un projet Terraform
- Créer et utiliser des branches Git
- Travailler avec une branche `feature`
- Effectuer des commits propres
- Envoyer une branche vers GitHub
- Comprendre les branches locales et distantes
- Créer une Pull Request
- Comprendre `base` et `compare`
- Effectuer un merge vers `main`
- Comprendre le principe de Code Review
- Vérifier une configuration Terraform avant son intégration
- Utiliser `terraform fmt`
- Utiliser `terraform validate`
- Utiliser `terraform plan`
- Comprendre le lien entre Git workflow et CI/CD

---

# 🏗️ Architecture du workflow

Le workflow réalisé est le suivant :

```text
                    GitHub
                       │
                       │
                    main
                       ▲
                       │
                  Pull Request
                       │
                       │
              feature/workflow
                       │
                 Développement
                       │
              ┌────────┴────────┐
              │                 │
         Terraform           Git
         validate             commit
         plan                 push

📂 Structure du projet
tp08-terraform-git-workflow/
│
├── .gitignore
├── .terraform.lock.hcl
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
☁️ Infrastructure Terraform

Le TP utilise AWS EC2 comme infrastructure cible.

L'instance EC2 possède notamment les tags suivants :

tags = {
  Name    = "EC2-TP08"
  Env     = "terraform-git-workflow"
  Project = "TERRAFORM"
  Lab     = "Local"
  owners  = "MMTHIAM"
}

Les modifications des tags permettent de simuler une évolution de l'infrastructure dans le cadre d'un workflow Git professionnel.

🌿 Gestion des branches

La branche principale utilisée est :

main

Une branche de développement a été créée :

feature/workflow

Création de la branche :

git checkout -b feature/workflow

Vérification :

git branch

Résultat attendu :

* feature/workflow
  main
🔧 Workflow Terraform

Avant de proposer les modifications, plusieurs commandes Terraform ont été utilisées.

1. Formatage
terraform fmt

Cette commande permet de formater automatiquement les fichiers Terraform.

2. Validation
terraform validate

Résultat :

Success! The configuration is valid.
3. Planification
terraform plan

Le plan permet de vérifier les changements qui seront appliqués à l'infrastructure.

Dans ce TP :

Plan: 0 to add, 1 to change, 0 to destroy.

Cela signifie que Terraform prévoit uniquement de modifier l'instance existante.

💻 Workflow Git
1. Vérification de l'état
git status

Permet de voir les fichiers modifiés ou non suivis.

2. Vérification des différences
git diff

Cette commande permet de visualiser précisément les modifications effectuées.

3. Ajouter les modifications
git add .

ou :

git add main.tf
4. Créer un commit

Exemple :

git commit -m "feat: add environment ownership tags"

Un commit représente une modification enregistrée dans l'historique Git.

5. Envoyer la branche vers GitHub
git push -u origin feature/workflow

Après la première association entre la branche locale et la branche distante :

git push
🔀 Pull Request

Une Pull Request permet de proposer l'intégration des modifications d'une branche dans une autre.

Dans ce TP, le workflow correct est :

base: main
compare: feature/workflow

Ce qui signifie :

feature/workflow
        │
        │ Pull Request
        ▼
       main

La Pull Request permet notamment de :

Vérifier les modifications
Examiner les fichiers modifiés
Vérifier les commits
Effectuer une review
Discuter des changements
Détecter d'éventuels problèmes
Valider l'intégration
🔀 Merge

Après vérification de la Pull Request, les modifications sont intégrées dans main.

Workflow :

feature/workflow
        │
        ▼
 Pull Request
        │
        ▼
    Review
        │
        ▼
     Merge
        │
        ▼
      main

La Pull Request finale du TP a été fusionnée avec succès.

🌐 Synchronisation avec GitHub

Après le merge, la branche principale est synchronisée :

git checkout main

Puis :

git pull

Vérification :

git status

Résultat attendu :

On branch main
Your branch is up to date with 'origin/main'.


nothing to commit, working tree clean
📊 Historique Git

L'historique peut être visualisé avec :

git log --oneline --graph --decorate --all

Cette commande permet de visualiser les branches, les commits et les merges.

Exemple :

*   Merge pull request #3
|\
| * GIT WORKFLOW
|/
* TERRAFORM : terraform et git workflow
🧠 Concepts importants appris
Git

Git est un système de gestion de versions permettant de suivre l'évolution du code.

Branche

Une branche permet de travailler sur une fonctionnalité sans modifier directement la branche principale.

main
  │
  └── feature/workflow
Commit

Un commit enregistre une modification dans l'historique du projet.

Push

git push envoie les commits locaux vers GitHub.

Pull

git pull récupère les modifications du dépôt distant.

Pull Request

Une Pull Request permet de proposer l'intégration d'une branche dans une autre.

Merge

Le merge permet d'intégrer les modifications d'une branche dans une autre.

🔐 Bonnes pratiques

Dans un environnement professionnel, il est recommandé de :

Ne pas travailler directement sur main
Utiliser une branche par fonctionnalité
Faire des commits explicites
Vérifier le code avant de créer une Pull Request
Utiliser terraform fmt
Utiliser terraform validate
Vérifier terraform plan
Effectuer une review avant le merge
Ne jamais versionner le fichier terraform.tfstate
Ne jamais exposer les credentials AWS
Utiliser .gitignore
🚫 Fichiers à ne pas versionner

Le fichier .gitignore permet notamment d'exclure :

.terraform/
*.tfstate
*.tfstate.*
*.tfvars
*.tfvars.json
.terraform.tfstate.lock.info

Les credentials AWS et autres secrets ne doivent jamais être stockés dans Git.

🔄 Workflow professionnel recommandé

Le workflow appris dans ce TP peut être résumé ainsi :

             ┌──────────────┐
             │     main     │
             └──────┬───────┘
                    │
                    │ créer une branche
                    ▼
          ┌───────────────────┐
          │ feature/workflow  │
          └─────────┬─────────┘
                    │
             Développement
                    │
                    ▼
            terraform fmt
                    │
                    ▼
          terraform validate
                    │
                    ▼
            terraform plan
                    │
                    ▼
                 commit
                    │
                    ▼
                  push
                    │
                    ▼
            Pull Request
                    │
                    ▼
                 Review
                    │
                    ▼
                 Merge
                    │
                    ▼
                   main
🚀 Évolution vers le CI/CD

Ce workflow constitue une première étape vers l'automatisation DevOps.

La prochaine évolution consiste à automatiser les vérifications Terraform avec GitHub Actions.

Par exemple :

Developer
    │
    ▼
Git Push
    │
    ▼
GitHub
    │
    ▼
GitHub Actions
    │
    ├── terraform fmt -check
    ├── terraform validate
    ├── terraform plan
    └── Security Scan
             │
             ▼
        Pull Request
             │
             ▼
           Merge

Cette approche permet de rapprocher Terraform du fonctionnement réel d'un pipeline CI/CD DevOps / DevSecOps.

🏆 Compétences acquises

À l'issue du TP08 :

✅ Terraform avec Git
✅ Git branching
✅ Feature branch
✅ Git commit
✅ Git push / pull
✅ GitHub
✅ Pull Request
✅ Merge
✅ Gestion de main
✅ Gestion des branches distantes
✅ Terraform validation
✅ Terraform plan
✅ Introduction au workflow CI/CD
📌 Statut
TP08 — COMPLETED ✅

Le projet est prêt pour la prochaine étape du parcours Terraform.

👨‍💻 Auteur

Mouhamadou Moustapha THIAM

Master 2 RETEL — Réseaux, Télécommunications
