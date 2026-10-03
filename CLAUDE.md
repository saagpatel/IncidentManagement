# IncidentMgmt

Incident management desktop app with CI-enforced bundle budget.

## Stack
Tauri 2 + React + TypeScript + Vite

## Key Commands
- `pnpm dev:lean` — full Tauri dev with temporary build/cache directories
- `pnpm tauri dev` — full Tauri dev
- `pnpm bundle:check` — verify bundle budget against existing `dist/assets` (run `pnpm build` first)
- `pnpm test:bundle` — build frontend and verify bundle budget
- `pnpm build` — production frontend build

## Architecture
- `src/` — React frontend
- `src-tauri/` — Rust backend (Tauri 2)

## Rules
- CI enforces bundle budget — run `pnpm test:bundle` after adding heavy deps
- Check bundle impact with `pnpm perf:bundle` after rebuilding when adding dependencies

<!-- portfolio-context:start -->
# Portfolio Context

## What This Project Is

Incident management desktop app built on Tauri 2 + React + TypeScript + Vite. CI-enforced bundle budget. Local-first, with a local Rust backend.

## Current State

Active development. Tauri 2 scaffold operational with React frontend and Rust backend. Bundle budget CI enforcement configured.

## Stack

- **Desktop shell**: Tauri 2 (Rust + WebView)
- **Frontend**: React + TypeScript + Vite
- **Build**: pnpm
- **Bundle gate**: automated budget check

## How To Run

```
pnpm install
pnpm dev:lean
```

Full Tauri: `pnpm tauri dev`. Build and bundle check: `pnpm test:bundle`. Production frontend: `pnpm build`; desktop: `pnpm tauri build`.

## Known Risks

- CI enforces bundle budget — adding heavy dependencies without checking impact will fail CI
- Tauri 2 patterns differ from v1; consult migration guide before porting old code
- Bundle size tests (`pnpm test:bundle`) must pass before merging

## Next Recommended Move

Identify the next feature phase. Run `pnpm test:bundle` after any dependency changes.

<!-- portfolio-context:end -->
