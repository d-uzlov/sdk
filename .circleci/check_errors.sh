#!/usr/bin/env bash

if grep -r --include=*.go "\"errors\"" . ; then
  echo "Please use \"github.com/pkg/errors\" instead of \"errors\" in go imports"
  FAILED=true
fi
if grep -r --include=*.go fmt.Errorf . ; then
  echo "Please use errors.Errorf (or errors.New or errors.Wrap or errors.Wrapf) as appropriate rather than fmt.Errorf"
  FAILED=true
fi
[[ -z ${FAILED} ]] || exit 1

