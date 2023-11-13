<?php

include_once '../Common/Database.config.php';

class Database extends DatabaseConnection{
  
    public function select($query = "" , $params = []){

        try {

            $stmt = $this->executeStatement( $query , $params );
            $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            $stmt->close();

            return $result;

        }catch(UnexpectedValueException $e) {throw new UnexpectedValueException($e->getMessage());}
        
        return false;

    }

    public function selectNoParams($query = ""){

        try {

            $stmt = $this->getConnection()->prepare( $query );

            if ($stmt === false) {throw new UnexpectedValueException("Unable to do prepared statement: ".$query);}
            $stmt->execute();

            return $stmt->get_result()->fetch_all(MYSQLI_ASSOC);


        }catch(UnexpectedValueException $e) {throw new UnexpectedValueException($e->getMessage());}
        
        return false;

    }
 
    public function executeStatement($query = "", $params = []) {

        try {

            $stmt = $this->getConnection()->prepare( $query );

            if ($stmt === false) {throw new UnexpectedValueException("Unable to do prepared statement: ".$query);}
            if ($params) {$stmt->execute($params[0]);}

            return $stmt;

        } catch (UnexpectedValueException $e) {throw new UnexpectedValueException($e->getMessage());}

    }

}

?>