LairBnB

## Team Members
Paris Higgins
Ben Jones
Shamarni Mcfarlane
Grace Farren




## Git repo sharing
$ git remote add upstream https://github.com/BenJonesMakers/LairBnB.git

$ git fetch upstream
  remote: Enumerating objects: 6, done.
  remote: Counting objects: 100% (6/6), done.
  remote: Compressing objects: 100% (2/2), done.
  remote: Total 4 (delta 1), reused 3 (delta 1), pack-reused 0
  Unpacking objects: 100% (4/4), done.
  From https://github.com/BenJonesMakers/LairBnB
  * [new branch]      main       -> upstream/main

$ git fetch upstream

$ LairBnB student$ git checkout main
  Already on 'main'
  Your branch is up to date with 'origin/main'.

$ git merge upstream/main
  Updating 1d9f964..cfed183
  Fast-forward
  README.md | 1 +
  1 file changed, 1 insertion(+)
