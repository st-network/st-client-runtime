# https://stackoverflow.com/questions/71953788/set-env-variables-in-a-github-action-before-deploying-to-firebase-hosting
runtime-user-routesname: Deploy to Firebase Hosting on PR
on: pull_request
jobs:
  build_and_preview:
    if: "${{ github.event.pull_request.head.repo.full_name == github.repository }}"
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - run: npm install && npm run build
        env:
          REACT_APP_STS_API_KEY: ${{ secrets.REACT_APP_STS_API_KEY }}