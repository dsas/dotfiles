#!/bin/bash
# Speaks "done" with fun session identity
# See: https://mrmurphy.dev/claude-code-hooks-for-fun-and-focus/
#
# NOTE: This script is macOS-specific. It uses:
#   - `say` command (macOS text-to-speech; Linux would need `espeak` or similar)
#   - `md5` command (macOS/BSD; Linux uses `md5sum` instead)

# Check for required dependencies
if ! command -v jq &> /dev/null; then
  echo "Error: jq is not installed" >&2
  exit 1
fi

if ! command -v say &> /dev/null; then
  echo "Error: say is not available" >&2
  exit 1
fi

EMOJIS=(
  "🍌:Banana"
  "🦊:Fox"
  "🌮:Taco"
  "🚀:Rocket"
  "🦄:Unicorn"
  "🐙:Octopus"
  "🍕:Pizza"
  "🌈:Rainbow"
  "🦋:Butterfly"
  "🍩:Donut"
  "🐳:Whale"
  "🌻:Sunflower"
  "🎸:Guitar"
  "🦖:T-Rex"
  "🍪:Cookie"
  "🐨:Koala"
  "🌶️:Pepper"
  "🦜:Parrot"
  "🧁:Cupcake"
  "🐸:Frog"
  "🍋:Lemon"
  "🦉:Owl"
  "🎪:Circus"
  "🐝:Bee"
  "🍄:Mushroom"
)

INPUT=$(cat)
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "default"')

# MD5 hash the session ID for uniform randomness
HASH=$(echo -n "$SESSION_ID" | md5 -q)

# Map the hash to an emoji index
HASH_NUM=$((16#${HASH:0:8}))
INDEX=$((HASH_NUM % ${#EMOJIS[@]}))

EMOJI="${EMOJIS[$INDEX]%%:*}"
NAME="${EMOJIS[$INDEX]##*:}"

# Update terminal title (write directly to tty to bypass stdout capture)
echo -ne "\033]0;${EMOJI} ${NAME} - Done!\007" > /dev/tty 2>/dev/null

say "${NAME} is done"
