#!/bin/bash
set -eu

if [[ "$1" == apache2* ]] || [ "$1" == php-fpm ]; then

	if ! [ -e index.php ]; then
		echo >&2 "queXML not found in $(pwd) - copying now..."
		if [ "$(ls -A)" ]; then
			echo >&2 "WARNING: $(pwd) is not empty - press Ctrl+C now if this is an error!"
			( set -x; ls -A; sleep 10 )
		fi
		bzr export . /usr/src/quexml

		echo >&2 "Complete! queXF has been successfully copied to $(pwd)"
	else
        echo >&2 "queXML found in $(pwd) - not copying."
	fi

  chown www-data:www-data -R /images 
fi

exec "$@"
