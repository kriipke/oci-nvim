# Dockerized Neovim

	docker build -t o0zi .

	docker run --rm -it -v $(pwd):/src o0zi

	alias o0zi='docker run --rm -it -v $(pwd):/src o0zi'

