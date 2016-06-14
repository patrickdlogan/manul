:lib github.com/kovetskiy/manul-test-foo
:lib github.com/kovetskiy/manul-test-bar

:project "main.go" <<GO
package main

import "github.com/kovetskiy/manul-test-foo"
import "github.com/kovetskiy/manul-test-bar"

func main() {
    foo.Foo()
    bar.Bar()
}
GO

tests:ensure :manul -I
tests:assert-no-diff stdout <<VENDORS
added 2 submodules
VENDORS

tests:assert-stderr "adding submodule for github.com/kovetskiy/manul-test-bar"
tests:assert-stderr "adding submodule for github.com/kovetskiy/manul-test-foo"
