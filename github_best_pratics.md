# Git good pratics
:+1:

ref:
- https://sethrobertson.github.io/GitBestPractices/
- https://github.com/trein/dev-best-practices/wiki/Git-Commit-Best-Practices
- https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
- https://github.com/erlang/otp/wiki/writing-good-commit-messages

# Branch
> 111

**ONE branch ONE propuse ONE ticket**

means:
* do only defined tasks
* do not mix adding feature and refactoring
* do not change behavier while refactoring or enhancing

## Branch Name
Formula:
```
keyword/TK-xxx/big-description
```

keywords:
- feature
- enhance
- refactor
- fix

--------------------------------------------------------------

# Commits
> 11

**ONE thing in ONE commit**  (better: test include)

means:
* commit offen
* small commit
* commit only finish stuff

## Commit Message
meanningful description for every commit

"
When writing a commit message remember it will be read out of the context of a pull request after merging so be explicit about the subject of your changes
"

Formula
```
Keywords(capitalize) class methods
```
```
Keywords(capitalize) file
```

keywords:
- Add (Create)
- Remove (Delete)
- Update
- Fix
- Refactor
- Replace
- Move
- etc


sample 1:
```
1. Add migration to create User table
2. Add class User
3. Add login for User
4. ...
```

sample 2:
```
1. Fix user loggin raise not found issue
```

sample 3:
```
1. Add spec for User login
2. Add spec for User logout
```

sample 4:
```
1. Remove route /users
2. Remove User controller
3. Remove User model class
```

--------------------------------------------------------------
# Toolling

to better view commits

1. tig
2. git log --all --decorate --oneline --graph
3. gitk
