# Automatic persistence for lab sessions

This project now includes a persistence workflow that snapshots the lab configuration automatically after deploys.

## Usage

Run the following after any topology change:

```bash
bash scripts/persist/auto-persist.sh
```

Snapshots are stored in:

```bash
.spohtshots/
```

To restore the latest snapshot:

```bash
bash scripts/persist/restore.sh
```
