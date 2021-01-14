#!/bin/bash

set -e

BUILD_TDS=1

for option in "$@"; do
    case $option in
        -all    ) BUILD_TDS=1 ;;
        -tds    ) BUILD_TDS=1 ;;
        -no-tds ) BUILD_TDS=0 ;;
        *       ) echo "Invalid option: $option"; exit 1 ;;
    esac
done

/bin/rm -rf stix2-type1 tds *.zip

install_src ()
{
    echo "Installing files from ../fonts/$1 into stix2-type1/$2"

    mkdir -p stix2-type1/$2
    cp -p ../fonts/$1/* stix2-type1/$2/
}

mkdir stix2-type1

cp -p README.md              stix2-type1/
cp -p ../stix2.pdf           stix2-type1/
cp -p ../stix2.fdd           stix2-type1/
cp -p ../stix2.dtx           stix2-type1/
cp -p ../stix2.ins           stix2-type1/
cp -p ../fonts/map/stix2.map stix2-type1/

install_src enc    enc
install_src type1  pfb
install_src source pl
install_src tfm    tfm

zip -r stix2-type1.zip stix2-type1

if ((! $BUILD_TDS)); then
    exit
fi

install_tds ()
{
    echo "Installing files from ../fonts/$1 into tds/fonts/$1/$2"

    mkdir -p tds/fonts/$1/$2
    cp -p ../fonts/$1/* tds/fonts/$1/$2/
}

mkdir -p tds/doc/latex/stix2
cp -p ../stix2.pdf tds/doc/latex/stix2
cp -p README.md    tds/doc/latex/stix2

mkdir -p tds/source/latex/stix2
cp -p ../stix2.fdd ../stix2.dtx ../stix2.ins tds/source/latex/stix2

# install_tds tex    latex/stix2

install_tds enc    dvips/stix2
install_tds map    dvips/stix2
install_tds source public/stix2
install_tds tfm    public/stix2
install_tds type1  public/stix2

mkdir -p tds/tex/latex/stix2

BASE=$PWD/tds

pushd tds/source/latex/stix2

cat > docstrip.cfg <<EOF
\BaseDirectory{$BASE}

\UseTDS

\endinput
EOF

export openout_any=a
tex stix2.fdd
tex stix2.ins

rm docstrip.cfg
rm *.log

popd

(cd tds; zip -r ../stix2-type1.tds.zip *)
