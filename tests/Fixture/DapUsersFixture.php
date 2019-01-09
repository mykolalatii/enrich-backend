<?php
namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * DapUsersFixture
 *
 */
class DapUsersFixture extends TestFixture
{

    /**
     * Fields
     *
     * @var array
     */
    // @codingStandardsIgnoreStart
    public $fields = [
        'id' => ['type' => 'integer', 'length' => 11, 'unsigned' => false, 'null' => false, 'default' => null, 'comment' => '', 'autoIncrement' => true, 'precision' => null],
        'first_name' => ['type' => 'string', 'length' => 20, 'null' => false, 'default' => '', 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'last_name' => ['type' => 'string', 'length' => 20, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'user_name' => ['type' => 'string', 'length' => 50, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'email' => ['type' => 'string', 'length' => 60, 'null' => false, 'default' => '', 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'password' => ['type' => 'string', 'length' => 100, 'null' => false, 'default' => '', 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'address1' => ['type' => 'string', 'length' => 100, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'address2' => ['type' => 'string', 'length' => 40, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'city' => ['type' => 'string', 'length' => 20, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'state' => ['type' => 'string', 'length' => 20, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'zip' => ['type' => 'string', 'length' => 10, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'country' => ['type' => 'string', 'length' => 30, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'phone' => ['type' => 'string', 'length' => 20, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'fax' => ['type' => 'string', 'length' => 20, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'company' => ['type' => 'string', 'length' => 40, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'title' => ['type' => 'string', 'length' => 20, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'is_affiliate' => ['type' => 'string', 'fixed' => true, 'length' => 1, 'null' => false, 'default' => 'Y', 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null],
        'last_login_date' => ['type' => 'date', 'length' => null, 'null' => true, 'default' => '0000-00-00', 'comment' => '', 'precision' => null],
        'activation_key' => ['type' => 'string', 'length' => 20, 'null' => true, 'default' => '0', 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'status' => ['type' => 'string', 'fixed' => true, 'length' => 1, 'null' => false, 'default' => 'U', 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null],
        'login_count' => ['type' => 'integer', 'length' => 11, 'unsigned' => false, 'null' => false, 'default' => '0', 'comment' => '', 'precision' => null, 'autoIncrement' => null],
        'ipaddress' => ['type' => 'string', 'length' => 20, 'null' => true, 'default' => '0.0.0.0', 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'account_type' => ['type' => 'string', 'fixed' => true, 'length' => 1, 'null' => false, 'default' => 'U', 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null],
        'signup_date' => ['type' => 'datetime', 'length' => null, 'null' => false, 'default' => '0000-00-00 00:00:00', 'comment' => '', 'precision' => null],
        'paypal_email' => ['type' => 'string', 'length' => 60, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'last_update_date' => ['type' => 'date', 'length' => null, 'null' => false, 'default' => '0000-00-00', 'comment' => '', 'precision' => null],
        'aff_nick' => ['type' => 'string', 'length' => 10, 'null' => true, 'default' => null, 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null, 'fixed' => null],
        'opted_out' => ['type' => 'string', 'fixed' => true, 'length' => 1, 'null' => false, 'default' => 'N', 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null],
        'self_service_status' => ['type' => 'string', 'fixed' => true, 'length' => 1, 'null' => false, 'default' => 'I', 'collate' => 'utf8_general_ci', 'comment' => 'A/I (Active, Inactive)', 'precision' => null],
        'credits_available' => ['type' => 'integer', 'length' => 11, 'unsigned' => false, 'null' => false, 'default' => '0', 'comment' => '', 'precision' => null, 'autoIncrement' => null],
        'exclude_iplogging' => ['type' => 'string', 'fixed' => true, 'length' => 1, 'null' => false, 'default' => 'N', 'collate' => 'utf8_general_ci', 'comment' => '', 'precision' => null],
        '_constraints' => [
            'primary' => ['type' => 'primary', 'columns' => ['id'], 'length' => []],
            'email' => ['type' => 'unique', 'columns' => ['email'], 'length' => []],
            'user_name' => ['type' => 'unique', 'columns' => ['user_name'], 'length' => []],
        ],
        '_options' => [
            'engine' => 'InnoDB',
            'collation' => 'utf8_general_ci'
        ],
    ];
    // @codingStandardsIgnoreEnd

    /**
     * Records
     *
     * @var array
     */
    public $records = [
        [
            'id' => 1,
            'first_name' => 'Lorem ipsum dolor ',
            'last_name' => 'Lorem ipsum dolor ',
            'user_name' => 'Lorem ipsum dolor sit amet',
            'email' => 'Lorem ipsum dolor sit amet',
            'password' => 'Lorem ipsum dolor sit amet',
            'address1' => 'Lorem ipsum dolor sit amet',
            'address2' => 'Lorem ipsum dolor sit amet',
            'city' => 'Lorem ipsum dolor ',
            'state' => 'Lorem ipsum dolor ',
            'zip' => 'Lorem ip',
            'country' => 'Lorem ipsum dolor sit amet',
            'phone' => 'Lorem ipsum dolor ',
            'fax' => 'Lorem ipsum dolor ',
            'company' => 'Lorem ipsum dolor sit amet',
            'title' => 'Lorem ipsum dolor ',
            'is_affiliate' => 'Lorem ipsum dolor sit ame',
            'last_login_date' => '2017-01-14',
            'activation_key' => 'Lorem ipsum dolor ',
            'status' => 'Lorem ipsum dolor sit ame',
            'login_count' => 1,
            'ipaddress' => 'Lorem ipsum dolor ',
            'account_type' => 'Lorem ipsum dolor sit ame',
            'signup_date' => '2017-01-14 19:05:08',
            'paypal_email' => 'Lorem ipsum dolor sit amet',
            'last_update_date' => '2017-01-14',
            'aff_nick' => 'Lorem ip',
            'opted_out' => 'Lorem ipsum dolor sit ame',
            'self_service_status' => 'Lorem ipsum dolor sit ame',
            'credits_available' => 1,
            'exclude_iplogging' => 'Lorem ipsum dolor sit ame'
        ],
    ];
}
