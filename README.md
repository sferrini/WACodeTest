WACodeTest
==========
######Work Angel Code Test
---

Git commands:
--------------
I used this git terminal commands:
```sh
git init
git add .
git commit -am "First Commit"
git remote add origin https://github.com/sferrini/WACodeTest.git
git remote -v
git push -u origin master
git checkout -b dev
git push origin dev
```

I wrote new features in "nameNewFeatureBranch":
```sh
git checkout -b "nameNewFeatureBranch"
git commit -am "Add .."
git checkout dev
git merge "nameNewFeatureBranch"
git push
git branch -d "nameNewFeatureBranch"
git checkout -b "nameNewFeatureBranch"
```

I have done this ^ for all "newFeature"

Once done, from dev branch:

```sh
git checkout master
git merge dev
git push
```

---


Compatibility
-------------
* Compatible with iOS7+.
* ARC

---

Notes
-------------


---
