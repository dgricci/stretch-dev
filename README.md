% Image de base pour la compilation de projets (C/C++/Python/Golang/ etc ...) sous stretch  
% Didier Richard  
% 2018/08/29

---

revision:
    - 1.0.0 : 2018/08/29  

---

# Building #

```bash
$ docker build -t dgricci/dev:$(< VERSION) .
$ docker tag dgricci/dev:$(< VERSION) dgricci/dev:latest
```

## Behind a proxy (e.g. 10.0.4.2:3128) ##

```bash
$ docker build \
    --build-arg http_proxy=http://10.0.4.2:3128/ \
    --build-arg https_proxy=http://10.0.4.2:3128/ \
    -t dgricci/dev:$(< VERSION) .
$ docker tag dgricci/dev:$(< VERSION) dgricci/dev:latest
```     

# Use #

See `dgricci/stretch` README for handling permissions with dockers volumes.

The image only contains two scripts :

* `/usr/local/bin/01-install.sh` : update the apt cache and install the C/C++
compilation tools ; one can pass an argument (default `n`) to clean the apt
cache after the installation ;
* `/usr/local/bin/01-uninstall.sh` : uninstall the C/C++ compilation tools ;
  one can pass an argument (default `n`) to clean the apt cache.

This is used to build pieces of software and libraries by first install the
compilation environment, build and uninstall the compilation environment in
`Dockerfile`s (thus reducing the number of layers).

## Tests ##

```bash
$ docker run -it --rm dgricci/dev bash -c "/usr/local/bin/01-install.sh && gcc --version"
Installing g++, gcc and co ...
...
gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
Copyright (C) 2016 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

```

__Et voilà !__


_fin du document[^pandoc_gen]_

[^pandoc_gen]: document généré via $ `pandoc -V fontsize=10pt -V geometry:"top=2cm, bottom=2cm, left=1cm, right=1cm" -s -N --toc -o dev.pdf README.md`{.bash}

