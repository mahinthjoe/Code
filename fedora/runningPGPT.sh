cd git/privateGPT/
conda activate privateGPT
poetry install --with u,local
poetry run python scripts/setup
CMAKE_ARGS='-DLLAMA_CUBLAS=on' poetry run pip install --force-reinstall --no-cache-dir llama-cpp-python
PGPT_PROFILES=local make run
