[![Build Status](https://travis-ci.org/damsonn/toy_robot.svg?branch=master)](https://travis-ci.org/damsonn/toy_robot) [![Coverage Status](https://coveralls.io/repos/github/damsonn/toy_robot/badge.svg?branch=master)](https://coveralls.io/github/damsonn/toy_robot?branch=master)
```
  ______               ____        __          __
 /_  __/___  __  __   / __ \____  / /_  ____  / /_
  / / / __ \/ / / /  / /_/ / __ \/ __ \/ __ \/ __/
 / / / /_/ / /_/ /  / _, _/ /_/ / /_/ / /_/ / /_
/_/  \____/\__, /  /_/ |_|\____/_.___/\____/\__/
          /____/
```

## Usage

Please read [RULES](RULES) for instructions

install the dependencies
```
bundle install
```

Run the robot in interactive mode
```
bin/toy_robot
```

Run the robot using a file as input
```
bin/toy_robot -f spec/examples/a.txt
```

Print the help
```
bin/toy_robot --help
```

## Development

to make sure everything is correct, use the *validate* task.
It runs the spec, code coverage and code quality checks.

```
rake validate
```

to run the spec alone
```
rspec
```

to run the code quality checks alone
```
rubocop
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
