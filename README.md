# Running llama.cpp benchmarks on jupyter notebook with bash kernel

- Saves all commands and their outputs

## Installation 
- Install uv
  
```
uv venv
uv pip install jupyter,theme-darcula bash_kernel
uv run python -m bash_kernel.install
uv run --with jupyter,theme-darcula jupyter lab --ip 0.0.0.0
```