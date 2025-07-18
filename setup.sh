#!/usr/bin/env bash
set -euo pipefail

# 1. Create & activate virtual environment
python -m venv env
# shellcheck disable=SC1091
source env/Scripts/activate  # Windows: source env/Scripts/activate

# 2. Install pip-tools
pip install pip-tools

# 3. Compile & sync dependencies
pip-compile requirements.in   # → generates requirements.txt
pip-sync                      # installs exact versions

# 4. Install package in editable mode
pip install -e .

# 5. Verification
python -c "import pylidc_clone; print('Version:', pylidc_clone.__version__)"

echo "✅ Setup complete. Run 'pytest' to test."
