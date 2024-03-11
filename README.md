# docker-actions-sample
Dockerで動かすGithub Actionsのサンプル

## Overview

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

## `who_to_greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

## `time`

The time we greeted you.

## Example usage

uses: actions/hello-world-docker-action@v2
with:
  who_to_greet: 'Mona the Octocat'

## requirements.txtの生成コマンド
- pipenv：`pipenv run pip freeze > requirements.txt`
- rye：`sed '/-e/d' requirements.lock > requirements.txt`
