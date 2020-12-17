# stix_type1
Type 1 versions of STIX 2.0.0 (deprecated)

If you are using XeTeX or luaTeX, you do not need the files in this
directory.  The [STIX Two fonts](https://github.com/stipub/stixfonts)
are OpenType fonts and are best used in that format.

The stix2 package provides support for versions of TeX that are
limited to TFM files, Type 1 PostScript fonts, and 8-bit font
encodings.  Version 2.0.0 of the STIX fonts are being released in this
format in hopes of easing the transition from legacy TeX engines to
modern fully Unicode-compatible systems.  The Type 1 versions are
merely a repackaging of the original OpenType versions and should not
be viewed as independent entities.  Some glyphs that are traditionally
available in TeX math fonts are not yet available in the STIX Two
OpenType fonts.  In such cases, we have chosen to omit them from the
stix2 package rather than create incompatibilities between the
OpenType and Type 1 versions.

Note that although development of the OpenType fonts is ongoing, **no
further updates** are planned to the Type 1 distribution; future
development efforts will focus on improving the OpenType fonts.
Patches to the existing Type 1 distribution are welcome and, pending
review, will be incorporated into the distribution.
