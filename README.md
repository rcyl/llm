# Running llama.cpp benchmarks on jupyter notebook with bash kernel

- Saves all commands and their outputs

## Mac
- Hardware is m4 basic with 16GiB of RAM 
- Install uv then run the following:
```
uv venv
uv pip install jupyter,theme-darcula bash_kernel
uv run python -m bash_kernel.install
uv run --with jupyter,theme-darcula jupyter lab --ip 0.0.0.0
make uv
```

## PC
- Hardware is i5 PC with 4 cores with 16GiB of RAM and 2060 with 6 GiB of RAM
- make uv (takes care of building the docker image)
