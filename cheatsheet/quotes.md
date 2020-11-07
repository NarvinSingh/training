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

The `\` escapes the `n`, which has no special meaning, resulting in a literal
`n`.

```Shell
$ echo -e hello\nworld
hellonworld
```

The first `\` escapes the second one, resulting in a literal `\`. The -e
option expands the resulting `\n` to a carriage return.

```Shell
$ echo -e hello\\nworld
hello
world
```

Here, the -E option does not expand the resulting `\n` to a carriage return.

```Shell
$ echo -E hello\\nworld
hello\nworld
```

The first `\` escapes the second one, resulting in a literal `\`. The third
`\` escapes the `n`, resulting in a literal `n`. The -e option expands the
resulting `\n`.

```Shell
$ echo -e hello\\\nworld
hello
world
```

Here, the -E option does not expand the resulting `\n` to a carriage return.

```Shell
$ echo -E hello\\\nworld
hello\nworld
```

The first `\` escapes the second one, resulting in a literal `\`. The third
`\` escapes the fourth one, resulting in a second literal `\`. The -e option
expands the resulting `\\n` to a literal `\n`, and not a carriage return.

```Shell
$ echo -e hello\\\\nworld
hello\nworld
```

Here, the -E option does not expand the resulting `\\` to a single `\`.

```Shell
$ echo -e hello\\\\nworld
hello\\nworld
```

### Single Quotes

`''` are the second strongest form of quoting, escaping the meaning of *almost*
any characters they surround.

- `''` don't escape the meaning of `'` so you can't include `'` between `''`.
- `'"'` is a literal `"`
- `'\'` is a literal `\`
- `'\n'` is a literal `\n` which may then be expanded to a carriage return

The `''` escape the meaning of `${var}`, resulting in a literal `${var}`.

```Shell
$ var=world
$ echo -e 'hello${var}'
hello${var}
```

The `''` escape the meaning of the `"`, resulting in a literal `"`.

```Shell
$ echo -e 'hello"world'
hello"world
```

The `''` escape the meaning of the `\`, resulting in a literal `\`. The -e
option expands the resulting `\n` to a carriage return.

```Shell
$ echo -e 'hello\nworld'
hello
world
```

Here, the -E option does not expand the resulting `\n` to a carriage return.

```Shell
$ echo -E 'hello\nworld'
hello\nworld
```

The `''` escape the meaning of both `\`'s resulting in a literal `\\`. The
-e option expands the resulting `\\` to a single `\`.

```Shell
$ echo -e 'hello\\nworld'
hello\nworld
```

Here, the -E option does not expand the resulting `\\` to a single `\`.

```Shell
$ echo -E 'hello\\nworld'
hello\\nworld
```

The `''` escape the meaning of all three `\`'s resulting in a literal
`\\\`. The -e option expands the resulting `\\\n` to a literal `\` and a
carriage return.

```Shell
$ echo -e 'hello\\\nworld'
hello\
world
```

Here, the -E option does not expand the resulting `\\\n` to a literal `\`
and a carriage return.

```Shell
$ echo -E 'hello\\\nworld'
hello\\\nworld
```

The `''` escape the meaning of all four `\`'s resulting in a literal
`\\\\`. The -e option expands the resulting `\\\\n` to a literal `\` and a
literal `\n`.

```Shell
$ echo -e 'hello\\\\nworld'
hello\\nworld
```

Here, the -E option does not expand the resulting `\\\\` to a literal `\\`.

```Shell
$ echo -E 'hello\\\\nworld'
hello\\\\nworld
```

### Double Quotes

`""` are the weakest form of quoting, which expand variables and do command
substitution, but won't expand most other special characters.

- `""` don't escape the meaning of `"` so you can't include `"` between `""`.
- `"'"` is a literal `'`
- `"\"` is a literal `\`
- `"\n"` is a literal `\n` which may then be expanded to a carriage return

The `""` don't escape the meaning of `${var}` and the variable is expanded.

```Shell
$ var=world
$ echo -e "hello${var}"
helloworld
```

The `""` escape the meaning of the `'`, resulting in a literal `'`.

```Shell
$ echo -e "hello'world"
hello'world
```

Double quotes handle backslashes same way as single quotes do, so refer to
those code examples.

### ANSI-C Quoting

See [ANSI-C
Quoting](https://www.gnu.org/software/bash/manual/html_node/ANSI_002dC-Quoting.html#ANSI_002dC-Quoting).

`$''` expands backslash-escaped sequences within the `''` according to the
ANSI C standard. The result is wrapped in `''` as if the `$` were not there.

- `$'\n'` is a carriage return

In both of these examples, the strings contain literal carriage returns, so
whether or not expansion is enabled, there is nothing to expand and carriage
returns are output.

```Shell
$ echo -e $'hello\nworld'
hello
world

$ echo -E $'hello\nworld'
hello
world
```

