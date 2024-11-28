# bitrot

Detects bit rotten files on the hard drive to save your precious photo and music
collection from slow decay.

## Usage

Go to the desired directory and simply invoke:
```shell
$ bitrot
```
This will start digging through your directory structure recursively indexing
all files found. The index is stored in a `.bitrot.db` file which is a SQLite
3 database.

Next time you run `bitrot` it will add new files and update the index for files
with a changed modification date. Most importantly however, it will report all
errors, e.g. files that changed on the hard drive but still have the same
modification date.

All paths stored in `.bitrot.db` are relative so it's safe to rescan a folder
after moving it to another drive. Just remember to move it in a way that doesn't
touch modification dates. Otherwise the checksum database is useless.

## Tests

There's a simple but comprehensive test scenario using
[pytest](https://pypi.org/p/pytest) and
[pytest-order](https://pypi.org/p/pytest-order).

1. Create venv:
   ```shell
   python -m venv .venv
   ```
2. Activate venv:
   ```shell
   . .venv/bin/activate
   ```
3. Install `pytest` & `pytest-order`:
   ```shell
   pip install -e .[test]
   ```
4. Run:
   ```shell
   (.venv)$ pytest -x
   ==================== test session starts ====================
   platform darwin -- Python 3.10.14, pytest-8.3.4, pluggy-1.5.0
   rootdir: /Users/alexander/sources/bitrot
   configfile: pyproject.toml
   plugins: order-1.3.0
   collected 13 items

   tests/test_bitrot.py .............                     [100%]

   ==================== 13 passed in 16.22s ====================
   ```

## Licence
[MIT](https://opensource.org/license/MIT)
