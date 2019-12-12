
clean:
	rm -rf manifest_urls.txt master/

manifest_urls.txt:
	./bin/list_central_dep_files.sh Cargo.toml Cargo.lock package.json package-lock.json yarn.lock 'requirements*.txt' 'requirements*.in'

all: manifest_urls.txt
	xargs -a manifest_urls.txt -L 1 ./bin/fetch_central_dep_file.sh

.PHONY: all clean
