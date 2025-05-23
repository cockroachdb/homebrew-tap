In most cases you want to modify the formula templates in the `release` directory. To regenerate the formulas you can run:
```shell
for f in $(cd Formula && ls -1); do
  product=${f/.rb/}
  version=$(grep 'version "' Formula/$f | cut  -d'"' -f 2)
  echo "Regenereating $product version $version"
  make PRODUCT=$product VERSION=$version
done
```

There are tests available with `brew test ./Formula/cockroach.rb` and a linter with `brew audit --strict --online cockroach`. 
