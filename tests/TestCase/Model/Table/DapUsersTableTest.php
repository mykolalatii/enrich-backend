<?php
namespace App\Test\TestCase\Model\Table;

use App\Model\Table\DapUsersTable;
use Cake\ORM\TableRegistry;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\DapUsersTable Test Case
 */
class DapUsersTableTest extends TestCase
{

    /**
     * Test subject
     *
     * @var \App\Model\Table\DapUsersTable
     */
    public $DapUsers;

    /**
     * Fixtures
     *
     * @var array
     */
    public $fixtures = [
        'app.dap_users'
    ];

    /**
     * setUp method
     *
     * @return void
     */
    public function setUp()
    {
        parent::setUp();
        $config = TableRegistry::exists('DapUsers') ? [] : ['className' => 'App\Model\Table\DapUsersTable'];
        $this->DapUsers = TableRegistry::get('DapUsers', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    public function tearDown()
    {
        unset($this->DapUsers);

        parent::tearDown();
    }

    /**
     * Test initialize method
     *
     * @return void
     */
    public function testInitialize()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test validationDefault method
     *
     * @return void
     */
    public function testValidationDefault()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test buildRules method
     *
     * @return void
     */
    public function testBuildRules()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
