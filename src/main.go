package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.GET("/health-check", getHealthCheck)
	router.GET("/", getMain)
	router.Run("localhost:8080")
}
func getHealthCheck(c *gin.Context) {

	c.IndentedJSON(http.StatusOK, gin.H{"message": "OK"})
}

func getMain(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, gin.H{"message": "Welcome"})
}
