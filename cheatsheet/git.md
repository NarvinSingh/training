Git Cheatsheet
==============

Commit Message Style
--------------------
See [How to Write Good Commit Messages](https://www.freecodecamp.org/news/writing-good-commit-messages-a-practical-guide/).

- Write in the imperative style, e.g., "Add" instead of "Added."

### Subject
- 50 character limit
- Commit type
    - Feat: a new feature
    - Fix: a bug fix
    - Style: feature and updates related to styling
    - Refactor: refactoring
    - Test: testing
    - Docs: documentation
    - chore: regular code maintenance

### Body
- 72 character line length
- Separate from the subject with a blank line

Undo Last Commit
----------------
```Shell
# The changes remain staged, but the working tree is unchanged
git reset --soft HEAD~

# The changes are unstaged, and the working tree is unchanged
git reset HEAD~

# The changes are unstaged, and changes in the working tree are discarded
git reset --hard HEAD~

# Open the editor before committing with the old commit message
git commit -c ORIG_HEAD

# Commit with the old commit message
git commit -C ORIG_HEAD
```

Delete Branch
-------------
```Shell
# Delete a local branch
git branch -d branch_name

# Delete a remote branch
git push origin --delete branch_name
```

Merge Branch
------------
```Shell
# Merge the feature branch into the master branch
git checkout master
git merge feature
```

Track Branch
------------
```Shell
# Show tracked branches (porcelain)
git branch -vv

# Show tracked branch (plumbing)
git rev-parse --abbrev-ref master@{u}

# Track a remote branch when checking it out
git checkout --track origin/dev

# Have a branch track a remote branch when pushing the branch for the first time
git push -u origin dev

# Have the current HEAD branch track a remote branch
git branch -u origin/dev
```

