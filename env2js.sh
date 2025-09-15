#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <env_file>"
  exit 1
fi
ENV_FILE="$1"
if [ ! -f "$ENV_FILE" ]; then
  echo "File '$ENV_FILE' not found!"
  exit 1
fi
if [ -n "$ALLOWED_VARS" ]; then
  IFS=',' read -ra ALLOWED_VARS_ARRAY <<< "$ALLOWED_VARS"
else
  ALLOWED_VARS_ARRAY=()
fi
while IFS='=' read -r key value; do
  key=$(echo "$key" | xargs)
  value=$(echo "$value" | xargs)
  [[ -z "$key" || "$key" == \#* ]] && continue
  for allowed in "${ALLOWED_VARS_ARRAY[@]}"; do
    if [ "$key" == "$allowed" ]; then
      echo "Config.${key} = \"${value}\";"
    fi
  done
done < "$ENV_FILE"
