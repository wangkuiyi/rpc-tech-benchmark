package main

import (
	"testing"

	"github.com/golang/protobuf/proto"
	"github.com/tensorflow/tensorflow/tensorflow/go/core/example"
)

var (
	img = make([]float32, 28*28)
	lbl = make([]int64, 10)
)

func BenchmarkSerialize(b *testing.B) {
	for i := 0; i < b.N; i++ {
		test := &example.Example{
			Features: &example.Features{
				Feature: map[string]*example.Feature{
					"image": &example.Feature{
						Kind: &example.Feature_FloatList{
							FloatList: &example.FloatList{
								Value: img}}},
					"label": &example.Feature{
						Kind: &example.Feature_Int64List{
							Int64List: &example.Int64List{
								Value: lbl}}}}}}
		_, e := proto.Marshal(test)
		if e != nil {
			b.Fatal(e)
		}
	}
}
