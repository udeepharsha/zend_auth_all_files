<?php

namespace CsnUser\Model;

use Zend\Db\TableGateway\TableGateway;

use CsnUser\Model\User; // this is the model
// with injection of the Zend Table Data Gateway
// This is My Repository of statments. Here I can use different SQL statements
// Like Repo in Doctrine
class UsersTable
{
	protected $tableGateway;
	
	public function __construct(TableGateway $tableGateway)
	{
		$this->tableGateway = $tableGateway;
	}
	
	// I could follow the same interface as TableGateway I can even implement it
	// I like the approach here because as paramaters for the functiosn I have to 
	// send values like for ordinary functions
    public function select()
    {
        $resultSet = $this->tableGateway->select();
        return $resultSet;
    }	

    public function getUser($usr_id)
    {
        $usr_id  = (int) $usr_id;
        $rowset = $this->tableGateway->select(array('usr_id' => $usr_id));
        $user = $rowset->current();
        if (!$user) {
            throw new \Exception("Could not find user $usr_id");
        }
        return $user;
    }	

	public function insert(User $user)
	{
		$this->tableGateway->insert($this->prepareData($user));
	}
	
	public function update (User $user)
	{
		if (!$this->getUser($user->usr_id)) {
			throw new \Exception('Form id does not exist');
		}
		$this->tableGateway->update(
			$this->prepareData($user), 
			array('usr_id' => $user->usr_id)
		);		
	}
	
    public function prepareData(User $user)
    {
		// for Zend\Db\TableGateway\TableGateway we need the data in array not object
        $data = array(
            'usr_name' 				=> $user->usr_name,
            'usr_password'  		=> $user->usr_password,
            'usr_email'  			=> $user->usr_email,
            'usrl_id'  				=> $user->usrl_id,
            'lng_id'  				=> $user->lng_id,
            'usr_active'  			=> $user->usr_active,
            'usr_question'  		=> $user->usr_question,
            'usr_answer'  			=> $user->usr_answer,
            'usr_picture'  			=> $user->usr_picture,
            'usr_password_salt' 	=> $user->usr_password_salt,
            'usr_registration_date' => $user->usr_registration_date,
            'usr_registration_token'=> $user->usr_registration_token,
			'usr_email_confirmed'	=> $user->usr_email_confirmed,
        );
	
		return $data;
    }

    public function delete(User $user)
    {
        $this->tableGateway->delete(array('usr_id' => $user->usr_id));
    }

	// Add more functions here when you need them This is table data gateway
	// Also you can get the adapter and create far more complicated quesries
	// using SQL or statements ir whatever you like.
}