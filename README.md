# portfolio_pwa

I followed the following document, as orientation:
- [Setup a Flutter Web Project on GitHub Pages](https://itnext.io/setup-a-flutter-web-project-on-github-pages-58b3118b0a28)

__Important:__ 
- As mentioned at [Building a web application with Flutter](https://flutter.dev/docs/get-started/web), you have to run the following command at terminal to generate a release build: >flutter build web
- Then at terminal: >cd build  >cd web
- Then >git init
- Then >git commit -m "first commit" (this cmd was done with the github plugin for vscode)
- Then >git remote add origin https://github.com/lbarqueira/lbarqueira.github.io.git
- Then >git push... (done with the github plugin for vscode with synchronize changes)

At this time you have a master branch with the content of the build/web

Your site is published at https://lbarqueira.github.io/

__Second phase:__
At this phase you have,  Your site published at https://lbarqueira.github.io/ 
Instead of creating another branch, we create a new repository called portfolio_pwa (where we are now) for the remaining project. __Note that .gitignore file excludes the build directory__.

Note: for each upgrade we do with this repository, and want to publish at GitHub pages we have to:
- command >flutter build web

- cmd >cd build >cd web
- cmd >git status
- cmd >git add .
- cdm >git commit -m "upgrade"
