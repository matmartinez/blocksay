# blocksay

Small Swift CLI that renders input text as blocky ASCII art, like `cowsay` but with blocks and no cows.

### Install (Homebrew)

```sh
brew tap matmartinez/homebrew-tools
brew install blocksay
```

### Usage

```sh
$ blocksay hello

▗▖ ▗▖ ▗▄▄▄▖ ▗▖    ▗▖     ▗▄▖  
▐▌ ▐▌ ▐▌    ▐▌    ▐▌    ▐▌ ▐▌ 
▐▛▀▜▌ ▐▛▀▀▘ ▐▌    ▐▌    ▐▌ ▐▌ 
▐▌ ▐▌ ▐▙▄▄▖ ▐▙▄▄▖ ▐▙▄▄▖ ▝▚▄▞▘ 

```

## Development

Local commands for building, running, and testing the CLI.

### Build

```sh
swift build
```


### Run

```sh
swift run blocksay "hello"
```

_Note_: only `a-z` characters are transformed; other characters are skipped.

### Test

```sh
swift test
```
