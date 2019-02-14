package controller

import (
	"github.com/language-operator/pkg/controller/language"
)

func init() {
	// AddToManagerFuncs is a list of functions to create controllers and add them to a manager.
	AddToManagerFuncs = append(AddToManagerFuncs, language.Add)
}
