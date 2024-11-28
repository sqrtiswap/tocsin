======
bitrot
======

Detects bit rotten files on the hard drive to save your precious photo
and music collection from slow decay.

Usage
-----

Go to the desired directory and simply invoke::

  $ bitrot

This will start digging through your directory structure recursively
indexing all files found. The index is stored in a ``.bitrot.db`` file
which is a SQLite 3 database.

Next time you run ``bitrot`` it will add new files and update the index
for files with a changed modification date. Most importantly however, it
will report all errors, e.g. files that changed on the hard drive but
still have the same modification date.

All paths stored in ``.bitrot.db`` are relative so it's safe to rescan
a folder after moving it to another drive. Just remember to move it in
a way that doesn't touch modification dates. Otherwise the checksum
database is useless.

Performance
-----------

Obviously depends on how fast the underlying drive is.  Historically
the script was single-threaded because back in 2013 checksum
calculations on a single core still outran typical drives, including
the mobile SSDs of the day.  In 2020 this is no longer the case so the
script now uses a process pool to calculate SHA1 hashes and perform
`stat()` calls.

No rigorous performance tests have been done.  Scanning a ~1000 file
directory totalling ~5 GB takes 2.2s on a 2018 MacBook Pro 15" with
a AP0512M SSD.  Back in 2013, that same feat on a 2015 MacBook Air with
a SM0256G SSD took over 20 seconds.

On that same 2018 MacBook Pro 15", scanning a 60+ GB music library takes
24 seconds.  Back in 2013, with a typical 5400 RPM laptop hard drive
it took around 15 minutes.  How times have changed!

Tests
-----

There's a simple but comprehensive test scenario using
`pytest <https://pypi.org/p/pytest>`_ and
`pytest-order <https://pypi.org/p/pytest-order>`_.

Install::

  $ python3 -m venv .venv
  $ . .venv/bin/activate
  (.venv)$ pip install -e .[test]

Run::

  (.venv)$ pytest -x
  ==================== test session starts ====================
  platform darwin -- Python 3.10.12, pytest-7.4.0, pluggy-1.2.0
  rootdir: /Users/ambv/Documents/Python/bitrot
  plugins: order-1.1.0
  collected 12 items

  tests/test_bitrot.py ............                      [100%]

  ==================== 12 passed in 15.05s ====================

Authors
-------

Glued together by `Łukasz Langa <mailto:lukasz@langa.pl>`_. Multiple
improvements by
`Ben Shepherd <mailto:bjashepherd@gmail.com>`_,
`Jean-Louis Fuchs <mailto:ganwell@fangorn.ch>`_,
`Marcus Linderoth <marcus@thingsquare.com>`_,
`p1r473 <mailto:subwayjared@gmail.com>`_,
`Peter Hofmann <mailto:scm@uninformativ.de>`_,
`Phil Lundrigan <mailto:philipbl@cs.utah.edu>`_,
`Reid Williams <rwilliams@ideo.com>`_,
`Stan Senotrusov <senotrusov@gmail.com>`_,
`Yang Zhang <mailto:yaaang@gmail.com>`_, and
`Zhuoyun Wei <wzyboy@wzyboy.org>`_.
