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

**Note** - If you have already read the [Pro Git][pro-git] chapter 10, you can
avoid this post. If you have not done it yet and you are interested in *Git*, I
think you should.

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

In this post, I intend to cover at least `branches`, `HEAD`, `index`, `objects`
and `refs` files and directories. Each of them contains all the information used
by *Git* to manage source code versions, branches and everything you do when
`clone`, `commit`, `branch` or `checkout` commands are executed.

# Git internals

If you see it from its internals, *Git* is a key, value store. The key is
calculated using a hash function over the value . In a simple way, the content
is stored as a file into the `object` folder its file name to represent the key
value.

There are four types of object Git can store:

* `blobs`:
* `trees`:
* `commits`:
* `tags`:

The most basic commands that allows you to manage *Git's* key, value store are
commonly known as "plumbing" commands in contrast with the more user friendly
ones that are referred as "porcelain".

### Managing blob objects

### The staging area

### Combining blobs into trees

### Generating commits from trees

# References and branches

# Managing staging area

# Joining plumber into porcelain

### Commit

### Checkout

### Revert

### Merge

[pro-git]: https://git-scm.com/book/en/v2
