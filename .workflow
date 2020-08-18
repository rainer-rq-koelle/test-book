# Need to first create an empty gh-pages branch
# see https://pkgdown.r-lib.org/reference/deploy_site_github.html
# and also add secrets for a GITHUB_PAT and EMAIL to the repository
# gh-action from Cecilapp/GitHub-Pages-deploy
checkout-and-deploy:
  runs-on: ubuntu-latest
needs: bookdown
steps:
  - name: Checkout
uses: actions/checkout@master
- name: Download artifact
uses: actions/download-artifact@v1.0.0
with:
  # Artifact name
  name: _book # optional
# Destination path
path: _book # optional
- name: Deploy to GitHub Pages
uses: Cecilapp/GitHub-Pages-deploy@master
env:
  EMAIL: ${{ secrets.EMAIL }}               # must be a verified email
GH_TOKEN: ${{ secrets.BOOK_GITHUB_PAT }} # https://github.com/settings/tokens
BUILD_DIR: _book/                     # "_site/" by default
  
  
  