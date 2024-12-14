# tocsin

Script to detect bit rot, fork of [ambv/bitrot](https://github.com/ambv/bitrot)

## Usage & documentation
```shell
make help
```

For everything else RTFM.

## Tests

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
