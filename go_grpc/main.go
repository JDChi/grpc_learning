package go_grpc

import (
	pb "go_grpc/protos/ecommerce"
	"google.golang.org/grpc"
	"log"
	"net"
)

type server struct {
	productMap map[string]*pb.Product
}

func main() {
	lis, err := net.Listen("127.0.0.1", ":334")
	if err != nil {
		log.Fatalf("%v", err)
	}
	s := grpc.NewServer()

}
