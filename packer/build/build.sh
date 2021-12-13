#!/bin/bash
echo "==========STARTING BUILD=========="
echo "Validating packer template, templates/packer.json"
packer build $BUILDER_TEMPLATE_DIR/packer.json
echo "========== ENDING BUILD =========="