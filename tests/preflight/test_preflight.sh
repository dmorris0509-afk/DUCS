#!/usr/bin/env bash

set -u

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PREFLIGHT="$ROOT/deployment/bin/ducs-preflight"

failures=0

assert_blocked() {
    local label="$1"

    if "$PREFLIGHT" >/tmp/ducs-preflight-test.out 2>&1; then
        echo "FAIL  $label — expected BLOCKED"
        failures=$((failures + 1))
        return
    fi

    if grep -q "GOLD-001: BLOCKED" /tmp/ducs-preflight-test.out &&
       grep -q "STATUS: HOLD" /tmp/ducs-preflight-test.out; then
        echo "PASS  $label"
    else
        echo "FAIL  $label — unexpected output"
        failures=$((failures + 1))
    fi
}

cleanup() {
    rm -rf "$ROOT/runtime_input"
    rm -f /tmp/ducs-preflight-test.out
}

trap cleanup EXIT

echo "DUCS PREFLIGHT NEGATIVE TESTS"
echo "============================="

assert_blocked "No runtime inputs"

mkdir -p "$ROOT/runtime_input"

for object in \
    DCP-001 \
    EVD-001 \
    EVD-002 \
    EVD-003 \
    ONR-FGRAI-SPATIAL-001
do
    cat > "$ROOT/runtime_input/$object.json" <<EOF
{
  "object_id": "$object",
  "admission": "INCOMPLETE"
}
EOF
done

assert_blocked "All inputs INCOMPLETE"

cat > "$ROOT/runtime_input/DCP-001.json" <<EOF
{
  "object_id": "DCP-001",
  "admission": "ADMITTED"
}
EOF

assert_blocked "Four incomplete inputs remain"

if [ "$failures" -eq 0 ]; then
    echo
    echo "RESULT: PASS"
    exit 0
fi

echo
echo "RESULT: FAIL ($failures failures)"
exit 1
