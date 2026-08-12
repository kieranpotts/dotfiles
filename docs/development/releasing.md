# Releasing

Releases are tagged in Git. The dotfiles' version numbers are now used to pin
builds of my [devcontainer](https://hub.docker.com/r/kieranpotts/docker-devcontainer)
to a specific point in this repository's history.

Update the changelog, and commit it:

```
$ git add CHANGELOG.md
$ git commit -m "version: <major>.<minor>.<patch>"
```

Tag the release:

```
$ git tag -a v<major>.<minor>.<patch>
```

Copy-and-paste the release notes from the changelog entry into the
commit message.

Then push the commit and tag:

```
$ git push
$ git push --tags
```

Manually prepare the GitHub release.
