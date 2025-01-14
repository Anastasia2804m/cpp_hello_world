name: Pull Request To Dev
run-name: Run Integration Tests
on:
pull_request:
branches:
- 'dev'
jobs:
integration_testing:
runs-on: ubuntu-latest
steps:
- name: Checkout
uses: actions/checkout@v3
- name: Install requirements
run: pip install -r requirements.txt
- name: Run app
run: python3 ./src/app/app.py &
- name: Test GET-request
run: |
ANSW=$(curl http://127.0.0.1:5000/)
if [ "$ANSW" != "05.07.2023" ]; then
exit 1
else
echo "Integration Test PASS"
fi
