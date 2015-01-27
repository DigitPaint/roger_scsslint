Roger ScssLint
============
Improve the quality of your scss with roger_scsslinter. This plugin for roger lints scss using [scss-lint](https://github.com/causes/scss-lint). If present, ```.scss-lint.yml``` in your project root will be used. You can generate this with ``` $ roger generate scsslint```, this will use the configuration from [our (s)css styleguide](https://github.com/DigitPaint/css). When this file is not present, [scss-lint](https://github.com/causes/scss-lint) will walk the directory tree upwards in search for a ```.scss-lint.yml``` file. As a last resort, [default.yml](https://github.com/causes/scss-lint/blob/master/config/default.yml) is used.

## Installation
* Add ```gem "roger_scsslint"``` to your Gemfile

* Add this to your Mockupfile:
```
mockup.test do |t|
  t.use :scsslint
end
```

* (Recommended) put a .scss-linter.yml in your project's root directory. You can use ```$ roger generate scsslint```, to use [ours](https://github.com/DigitPaint/css).

## Running
Execute ```roger test scsslint```.

## License

This project is released under the [MIT license](LICENSE).