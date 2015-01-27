# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.authors = ['Hans Krutzer']
  s.email = ['info@digitpaint.nl', 'hans@digitpaint.nl']
  s.name = 'roger_scsslint'
  s.version = '0.0.1'
  s.homepage = 'https://github.com/hkrutzer/roger_scsslint'

  s.summary = 'Lint SCSS files within Roger'
  s.description = <<-EOF
    Lint SCSS files within Roger, using scss-lint.
    Will use .scss-lint.yml.
  EOF
  s.licenses = ['MIT']

  s.date = Time.now.strftime('%Y-%m-%d')

  s.files = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'roger', '~> 0.13', '>= 0.13.0'
  s.add_dependency 'scss-lint', '~> 0.31', '>= 0.31.0'
end
