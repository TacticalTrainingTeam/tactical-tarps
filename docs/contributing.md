# Contributing

## Setting up the development environment

1. Clone the repository from GitHub.
2. Install [HEMTT](https://hemtt.dev/):

    ```cmd
    winget install hemtt
    ```

3. Build the mod with `hemtt build`, or validate it without building via `hemtt check`.

Feel free to add yourself to the list of [Authors](https://github.com/TacticalTrainingTeam/tactical-tarps/blob/main/authors.txt) in your PR.

## Coding guidelines

This mod follows the same [coding guidelines as the ACE3 mod](https://ace3.acemod.org/wiki/development/coding-guidelines) — naming conventions, function headers, bracket/spacing style, and the general avoidance of scheduled space (`spawn`/`execVM`) and magic numbers.

## Validating changes

Before opening a PR, run:

```cmd
hemtt check
python tools/stringtable_validator.py
python tools/config_style_checker.py
```

These mirror the checks run in CI (`.github/workflows/check.yml` and `validate.yml`).
