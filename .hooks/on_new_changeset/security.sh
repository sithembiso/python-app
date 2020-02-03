#!/usr/bin/env bash

cmd_name="bandit"
if ! type "$cmd_name" > /dev/null; then
  pip3 install bandit
fi

out=$(bandit -r ../../)
exit_status=$?
if [ $exit_status -eq 1 ]; then
  echo "{\"id\": \"python-security\", \"output\": \"${out}\", \"score\": -1}"
else
  echo "{\"id\": \"python-security\", \"output\": \"${out}\", \"score\": 1}"
fi