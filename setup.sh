#!/bin/bash

# Twaps Setup Script
# This script clones and builds all three components of the Twaps ecosystem.

echo "🚀 Setting up the Twaps ecosystem..."

# Create a directory for all components
TWAPS_DIR="$HOME/Twaps"
mkdir -p "$TWAPS_DIR"
cd "$TWAPS_DIR"

echo "📁 Created directory: $TWAPS_DIR"

# Clone the repositories
echo "🔄 Cloning repositories..."

echo "Cloning TwapsCLI..."
git clone https://github.com/Noah-Moller/TwapsCLI.git
echo "✅ TwapsCLI cloned successfully."

echo "Cloning TwapsServer..."
git clone https://github.com/Noah-Moller/TwapsServer.git
echo "✅ TwapsServer cloned successfully."

echo "Cloning TwapsClient..."
git clone https://github.com/Noah-Moller/TwapsClient.git
echo "✅ TwapsClient cloned successfully."

# Build TwapsCLI
echo "🔨 Building TwapsCLI..."
cd "$TWAPS_DIR/TwapsCLI"
swift build
echo "✅ TwapsCLI built successfully."

# Build TwapsServer
echo "🔨 Building TwapsServer..."
cd "$TWAPS_DIR/TwapsServer"
swift build
echo "✅ TwapsServer built successfully."

echo "🎉 Twaps ecosystem setup complete!"
echo ""
echo "To start using Twaps:"
echo "1. Run the TwapsServer: cd $TWAPS_DIR/TwapsServer && swift run"
echo "2. Open the TwapsClient in Xcode: open $TWAPS_DIR/TwapsClient/TwapsClient.xcodeproj"
echo "3. Create and push a Twap: cd $TWAPS_DIR/TwapsCLI && swift run TwapsCLI push /path/to/your/twap.swift --url your-twap.twap"
echo ""
echo "For more information, visit: https://github.com/Noah-Moller/Twaps" 