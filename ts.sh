#!/bin/bash

# Step 1: Install global dependencies
npm install -g typescript ts-node nodemon

# Step 2: Initialize a new Node.js project
npm init -y

# Step 3: Install development dependencies
npm install --save-dev tsconfig-paths

# Step 4: Create necessary directories
mkdir -p src dist

# Step 5: Create tsconfig.json
echo '{
  "compilerOptions": {
    "target": "ESNext",
    "module": "CommonJS",
    "outDir": "./dist",
    "rootDir": "./src",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "baseUrl": "./src",
    "paths": {
      "*": ["*"]
    }
  }
}' > tsconfig.json

# Step 6: Create sample index.ts
echo 'console.log("hi");' > src/index.ts

# Step 7: Create nodemon.json for nodemon configuration
echo '{
  "watch": ["src"],
  "ext": "ts",
  "exec": "ts-node -r tsconfig-paths/register ./src/index.ts"
}' > nodemon.json

# Step 8: Create npm script
echo '{
  "scripts": {
    "dev": "nodemon"
  }
}' > package.json
