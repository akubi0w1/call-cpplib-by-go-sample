package main

// #cgo LDFLAGS: -L. -lTestLibrary
// double Add(double a, double b);
import "C"

import (
	"log"
)

func main() {
	num1 := C.Add(1.5, 2.0)
	log.Printf("num: %+v", num1)
}
