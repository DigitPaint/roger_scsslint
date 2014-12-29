# Roger ScssLinter
roger_scsslinter lints scss using [scss-lint](https://github.com/causes/scss-lint). If present, ```.scss-lint.yml``` will be used as normal.

## Installation
* Add ```gem "roger_scsslinter"``` to your Gemfile

* Add this to your Mockupfile:
```
mockup.test do |t|
  t.use :scsslinter
end
```

* (Optional) put a .scss-linter.yml in your root directory.

## License

This project is released under the [MIT license](LICENSE).