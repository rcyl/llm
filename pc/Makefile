.PHONY: serve

MODEL := unsloth/Qwen3.6-35B-A3B-GGUF:UD-IQ4_NL
ARGS := /src/args.txt
CMOE := 36
args:
	podman run --rm --network host --device nvidia.com/gpu=all \
		--entrypoint "/bin/bash" \
		-v$(PWD):/src \
		-v$(HOME)/.cache/huggingface:/root/.cache/huggingface \
		ghcr.io/ggml-org/llama.cpp:full-cuda \
        -c "cat $(ARGS) | xargs ./llama-server -hf $(MODEL) \
		--threads-http 1 -np 1 --host 0.0.0.0 \
		--no-mmproj --no-warmup \
		--temp 1.0 --top-p 0.95 --top-k 20 --presence_penalty 1.5 --min-p 0.00 --reasoning off"

fit:
	podman run --rm --device nvidia.com/gpu=all \
		--entrypoint "/bin/bash" \
		-v$(PWD):/src \
		-v$(HOME)/.cache:/root/.cache \
		ghcr.io/ggml-org/llama.cpp:full-cuda \
		-c "./llama-fit-params -hf $(MODEL) -ub 128 -fitt 512 -ngl 99 -ncmoe $(CMOE) | tee /src/bla.txt"

serve:
	podman run --rm --network host --device nvidia.com/gpu=all \
		-v$(HOME)/.cache/huggingface:/root/.cache/huggingface \
		ghcr.io/ggml-org/llama.cpp:full-cuda \
        --server -hf $(MODEL) -ub 64 -fitt 512 -ngl 41 -ncmoe 36 \
		--threads-http 1 -np 1 --host 0.0.0.0 \
		--no-mmproj --no-warmup \
		--temp 1.0 --top-p 0.95 --top-k 20 --presence_penalty 1.5 --min-p 0.00 --reasoning off

cli:
	podman run --rm -it --device nvidia.com/gpu=all \
		--entrypoint "/app/llama-cli" \
		-v$(HOME)/.cache/huggingface:/root/.cache/huggingface \
		ghcr.io/ggml-org/llama.cpp:full-cuda \
        -hf $(MODEL) -lv 3 -ub 256 -ncmoe 32 --no-mmap -ngl 41 \
		--no-warmup --reasoning off

ttyd:
	ttyd -W /bin/bash

pull:
	podman pull ghcr.io/ggml-org/llama.cpp:full-cuda

it:
	podman run -it --device nvidia.com/gpu=all \
		--entrypoint "/bin/bash" \
		-v$(HOME)/.cache:/root/.cache \
		ghcr.io/ggml-org/llama.cpp:full-cuda

stop-gui:
	sudo systemctl isolate multi-user.target

start-gui:
	sudo systemctl isolate graphical.target

sync:
	rsync -av ~/.cache /mnt/hdd/cache

uv:
	podman run --rm --network host \
		--device nvidia.com/gpu=all \
		-v$(HOME)/.cache/huggingface:/root/.cache/huggingface \
        -v$(PWD):/src -w/src \
		$(shell podman build -q -f Dockerfile $(shell mktemp -d))

cli:
	podman run --rm -it --device nvidia.com/gpu=all \
		--entrypoint "/app/llama-cli" \
		-v$(HOME)/.cache/huggingface:/root/.cache/huggingface \
		ghcr.io/ggml-org/llama.cpp:full-cuda \
        -hf $(MODEL) -lv 3 -ub 256 -ncmoe 32 --no-mmap -ngl 41 \
		--no-warmup --reasoning off
