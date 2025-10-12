west build -d build/klor_left -p -b nice_nano_v2 -- -DSHIELD=klor_left -DZMK_CONFIG="$ZMK_CONFIG" -s "$ZMK_LOCAL/app"

west build -s zmk/app -d "/tmp/tmp.H1SbF9Smnc" -b "nice_nano_v2"  -- -DZMK_CONFIG=/__w/zmk-config-klor/zmk-config-klor/config -DSHIELD="klor_left" 


ZMK_CONFIG="${ZMK_CONFIG:-/Users/naiqixiao/Documents/GitHub/zmk-config-klor/config}"
ZMK_LOCAL="${ZMK_LOCAL:-/Users/naiqixiao/Documents/GitHub/zmk}"

SHIELD="${SHIELD:-klor}"
# Validate shield exists under ZMK_CONFIG/boards/shields
SHIELD_DIR="$ZMK_CONFIG/boards/shields/$SHIELD"


# Validate shield exists under ZMK_CONFIG/boards/shields
SHIELD_DIR="$ZMK_CONFIG/boards/shields/$SHIELD"
if [ ! -d "$SHIELD_DIR" ]; then
  cat >&2 <<EOF
Invalid SHIELD: $SHIELD
Expected a directory at: $SHIELD_DIR

Available shields under $ZMK_CONFIG/boards/shields:
EOF
  ls -1 "$ZMK_CONFIG/boards/shields" 2>/dev/null || true
  exit 1
fi

# Build output directory (unique per shield)
BUILD_DIR="build/${SHIELD}"
mkdir -p "$BUILD_DIR"

west build -d "$BUILD_DIR" -b nice_nano_v2 -- -DSHIELD="$SHIELD" -DZMK_CONFIG="$ZMK_CONFIG" -s "$ZMK_LOCAL/app"

west build -s /Users/naiqixiao/Documents/GitHub/zmk/app -d /Users/naiqixiao/Documents/GitHub/zmk/build -b "nice_nano_v2"  -- -DZMK_CONFIG=/Users/naiqixiao/Documents/GitHub/zmk-config-klor/config -DSHIELD=/Users/naiqixiao/Documents/GitHub/zmk-config-klor/config/boards/shields/klor/klor_left 

