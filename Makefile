.PHONY: lint format all

POETRY = $(shell which poetry)
POETRY_OPTION = --no-interaction --no-ansi
POETRY_RUN = ${POETRY} run ${POETRY_OPTION}
MYPY_OPTIONS = --install-types --non-interactive --ignore-missing-imports

lint:
	${POETRY_RUN} ruff check . --fix
	${POETRY_RUN} mypy ${MYPY_OPTIONS} -p api

format:
	${POETRY_RUN} ruff format .

all: format lint 