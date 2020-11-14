#!/usr/bin/env sh

SPEC_GIT_REVISION=`grep "%define git_revision[^_]" emacs.spec | cut -d " " -f 3`
REMOTE_GIT_REVISION=`git ls-remote git://github.com/emacs-mirror/emacs.git refs/heads/master | cut -f 1`

if [ "${SPEC_GIT_REVISION}" = "${REMOTE_GIT_REVISION}" ]
then
    echo "No new git revision : skipping update"
    exit 0
fi

echo "New git revision {${REMOTE_GIT_REVISION}} : updating"

PKGREL=`awk '/Release:/ {print $2}' emacs.spec | cut -d "." -f 1`
NEW_PKGREL=$((${PKGREL} + 1))

sed -i "s/${SPEC_GIT_REVISION}/${REMOTE_GIT_REVISION}/" emacs.spec
sed -ri "s/(Release:\s+) [0-9]+/\1 ${NEW_PKGREL}/" emacs.spec
