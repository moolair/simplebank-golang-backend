package gapi

import (
	"fmt"

	db "github.com/moolair/simplebank-golang-backend/db/sqlc"
	"github.com/moolair/simplebank-golang-backend/pb"
	"github.com/moolair/simplebank-golang-backend/token"
	"github.com/moolair/simplebank-golang-backend/util"
	"github.com/moolair/simplebank-golang-backend/worker"
)

// Server serves gRPC requests for our banking service.
type Server struct {
	pb.UnimplementedSimpleBankServer
	config          util.Config
	store           db.Store
	tokenMaker      token.Maker
	taskDistributor worker.TaskDistributor
}

// NewServer creates a new gRPC server.
func NewServer(config util.Config, store db.Store, taskDistributor worker.TaskDistributor) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenSymmetricKey)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}

	server := &Server{
		config:          config,
		store:           store,
		tokenMaker:      tokenMaker,
		taskDistributor: taskDistributor,
	}

	return server, nil
}
