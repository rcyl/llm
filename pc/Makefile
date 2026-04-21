.PHONY: all

ttyd:
	ttyd -W /bin/bash

it:
	podman run -it --device nvidia.com/gpu=all \
		--entrypoint "/bin/bash" \
		-v$(PWD)/cache:/root/.cache \
		ghcr.io/ggml-org/llama.cpp:full-cuda

uv:
	podman run --rm --network host \
		--device nvidia.com/gpu=all \
		-v$(HOME)/.cache/huggingface:/root/.cache/huggingface \
        -v$(PWD):/src -w/src \
		$(shell podman build -q -f Dockerfile $(shell mktemp -d))

MODEL := unsloth/gemma-4-E4B-it-GGUF:UD-Q6_K_XL
serve:
	podman run --rm --network host --device nvidia.com/gpu=all \
		-v$(HOME)/.cache/huggingface:/root/.cache/huggingface \
		ghcr.io/ggml-org/llama.cpp:full-cuda \
        --server -hf $(MODEL) --threads-http 1 -ub 64 -fitt 256 -ngl -1 \
		--no-mmproj --reasoning off -np 1

cli:
	podman run --rm -it --device nvidia.com/gpu=all \
		--entrypoint "/app/llama-cli" \
		-v$(HOME)/.cache/huggingface:/root/.cache/huggingface \
		ghcr.io/ggml-org/llama.cpp:full-cuda \
        -hf $(MODEL) -ub 64 -fitt 256 -ngl -1 \
		--no-mmproj --reasoning off
