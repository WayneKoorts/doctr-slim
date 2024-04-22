## doctr-slim

This is a trimmed-down fork of doctr, borne out of the need for a more easily-embeddable version of doctr, without some of the extra bells and whistles.

## How does doctr-slim differ from doctr?

* weasyprint dependency removed.
* pypdfium dependency removed.
* Can't read PDFs as Document sources.

## Dev setup

Create a virtual env using the `dev` dependencies when prompted, e.g. if using Visual Studio Code.  Specify the `references/requirements.txt` file for the pip requirements.

### Packaging

Make sure `build` is installed (`pip install --upgrade build`) then run `BUILD_VERSION='x.x.x' make package`.  Use whatever version you'd actually like instead of `x.x.x`.  The package wheel and tar archive will be created in `dist/`.
