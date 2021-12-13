#!/bin/bash
echo "==========STARTING PRE_BUILD=========="
echo "Validating packer template, ${BUILDER_TEMPLATE_DIR}/${BUILDER_TEMPLATE_NAME}"
packer validate $BUILDER_TEMPLATE_DIR/${BUILDER_TEMPLATE_NAME}
echo "========== ENDING PRE_BUILD =========="