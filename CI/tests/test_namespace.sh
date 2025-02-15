set -xeEo pipefail

source CI/tests/common.sh

trap error ERR
trap finish EXIT

function funtional_test_namespace_deletion {
  export scenario_type="namespace_scenarios"
  export scenario_file="-  CI/scenarios/ingress_namespace.yaml"
  export post_config=""
  envsubst < CI/config/common_test_config.yaml > CI/config/namespace_config.yaml

  python3 -m coverage run -a run_kraken.py -c CI/config/namespace_config.yaml
  echo $?
  echo "Namespace scenario test: Success"
}

funtional_test_namespace_deletion
