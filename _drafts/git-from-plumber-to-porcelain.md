---
layout:     post
title:      From plumber to porcelain
date:       2016-02-04 21:34:16
summary:    Git approximation from the basis
categories: git
thumbnail:  code-fork
tags:
  - git
  - code
---

# Plumber and porcelain

The most basic commands that allows you to manage *Git's* internals, are
commonly known as _plumbing_ commands in contrast with the more user friendly
ones that are referred as _porcelain_.

This post we will begin talking about that low level _plumbing_ commands and how
are they used to manage repository objects and references. With this information
we will try to dissect, analyze and create the more complex _porcelain_ commands
with our own scripts.

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

In this folder structure we can distinguish the three main parts that represents
a working repository:

* The _repository_: As we are talking of an distributed CVS, everything
  contained inside the `.git` directory represents a full individual consistent
  directory.

* The _working directory_: Contains the directory and file structure extracted
  from the _repository_ and managed by the user. Is used to access and modify
  _repository_ content.

* The _staging area_: Represented by an `index` file placed in the root of
  `.git` directory, act as a site of interchange of files between the _working
  directory_ and the _repository_ itself. The staging area also represents the
  content of a commit if it where created in this point in time. The `index`
  does not exists when the repository has been just created.

In this post, I intend to cover at least `HEAD`, `index`, `objects` and `refs`
files and directories. Each of them contains all the information used by *Git*
to manage file  versions, branches and everything is done when `commit`,
`branch` or `checkout` commands are executed.  However we will not talk about
`pull`, `push` and `clone` commands, that are used for synchronizing different
repositories.

# Git internals

If you see it from its internals, *Git* is a _key-value_ store of objects. The
key is calculated using a _sha_ function over the value adding some meta data.
In a simple way, the content is stored as a file into the `object` folder using
its name to represent the key value. Repository objects contains all information
of the repository full history, with its directories and files.

# Git objects

There are four types of object *Git* can store:

* `blobs`: Contains bare repository files content.
* `trees`: Generates a directory structure for repository files content.
* `commits`: Represents a repository point in history.
* `tags`: Specifies version and adds information to a certain commit.

For my own convenience, we will not talk about `tags` in this post.

### Object hash calculation

`git hash-object <file>`
`git hash-object --stdin`
`git hash-object -w <file> [-t commit]`

### Managing blob objects

`git hash-object <file>`
`git hash-object --stdin`
`git hash-object -w <file> [-t commit]`
`git cat-file -p <hash>`

As can be sown, no information about file path is stored into a `blob` object,

### Combining blobs into trees

All interchange of data between objects and the _working directory_ is done
using the staging area. So, despite the `blob` contents can be added directly to
the repository using `hash-object` command, the unique way to create trees is
through it.

To add and remove files from the staging area, `update-index` plumbing command,
similar to `add`, is used.

.. code-block:: bash

    git update-index [--add|--remove] <file>

`git write-tree`
`git ls-tree`

### The staging area

The staging area represented and managed using the `index` file in `.git`
directory and can be queried executing the `git ls-files -s` command in the root
of the _working directory_.

As said before, the _working directory_ is everything that is outside the
`.git`directory.

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
of the great *Atlassian* [*Git* tutorial][atlassian-tutorial]

# Materials

All materials presented in this post can be found in my *GitHub* [account
repository][talk-repo]. Feel free to fork them and use them always following its
content license limitations.

This content was also used as a topic of a talk whose video [video][talk-video]
was recorded and published. Two drawbacks, it is in Spanish and it is terribly
long.

[talk-repo]: https://github.com/pablerass/talk-from-plumber-to-porcelain
[talk-video]: https://www.google.com/+PabloMu&ntilde;ozOrb/posts/4dk94iYRe7K
[pro-git]: https://git-scm.com/book/en/v2
[atlassian-tutorial]: https://www.atlassian.com/git/tutorials
[atl-tut-check-reset]: https://www.atlassian.com/git/tutorials/resetting-checking-out-and-reverting
