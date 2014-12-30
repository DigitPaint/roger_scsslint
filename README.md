# Roger ScssLinter
roger_scsslinter lints scss using [scss-lint](https://github.com/causes/scss-lint). ```.scss-lint.yml``` will be used if present, [scss-lint's default configuration](https://github.com/causes/scss-lint/blob/v0.31.0/config/default.yml) will be used if not. When this files is not present scss-lint will walk the directory tree upwards in search for a ```.scss-lint.yml``` file. As a last resort, default.yml is used.

## Installation
* Add ```gem "roger_scsslinter"``` to your Gemfile

* Add this to your Mockupfile:
```
mockup.test do |t|
  t.use :scsslinter
end
```

* (Optional) put a .scss-linter.yml in your project's root directory.

## Running
Execute ```roger test scsslinter```.

## License

This project is released under the [MIT license](LICENSE).