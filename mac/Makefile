.PHONY: all

uv:
	uv run --with jupyter jupyter lab --ip 0.0.0.0

ttyd:
	ttyd -W /bin/zsh

MODEL := unsloth/Qwen3.5-35B-A3B-GGUF:UD-IQ3_S
serve:
	echo "Serving $(MODEL)"
	#llama-server -hf $(MODEL) --threads-http 1 --threads 8 --no-mmproj --reasoning off --no-warmup -ngl -1 -np 1 --host 0.0.0.0

GEMMA4 := unsloth/gemma-4-E4B-it-GGUF:UD-Q6_K_XL
gemma4:
	echo "Hello $(GEMMA4)"
	llama-server -hf $(GEMMA4) --threads-http 1 --threads 8 --no-mmproj --reasoning off --no-warmup -ngl -1 -np 1 --host 0.0.0.0 --temp 1.0 --top_p 0.95 --top_k 64
