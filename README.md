# Ruam
[![Gem Version](https://badge.fury.io/rb/ruam.svg)](https://badge.fury.io/rb/ruam)
[![Build Status](https://circleci.com/gh/autopp/ruam.svg?style=shield&circle-token=21fbc0adbc3428399a27b0f1334dd52ff22d8fd8)](https://circleci.com/gh/autopp/ruam)

Ruam is a simple command line tool to inspect a byte code of Ruby script.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruam'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruam

## Usage

```
$ cat hello.rb
puts 'hello world'

$ ruam hello.rb
== disasm: #<ISeq:<main>@hello.rb>======================================
0000 trace            1                                               (   1)
0002 putself          
0003 putstring        "hello world"
0005 opt_send_without_block <callinfo!mid:puts, argc:1, FCALL|ARGS_SIMPLE>, <callcache>
0008 leave            
```

If file name is not given, `ruam` read from stdin:

```
$ echo "puts 'hello world'" | ruam
== disasm: #<ISeq:<compiled>@<compiled>>================================
0000 trace            1                                               (   1)
0002 putself          
0003 putstring        "hello world"
0005 opt_send_without_block <callinfo!mid:puts, argc:1, FCALL|ARGS_SIMPLE>, <callcache>
0008 leave            
```

You can enable/disable compile option which are [defined in the VM](https://docs.ruby-lang.org/en/2.4.0/RubyVM/InstructionSequence.html#method-c-compile_option-3D):

```
$ ruam hello.rb --no-trace-instruction
== disasm: #<ISeq:<main>@hello.rb>======================================
0000 putself                                                          (   1)
0001 putstring        "hello world"
0003 opt_send_without_block <callinfo!mid:puts, argc:1, FCALL|ARGS_SIMPLE>, <callcache>
0006 leave            
```

For more info, execute `ruam -h`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruam.


## Lisence

[Apache License 2.0](LICENSE)

## Author

[@AuToPP](https://twitter.com/AuToPP)
