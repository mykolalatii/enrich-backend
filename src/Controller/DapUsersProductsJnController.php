<?php
namespace App\Controller;

use App\Controller\AppController;

/**
 * DapUsersProductsJn Controller
 *
 * @property \App\Model\Table\DapUsersProductsJnTable $DapUsersProductsJn
 */
class DapUsersProductsJnController extends AppController
{

    /**
     * Index method
     *
     * @return \Cake\Network\Response|null
     */
    public function index()
    {
//        $this->paginate = [
//            'contain' => ['Users', 'Products', 'Transactions', 'Coupons']
//        ];
        $dapUsersProductsJn = $this->paginate($this->DapUsersProductsJn);

        $this->set(compact('dapUsersProductsJn'));
        $this->set('_serialize', ['dapUsersProductsJn']);
    }

    /**
     * View method
     *
     * @param string|null $id Dap Users Products Jn id.
     * @return \Cake\Network\Response|null
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $dapUsersProductsJn = $this->DapUsersProductsJn->get($id, [
            'contain' => ['Users', 'Products', 'Transactions', 'Coupons']
        ]);

        $this->set('dapUsersProductsJn', $dapUsersProductsJn);
        $this->set('_serialize', ['dapUsersProductsJn']);
    }

    /**
     * Add method
     *
     * @return \Cake\Network\Response|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $dapUsersProductsJn = $this->DapUsersProductsJn->newEntity();
        if ($this->request->is('post')) {
            $dapUsersProductsJn = $this->DapUsersProductsJn->patchEntity($dapUsersProductsJn, $this->request->data);
            if ($this->DapUsersProductsJn->save($dapUsersProductsJn)) {
                $this->Flash->success(__('The dap users products jn has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The dap users products jn could not be saved. Please, try again.'));
            }
        }
        $users = $this->DapUsersProductsJn->Users->find('list', ['limit' => 200]);
        $products = $this->DapUsersProductsJn->Products->find('list', ['limit' => 200]);
        $transactions = $this->DapUsersProductsJn->Transactions->find('list', ['limit' => 200]);
        $coupons = $this->DapUsersProductsJn->Coupons->find('list', ['limit' => 200]);
        $this->set(compact('dapUsersProductsJn', 'users', 'products', 'transactions', 'coupons'));
        $this->set('_serialize', ['dapUsersProductsJn']);
    }

    /**
     * Edit method
     *
     * @param string|null $id Dap Users Products Jn id.
     * @return \Cake\Network\Response|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $dapUsersProductsJn = $this->DapUsersProductsJn->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $dapUsersProductsJn = $this->DapUsersProductsJn->patchEntity($dapUsersProductsJn, $this->request->data);
            if ($this->DapUsersProductsJn->save($dapUsersProductsJn)) {
                $this->Flash->success(__('The dap users products jn has been saved.'));

                return $this->redirect(['action' => 'index']);
            } else {
                $this->Flash->error(__('The dap users products jn could not be saved. Please, try again.'));
            }
        }
        $users = $this->DapUsersProductsJn->Users->find('list', ['limit' => 200]);
        $products = $this->DapUsersProductsJn->Products->find('list', ['limit' => 200]);
        $transactions = $this->DapUsersProductsJn->Transactions->find('list', ['limit' => 200]);
        $coupons = $this->DapUsersProductsJn->Coupons->find('list', ['limit' => 200]);
        $this->set(compact('dapUsersProductsJn', 'users', 'products', 'transactions', 'coupons'));
        $this->set('_serialize', ['dapUsersProductsJn']);
    }

    /**
     * Delete method
     *
     * @param string|null $id Dap Users Products Jn id.
     * @return \Cake\Network\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $dapUsersProductsJn = $this->DapUsersProductsJn->get($id);
        if ($this->DapUsersProductsJn->delete($dapUsersProductsJn)) {
            $this->Flash->success(__('The dap users products jn has been deleted.'));
        } else {
            $this->Flash->error(__('The dap users products jn could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
