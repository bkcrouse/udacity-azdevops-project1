#!/bin/bash
echo "==========STARTING BUILD=========="
echo "Validating packer template, ${BUILDER_TEMPLATE_DIR}/${BUILDER_TEMPLATE_NAME}"
packer build ${BUILDER_TEMPLATE_DIR}/${BUILDER_TEMPLATE_NAME}
echo "========== ENDING BUILD =========="