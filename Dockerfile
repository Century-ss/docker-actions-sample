############################################
# setup
############################################
FROM python:3.10.1-buster AS build

COPY main.py /main.py

############################################
# 1. pip 30[second]
############################################
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT ["python3", "/main.py"]

############################################
# 2. pipenv 38[second]
############################################
# COPY Pipfile.lock /Pipfile.lock
# COPY Pipfile /Pipfile
# RUN pip install pipenv
# RUN pipenv sync --system
# ENTRYPOINT ["python3", "/main.py"]

############################################
# 3. rye 47[second] ※ただし、python環境が不要なのでイメージを軽いものに選定すれば早くなる可能性あり
############################################
# ENV RYE_HOME="/opt/rye"
# ENV PATH="$RYE_HOME/shims:$PATH"
# COPY requirements.lock /requirements.lock
# COPY pyproject.toml /pyproject.toml
# COPY README.md /README.md
# RUN curl -sSf https://rye-up.com/get | RYE_NO_AUTO_INSTALL=1 RYE_INSTALL_OPTION="--yes" bash
# RUN rye sync --no-dev --no-lock
# ENTRYPOINT ["/.venv/bin/python", "/main.py"]
