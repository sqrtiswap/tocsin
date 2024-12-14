# bitrot-1.0.1 (2023-08-02)
* officially remove Python 2 support that was broken since 1.0.0
  anyway; now the package works with Python 3.8+ because of a few
  features

# bitrot-1.0.0 (2020-05-18)
* significantly sped up execution on solid state drives by using
  a process pool executor to calculate SHA1 hashes and perform `stat()`
  calls; use `-w1` if your runs on slow magnetic drives were
  negatively affected by this change
* sped up execution by pre-loading all SQLite-stored hashes to memory
  and doing comparisons using Python sets
* all UTF-8 filenames are now normalized to NFKD in the database to
  enable cross-operating system checks
* the SQLite database is now vacuumed to minimize its size
* bugfix: additional Python 3 fixes when Unicode names were encountered

# bitrot-0.9.2 (2016-11-01)
* bugfix: one place in the code incorrectly hardcoded UTF-8 as the
  filesystem encoding

# bitrot-0.9.1 (2016-10-30)
* bugfix: print the path that failed to decode with FSENCODING
* bugfix: when using -q, don't hide warnings about files that can't be
  statted or read
* bugfix: -s is no longer broken on Python 3

# bitrot-0.9.0 (2016-08-09)
* bugfix: bitrot.db checksum checking messages now obey --quiet
* Python 3 compatibility

# bitrot-0.8.0 (2016-05-03)
* bitrot now keeps track of its own database's bitrot by storing
  a checksum of .bitrot.db in .bitrot.sha512
* bugfix: now properly uses the filesystem encoding to decode file names
  for use with the .bitrotdb database. Report and original patch by
  pallinger.

# bitrot-0.7.1 (2015-11-02)
* bugfix: SHA1 computation now works correctly on Windows; previously
  opened files in text-mode. This fix will change hashes of files
  containing some specific bytes like 0x1A.

# bitrot-0.7.0 (2015-06-23)
* when a file changes or is renamed, the timestamp of the last check is
  updated, too
* bugfix: files that disappeared during the run are now properly ignored
* bugfix: files that are locked or with otherwise denied access are
  skipped. If they were read before, they will be considered "missing"
  in the report.
* bugfix: if there are multiple files with the same content in the
  scanned directory tree, renames are now handled properly for them
* refactored some horrible code to be a little less horrible

# bitrot-0.6.0 (2013-11-11)
* more control over performance with ``--commit-interval`` and
  ``--chunk-size`` command-line arguments
* bugfix: symbolic links are now properly skipped (or can be followed if
  ``--follow-links`` is passed)
* bugfix: files that cannot be opened are now gracefully skipped
* bugfix: fixed a rare division by zero when run in an empty directory

# bitrot-0.5.1 (2013-03-15)
* bugfix: warn about test mode only in test mode

# bitrot-0.5.0 (2013-03-15)
* ``--test`` command-line argument for testing the state without
  updating the database on disk (works for testing databases you don't
  have write access to)
* size of the data read is reported upon finish
* minor performance updates

# bitrot-0.4.0 (2013-03-04)
* renames are now reported as such
* all non-regular files (e.g. symbolic links, pipes, sockets) are now
  skipped
* progress presented in percentage

# bitrot-0.3.0 (2013-02-26)
* ``--sum`` command-line argument for easy comparison of multiple
  databases

# bitrot-0.2.1 (2013-02-12)
* fixed regression from 0.2.0 where new files caused a ``KeyError``
  exception

# bitrot-0.2.0 (2013-02-10)
* ``--verbose`` and ``--quiet`` command-line arguments
* if a file is no longer there, its entry is removed from the database

# bitrot-0.1.0 (2013-01-17)
* First published version.
