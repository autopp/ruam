# Ruam

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruam.


## Lisence

[Apache License 2.0](LICENSE)

## Author

[@AuToPP](https://twitter.com/AuToPP)
