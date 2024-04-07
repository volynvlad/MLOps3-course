ARG PYTHON_BASE=3.11-slim
FROM python:${PYTHON_BASE} AS builder

RUN pip install -U pdm
# disable update check
ENV PDM_CHECK_UPDATE=false

WORKDIR /app

COPY pdm.prod.lock .pdm-python pyproject.toml README.md /app/

RUN pdm install --check --prod --no-editable --lockfile pdm.prod.lock
COPY src/ /app/src

# run stage
FROM python:${PYTHON_BASE}

COPY --from=builder /app/.venv /app/.venv
ENV PATH="/app/.venv/bin:$PATH"
RUN pip install -U pdm

ENV PDM_CHECK_UPDATE=false

WORKDIR /app

COPY pdm.prod.lock .pdm-python pyproject.toml README.md /app/
COPY src/ /app/src

RUN pdm install --check --prod --no-editable --lockfile pdm.prod.lock

ENTRYPOINT [ "python", "src/mlops3_course/__init__.py" ]
