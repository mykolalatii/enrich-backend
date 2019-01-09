<?php
namespace App\Test\TestCase\Model\Table;

use App\Model\Table\DapUsersCreditsTable;
use Cake\ORM\TableRegistry;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\DapUsersCreditsTable Test Case
 */
class DapUsersCreditsTableTest extends TestCase
{

    /**
     * Test subject
     *
     * @var \App\Model\Table\DapUsersCreditsTable
     */
    public $DapUsersCredits;

    /**
     * Fixtures
     *
     * @var array
     */
    public $fixtures = [
        'app.dap_users_credits',
        'app.users',
        'app.products',
        'app.resources',
        'app.transactions'
    ];

    /**
     * setUp method
     *
     * @return void
     */
    public function setUp()
    {
        parent::setUp();
        $config = TableRegistry::exists('DapUsersCredits') ? [] : ['className' => 'App\Model\Table\DapUsersCreditsTable'];
        $this->DapUsersCredits = TableRegistry::get('DapUsersCredits', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    public function tearDown()
    {
        unset($this->DapUsersCredits);

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
