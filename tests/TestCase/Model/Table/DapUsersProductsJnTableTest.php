<?php
namespace App\Test\TestCase\Model\Table;

use App\Model\Table\DapUsersProductsJnTable;
use Cake\ORM\TableRegistry;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\DapUsersProductsJnTable Test Case
 */
class DapUsersProductsJnTableTest extends TestCase
{

    /**
     * Test subject
     *
     * @var \App\Model\Table\DapUsersProductsJnTable
     */
    public $DapUsersProductsJn;

    /**
     * Fixtures
     *
     * @var array
     */
    public $fixtures = [
        'app.dap_users_products_jn',
        'app.users',
        'app.products',
        'app.transactions',
        'app.coupons'
    ];

    /**
     * setUp method
     *
     * @return void
     */
    public function setUp()
    {
        parent::setUp();
        $config = TableRegistry::exists('DapUsersProductsJn') ? [] : ['className' => 'App\Model\Table\DapUsersProductsJnTable'];
        $this->DapUsersProductsJn = TableRegistry::get('DapUsersProductsJn', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    public function tearDown()
    {
        unset($this->DapUsersProductsJn);

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
