.PHONY: all

GEMMA4 := unsloth/gemma-4-E4B-it-GGUF:UD-Q6_K_XL

gemma4:
	echo "Hello $(GEMMA4)"
	llama-server -hf $(GEMMA4) --threads-http 1 --threads 8 --no-mmproj --reasoning off --no-warmup -ngl -1 -np 1 --host 0.0.0.0 --temp 1.0 --top_p 0.95 --top_k 64
