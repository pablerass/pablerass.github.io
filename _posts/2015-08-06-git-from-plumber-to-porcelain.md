---
layout:     post
title:      From plumber to porcelain
date:       06/08/2015 18:45:00
summary:    Git approximation from the basis.
categories: git
thumbnail:  code-fork
tags:
  - git
  - code
---

**Pre-note** - I am still working on this post, I will remove this pre-note when
I consider it completed.

# Plumber and porcelain

The most basic commands that allows you to manage *Git's* internals, are
commonly known as _plumbing_ commands in contrast with the more user friendly
ones that are referred as _porcelain_. This post we will begin talking about
that low level _plumbing_ commands and how are they used to manage repository
objects and references. With this information we will try to dissect, analyze
and create the more complex _porcelain_ commands with our own scripts.

# An empty *Git* repository

Creating a *Git* repository is as simple as execute `git init`. This command
basically creates a directory named `.git` with the following content:

{% highlight sh %}
user@computer [07:59:10] [~/test] [master]
-> % git init
Initialized empty Git repository in /home/user/test/.git/
user@computer [07:59:10] [~/test] [master]
-> % ls -la
total 12
drwx------ 3 ... ago  7 19:59 .
drwx------ 4 ... ago  7 19:59 ..
drwx------ 7 ... ago  8 19:59 .git
user@computer [07:59:19] [~/test] [master]
-> % ls -la .git
total 40
drwx------ 7 ... ago  7 19:59 .
drwx------ 3 ... ago  7 19:59 ..
drwx------ 2 ... ago  7 19:59 branches
-rw------- 1 ... ago  7 19:59 config
-rw------- 1 ... ago  7 19:59 description
-rw------- 1 ... ago  7 19:59 HEAD
drwx------ 2 ... ago  7 19:59 hooks
drwx------ 2 ... ago  7 19:59 info
drwx------ 4 ... ago  7 19:59 objects
drwx------ 4 ... ago  7 19:59 refs
{% endhighlight %}

Being *Git* a distributed control version system, this folder represents a full
individual consistent repository.

In this post, I intend to cover at least `HEAD`, `index`, `objects` and `refs`
files and directories, despite `index` is not yet created. Each of them contains
all the information used by *Git* to manage file  versions, branches and
everything is done when `commit`, `branch` or `checkout` commands are executed.
However we will not talk about `pull`, `push` and `clone` commands, that are
used for synchronizing different repositories.

# Git internals

If you see it from its internals, *Git* is a _key-value_ store of objects. The
key is calculated using a _sha_ function over the value adding some meta data.
In a simple way, the content is stored as a file into the `object` folder using
its name to represent the key value.

There are four types of object *Git* can store:

* `blobs`: Contains bare repository files content.
* `trees`: Generates a directory structure for repository files content.
* `commits`: Represents a repository point in history.
* `tags`: Specifies version and adds information to a certain commit.

# Git objects

### Managing blob objects

`git hash-object <file>`
`git hash-object --stdin`
`git hash-object -w <file>`
`git cat-file -t blob <hash>`

### Combining blobs into trees

`git update-index --add <file>`
`git update-index --remove <file>`
`git write-tree`
`git ls-tree`

### The staging area

`git ls-files -s`
`git ls-files -s --porcelain`

### Generating commits from trees

`git commit-tree <tree>`
`git commit-tree -p <parent> <tree>`

# References and branches

### References

`git update-ref`

Branches and tags are implemented as references to commits with the difference
that the first one can be modified and the second one should not.

### Symbolic references

### Head

To manage branch evolution and to help in creating repository history, `HEAD`
symbolic reference is used.

# Managing working directory

`git read-tree`
`git checkout-tree`

# Joining plumber into porcelain

### Commit

### Checkout

### Reset

### Merge

# Learnings and more to learn

### Changing history

### Reset vs checkout

Despite we have talk about both commands, `reset` and `checkout` are enough
important to deep inside them. There is a [great section][atl-tut-check-reset]
of the great *Atlassian* [Git tutorial][atlassian-tutorial]

# Materials

All materials presented in this post can be found in my *GitHub* [account
repository][talk-repo]. Feel free to fork them and use them always following its
content license limitations.

This content was also used as a topic of a talk whose video [video][talk-video]
was recorded and published. Two drawbacks, it is in Spanish and it is terribly
long.

[talk-repo]: https://github.com/pablerass/talk-from-plumber-to-porcelain
[talk-video]: https://www.google.com/+PabloMu&ntilde;ozOrb
[pro-git]: https://git-scm.com/book/en/v2
[atlassian-tutorial]: https://www.atlassian.com/git/tutorials
[atl-tut-check-reset]: https://www.atlassian.com/git/tutorials/resetting-checking-out-and-reverting/
