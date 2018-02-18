echo ${TRAVIS_BRANCH}
git stash
echo "switching to master"
git checkout -b master
echo "pulling master"
git pull https://${GIT_AUTH}@github.com/nivimor/eribank-ios-ci.git master
echo "merging ${TRAVIS_BRANCH} to master"
git merge ${BRANCH}
echo "pushing to master"
git push https://${GIT_AUTH}@github.com/nivimor/eribank-ios-ci.git master --force