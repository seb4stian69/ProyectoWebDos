<?php

    class DatabaseConnection {

        private mysqli $connection;

        public function __construct(){
            $this->connection = mysqli_connect("127.0.0.1", "root", "root", "ChanoClothes", 3306);
        }
    
        public function getConnection():mysqli{
            return $this->connection;
        }
    
        public function closeConnection(){
            $this->connection->close();
        }

    }

?>