git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"

git add instapi/version.txt
git commit -m "Bump Version (Build $TRAVIS_BUILD_NUMBER) [skip ci]"
git remote rm origin
git remote add origin https://breuerfelix:${GH_TOKEN}@github.com/breuerfelix/instapi.git
git push origin master

cat instapi/version.txt | xargs git tag
git push --tags