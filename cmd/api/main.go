package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	"github.com/Noirchevalier/gerenciamento-de-pedidos/sql/schema"
	_ "github.com/lib/pq"
	"github.com/pressly/goose/v3"
)

func main() {
	connStr := "postgres://user:password123@localhost:5432/orders_db?sslmode=disable"

	db, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
		return
	}
	defer db.Close()

	err = db.Ping()
	if err != nil {
		log.Printf("Aviso: Banco de dados ainda não está pronto: %v", err)
	} else {
		fmt.Println("Conexão com o PostGres estabelecida com sucesso!")
	}

	runMigrations(db)

	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("Servidor online"))
	})

	port := ":8080"
	fmt.Printf("Servidor rodando na porta %s...\n", port)

	if err := http.ListenAndServe(port, nil); err != nil {
		log.Fatalf("Erro ao iniciar servidor: %v", err)
		return
	}
}

func runMigrations(db *sql.DB) {
	goose.SetBaseFS(schema.FS)

	if err := goose.SetDialect("postgres"); err != nil {
		log.Fatal(err)
	}

	if err := goose.Up(db, "."); err != nil {
		log.Fatal(err)
	}
}
