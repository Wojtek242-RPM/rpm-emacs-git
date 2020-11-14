[![Copr build status](https://copr.fedorainfracloud.org/coprs/robot/emacs-git/package/emacs/status_image/last_build.png)](https://copr.fedorainfracloud.org/coprs/robot/emacs-git/package/emacs/)

# Emacs-git

Instructions based on this [blog
post](https://hobo.house/2017/09/03/automate-rpm-builds-from-git-sources-using-copr/)

# Testing build locally

```
sudo dnf builddep emacs.spec
spectool -g -R emacs.spec
rpmbuild -ba emacs.spec
```
