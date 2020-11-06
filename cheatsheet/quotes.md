Quotes Cheatsheet
=================

Print Functions
---------------

See `man bash-builtins`.

### printf

- `printf FORMAT` will expand backslash-escaped sequences within `FORMAT`
- `printf '%s' ARGUMENT` will not expand backslash-escaped sequences in
  `ARGUMENT`
- `printf '%b' ARGUMENT` will expand backslash-escaped sequences in `ARGUMENT`
- `printf '%q' ARGUMENT` will escape backslash-escaped sequences in `ARGUMENT`

### echo

- `echo -e ARGUMENT` will expand backslash-escaped sequences in `ARGUMENT`
- `echo -E ARGUMENT` will not expand backslash-escaped sequences in `ARGUMENT`

Quotes
------

See [UNIX Shell Quotes](https://grymoire.com/unix/Quote.html).

### Backslash

`\` is the strongest form of quoting, escaping any special meaning any
character that follows it may have, resulting in the combination being the
literal character that follows the `\`.

- `\\` is a literal `\`
- `\$` is a literal `$`
- `\n` is a literal `n`
- `\\n` is a literal `\n` which may then be expanded to a carriage return

```Shell
$ echo -e hello\$world
hello$world

$ echo -e hello\\world
hello\world

$ echo -e hello\nworld
hellonworld

$ echo -e hello\\nworld
hello
world

$ echo -E hello\\nworld
hello\nworld
```

### Single Quotes

`''` are the second strongest form of quoting, escaping the meaning of *almost*
any characters they surround.

- `''` don't escape the meaning of `'` so you can't include `'` between `''`.
- `'"'` is a literal `"`
- `'\'` is a literal `\`
- `'\\'` is also a literal `\` (TODO: find out why)
- `'\n'` is a literal `\n` which may then be expanded to a carriage return

```Shell
$ echo -e 'hello$world'
hello$world

$ echo -e 'hello"world'
hello"world

$ echo -e 'hello\world'
hello\world

$ echo -e 'hello\\world' # TODO: find out why this doesn't print hello\\world
hello\world

$ echo -e 'hello\nworld'
hello
world

$ echo -E 'hello\nworld'
hello\nworld
```

### Double Quotes

`""` are the weakest form of quoting, which expand variables and do command
substitution, but won't expand most other special characters.

- `""` don't escape the meaning of `"` so you can't include `"` between `""`.
- `"'"` is a literal `'`
- `"\"` is a literal `\`
- `"\\"` is also a literal `\` (TODO: find out why)
- `"\n"` is a literal `\n` which may then be expanded to a carriage return

```Shell
$ var=world; echo -e "hello${var}"
helloworld

$ echo -e "hello'world"
hello'world

$ echo -e "hello\world"
hello\world

$ echo -e "hello\\world" # TODO: find out why this doesn't print hello\\world
hello\world

$ echo -e "hello\nworld"
hello
world

$ echo -E "hello\nworld"
hello\nworld
```

### ANSI-C Quoting

See [ANSI-C
Quoting](https://www.gnu.org/software/bash/manual/html_node/ANSI_002dC-Quoting.html#ANSI_002dC-Quoting).

`$''` expands backslash-escaped sequences within the `''` according to the
ANSI C standard. The result is wrapped in `''` as if the `$` were not there.

- `$'\n'` is a carriage return

```Shell
$ echo -e $'hello\nworld'
hello
world

$ echo -E $'hello\nworld'
hello
world
```

