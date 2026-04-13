# IncidentManagement

[![Rust](https://img.shields.io/badge/Rust-%23dea584?style=flat-square&logo=rust)](#) [![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)](#) [![CI](https://github.com/saagpatel/IncidentManagement/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/saagpatel/IncidentManagement/actions/workflows/ci.yml)

> Quarterly incident review prep used to take hours of manual data gathering. Now it takes one click.

IncidentManagement is a local-first macOS desktop app for tracking IT incidents, running blameless post-mortems, detecting trends with AI, and generating polished DOCX and PDF reports for quarterly and annual leadership reviews. Built with Tauri 2 + React 19 + Rust + SQLite + Ollama AI — zero subscription, zero cloud dependency.

## Features

- **Full Incident Lifecycle** — 5-state directed-graph machine (Active → Acknowledged → Monitoring → Resolved → Post-Mortem) with auto-computed P0–P4 priority from severity × impact matrix
- **Blameless Post-Mortems** — Structured post-mortem templates with Markdown editing for root cause, resolution, lessons learned, and action items
- **AI Trend Detection** — Ollama-powered clustering surfaces recurring failure themes across incident history without sending data off-device
- **One-Click Reports** — Generate DOCX quarterly or annual review reports with embedded charts, executive summaries, and action item roll-ups
- **Service Catalog** — Registry of services with owner, tier (T1–T4), runbook, and dependency graph with cycle detection
- **Full-Text Search** — FTS5 across titles, root causes, resolutions, and notes; bulk operations for status updates and cleanup

## Quick Start

### Prerequisites

- Node.js 20+
- pnpm 9+
- Rust toolchain (stable) + Tauri v2 prerequisites for macOS
- [Ollama](https://ollama.ai) with a pulled model (optional — used for AI trend detection)

### Installation

```bash
git clone https://github.com/saagpatel/IncidentManagement.git
cd IncidentManagement
pnpm install
```

### Run (development)

```bash
pnpm dev
```

### Build (desktop app)

```bash
pnpm tauri build
```

## Tech Stack

| Layer         | Technology                   |
| ------------- | ---------------------------- |
| Desktop shell | Tauri 2 + Rust               |
| Frontend      | React 19 + TypeScript + Vite |
| Styling       | Tailwind CSS                 |
| Storage       | SQLite with FTS5             |
| AI analysis   | Ollama (local LLM)           |
| Reports       | DOCX + PDF generation (Rust) |
| Charts        | Recharts                     |

## Architecture

All incident data lives in a local SQLite database managed by the Rust Tauri backend. The state machine is enforced at the service layer — invalid transitions are rejected before any DB write. Ollama clustering runs asynchronously against stored incidents and writes cluster assignments back to SQLite without blocking the UI. Report generation happens entirely in Rust: chart data is computed server-side and embedded into DOCX/PDF templates via the report generation layer.

## License

MIT
