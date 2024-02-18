conda activate privategpt #assumes you have an conda base environment/installation 
cd ~/git
git clone https://github.com/imartinez/privateGPT
cd privateGPT
poetry install --with ui,local
poetry run python scripts/setup
CMAKE_ARGS='-DLLAMA_CUBLAS=on' poetry run pip install --force-reinstall --no-cache-dir llama-cpp-python
PGPT_PROFILES=local make run

