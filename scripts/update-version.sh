#!/bin/sh
# Update an AUR package's PKGBUILD to the specified version.

function example_usage() {
    echo -e "\nExample usage: ./update-version.sh [PACKAGE_NAME] [PACKAGE_VERSION]"
}

if [ $# -eq 0 ]; then
    echo "Please provide a package name (argument 1) and version number (argument 2)."
    example_usage
    exit 1
fi

if [ $# -eq 1 ]; then
    echo "Please provide a version number (argument 2)."
    example_usage
    exit 1
fi

echo "Updating $1 PKGBUILD to version $2..."
sed -E "s#(pkgver=).*#\1$2#" -i $1/PKGBUILD
