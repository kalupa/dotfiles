#!/usr/bin/env bash

gem list -i mysql2 -v 0.5.2

gem install mysql2 -v '0.5.2' -- \
	--with-ldflags="-L$(brew --prefix openssl)/lib" \
	--with-cppflags="-I$(brew --prefix openssl)/include"
