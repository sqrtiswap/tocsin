# tocsin

Script to detect bit rot, fork of [ambv/bitrot](https://github.com/ambv/bitrot)

## (Un-)Installation
Install with
```shell
make install
```
Uninstall with
```shell
make uninstall
```

## Usage

Enter the desired directory and invoke:
```shell
$ tocsin
```
This will start digging through the directory structure recursively indexing
all files found. The index is stored in a `.tocsin.db` file which is an SQLite
3 database.

Next time `tocsin` is run it will add new files and update the index for files
with a changed modification date. Most importantly however, it will report all
errors, e.g. files that changed on the drive but still have the same
modification date.

All paths stored in `.tocsin.db` are relative, so it's safe to rescan a folder
after moving it to another drive. Just remember to move it in a way that doesn't
touch modification dates. Otherwise the checksum database is useless.

## Tests

[pytest](https://pypi.org/p/pytest) &
[pytest-order](https://pypi.org/p/pytest-order).

1. Create venv:
   ```shell
   python -m venv .venv
   ```
2. Activate venv:
   ```shell
   . .venv/bin/activate
   ```
3. Install [pytest](https://pypi.org/p/pytest) &
   [pytest-order](https://pypi.org/p/pytest-order):
   ```shell
   pip install -e .[test]
   ```
4. Run `pytest -x`:
   ```shell
   (.venv)$ pytest -x
   ==================== test session starts ====================
   platform darwin -- Python 3.10.14, pytest-8.3.4, pluggy-1.5.0
   rootdir: /Users/alexander/sources/tocsin
   configfile: pyproject.toml
   plugins: order-1.3.0
   collected 13 items

   tests/test_tocsin.py .............                     [100%]

   ==================== 13 passed in 16.22s ====================
   ```

## Name
A Tocsin is an alarm or other warning signal.

## Licence
[MIT](https://opensource.org/license/MIT)
