#!/bin/bash
echo "post start script executing"

echo "git update-index --skip-worktree .vscode/mcp.json"
git update-index --skip-worktree .vscode/mcp.json

echo "post start script executed"
