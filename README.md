# tap

Personal Homebrew tap for apps, CLIs, and GUI tools I'm building.

## Usage

```sh
brew tap sdkks/tap
```

Then install any formula:

```sh
brew install sdkks/<formula>
```

## Contents

| Type | Description |
|------|-------------|
| Formulae | CLI tools and libraries (`Formula/`) |
| Casks | GUI apps (`Casks/`) |

## Development

Formulae are standard Ruby `.rb` files. To audit or test locally:

```sh
brew audit --new Formula/<name>.rb
brew test Formula/<name>.rb
```
