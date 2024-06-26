.PHONY: quality style test test-common test-tf test-torch docs-single-version docs
# this target runs checks on all files
quality:
	ruff check .
	mypy doctr/

# this target runs checks on all files and potentially modifies some of them
style:
	ruff check --fix .
	ruff format .

package:
	python -m build

# Run tests for the library
test:
	coverage run -m pytest tests/common/
	USE_TF='1' coverage run -m pytest tests/tensorflow/
	USE_TORCH='1' coverage run -m pytest tests/pytorch/

test-common:
	coverage run -m pytest tests/common/

test-common-rerun:
	coverage run -m pytest tests/common/ --lf

test-tf:
	USE_TF='1' coverage run -m pytest tests/tensorflow/

test-tf-rerun:
	USE_TF='1' coverage run -m pytest tests/tensorflow/ --lf

test-torch:
	USE_TORCH='1' coverage run -m pytest tests/pytorch/

test-torch-rerun:
	USE_TORCH='1' coverage run -m pytest tests/pytorch/ --lf

# Check that docs can build
docs-single-version:
	sphinx-build docs/source docs/_build -a

# Check that docs can build
docs:
	cd docs && bash build.sh
