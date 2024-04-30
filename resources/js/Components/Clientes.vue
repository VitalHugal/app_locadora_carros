<template>
  <div class="container">
      <div class="row justify-content-center">
          <div class="col-md-8">
              <!-- inicio card de busca clientes-->
              <card-component titulo="Busca de clientes">
                  <template v-slot:conteudo>
                      <div class="row">
                          <div class="col-md-6 mb-3">
                              <!-- Componente que instaciamos -->
                              <input-container titulo="ID" id="inputIdCliente" id-help="idHelpCliente"
                                  texto-ajuda="Opcional. Inofrme o ID do Cliente.">
                                  <input type="number" class="form-control" id="inputIdCliente" aria-describedby="idHelpCliente"
                                      placeholder="ID" v-model="busca.id">
                              </input-container>
                              <!-- {{ nomeCliente }} -->
                          </div>
                          <div class="col-md-6 mb-3">
                              <!-- Componente que instaciamos -->
                              <input-container titulo="Nome do Cliente" id="inputNomeCliente" id-help="NomeHelpCliente"
                                  texto-ajuda="Opcional. Inofrme o nome do Cliente.">
                                  <input type="text" class="form-control" id="inputNome" aria-describedby="nomeHelpCliente"
                                      placeholder="Nome do Cliente" v-model="busca.nome">
                              </input-container>
                          </div>
                      </div>
                  </template>

                  <template v-slot:rodape>
                      <button type="submit" class="btn btn-primary btn-sm" @click="pesquisar()">Pesquisar</button>
                  </template>
              </card-component>
              <!-- fim card de busca clientes-->

              <!-- inicio do card listagem de clientes -->
              <card-component titulo="Relação de clientes">
                  <template v-slot:conteudo>
                      <!-- Componente que instaciamos -->
                      <table-component :dados="clientes.data"
                          :visualizar="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalClienteVisualizar' }"
                          :atualizar="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalClienteAtualizar' }"
                          :remover="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalClienteRemover' }"
                          :titulos="{
                              id: { titulo: 'ID', tipo: 'text' },
                              nome: { titulo: 'Nome', tipo: 'text' },
                              created_at: { titulo: 'Data de criação', tipo: 'data' },
                          }"></table-component>
                  </template>
                  <template v-slot:rodape>
                      <div class="col">
                          <div class="col-10">
                              <paginate-component>
                                  <li v-for="l, key in clientes.links" :key="key"
                                      :class="l.active ? 'page-item active' : 'page-item'" @click="paginacao(l)">
                                      <a class="page-link" v-html="l.label"></a>
                                  </li>
                              </paginate-component>
                          </div>
                          <div class="col ">
                              <button type="button" class="btn btn-primary btn-sm " data-bs-toggle="modal"
                                  data-bs-target="#modalCliente">Adicionar</button>
                          </div>
                      </div>
                  </template>
              </card-component>
              <!-- fim do card listagem de clientes -->
          </div>
      </div>

      <!-- inicio do modal de inclusão de clientes -->
      <modal-component id="modalCliente" titulo="Adicionar cliente">

          <template v-slot:alertas>
              <alert-component tipo="success" :detalhes="transacaoDetalhes" titulo="Cadastro realizado com sucesso"
                  v-if="transacaoStatus == 'adicionado'"></alert-component>
              <alert-component tipo="danger" :detalhes="transacaoDetalhes" titulo="Erro ao tentar cadastrar novo cliente"
                  v-if="transacaoStatus == 'erro'"></alert-component>
          </template>

          <template v-slot:conteudo>
              <div class="form-group">
                  <input-container titulo="Nome do cliente" id="novoNomeCliente" id-help="novoNomeHelpCliente"
                      texto-ajuda="Informe o nome do cliente">
                      <input type="text" class="form-control" id="novoNomeCliente" aria-describedby="novoNomeHelpCliente"
                          placeholder="Nome do cliente" v-model="nomeCliente">
                  </input-container>
                  <!-- {{ nomeCliente }} -->
              </div>
          </template>

          <template v-slot:rodape>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
              <button type="button" class="btn btn-primary" @click="salvar()">Salvar</button>
          </template>
      </modal-component>
      <!-- fim do modal de inclusão de cliente -->

      <!-- inicio do modal de visualização de cliente -->
      <modal-component id="modalClienteVisualizar" titulo="Visualizar clientes">
          <template v-slot:alertas>
          </template>
          <template v-slot:conteudo>
              <input-container titulo="ID">
                  <input type="text" class="form-control" :value="$store.state.item.id" disabled>
              </input-container>
              <input-container titulo="Nome da Cliente">
                  <input type="text" class="form-control" :value="$store.state.item.nome" disabled>
              </input-container>
              <input-container titulo="Criação">
                  <input type="text" class="form-control" :value="$store.state.item.created_at" disabled>
              </input-container>
          </template>
          <template v-slot:rodape>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
          </template>
      </modal-component>
      <!-- fim do modal de visualização do cliente -->

      <!-- inicio do modal de remoção do cliente -->
      <modal-component id="modalClienteRemover" titulo="Remover cliente">
          <template v-slot:alertas>
              <alert-component tipo="success" titulo="Transação realizada com sucesso."
                  :detalhes="$store.state.transacao"
                  v-if="$store.state.transacao.status == 'sucesso'">
              </alert-component>
              <alert-component tipo="danger" titulo="Erro na transação." :detalhes="$store.state.transacao"
                  v-if="$store.state.transacao.status == 'erro'">
              </alert-component>
          </template>
          <template v-slot:conteudo v-if="$store.state.transacao.status != 'sucesso'">
              <input-container titulo="ID">
                  <input type="text" class="form-control" :value="$store.state.item.id" disabled>
              </input-container>
              <input-container titulo="Nome do cliente">
                  <input type="text" class="form-control" :value="$store.state.item.nome" disabled>
              </input-container>
          </template>
          <template v-slot:rodape>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
              <button type="button" class="btn btn-danger" @click="remover()"
                  v-if="$store.state.transacao.status != 'sucesso'">Remover</button>
          </template>
      </modal-component>
      <!-- fim do modal de remoção do cliente -->

      <!-- inicio do modal de atualização do cliente -->
      <modal-component id="modalClienteAtualizar" titulo="Atualizar cliente">
          <template v-slot:alertas>
              <alert-component tipo="success" titulo="Transação realizada com sucesso."
                  :detalhes="$store.state.transacao"
                  v-if="$store.state.transacao.status == 'sucesso'">
              </alert-component>
              <alert-component tipo="danger" titulo="Erro na transação." :detalhes="$store.state.transacao"
                  v-if="$store.state.transacao.status == 'erro'">
              </alert-component>
          </template>
          <template v-slot:conteudo v-if="$store.state.transacao.status != 'sucesso'">
              <div class="form-group">
                  <input-container titulo="Nome do cliente" id="atualizarNomeCliente" id-help="atualizarNomeHelpCliente"
                      texto-ajuda="Informe o nome do cliente">
                      <input type="text" class="form-control" id="atualizarNomeCliente" aria-describedby="atualizarNomeHelpCliente"
                          placeholder="Nome do cliente" v-model="$store.state.item.nome">
                  </input-container>
              </div>
          </template>
          <template v-slot:rodape>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
              <button type="button" class="btn btn-primary" @click="atualizar()">Atualizar</button>
          </template>
      </modal-component>
      <!-- fim do modal de atualização do cliente -->
  </div>
</template>

<script>
import axios from 'axios'


export default {
  data() {
      return {
          urlBase: 'http://localhost:8000/api/v1/cliente',
          urlPaginacao: '',
          urlFiltro: '',
          nomeCliente: '',
          transacaoStatus: '',
          transacaoDetalhes: {},
          clientes: { data: [] },
          busca: { id: '', nome: '' },
      }
  },
  methods: {
      atualizar() {

          let formData = new FormData();
          formData.append('_method', 'patch')
          formData.append('nome', this.$store.state.item.nome)

          let url = this.urlBase + '/' + this.$store.state.item.id

          axios.post(url, formData)
              .then(response => {
                  this.$store.state.transacao.status = 'sucesso'
                  this.$store.state.transacao.mensagem = 'Registro de cliente atualizado com sucesso'
                  this.carregarLista()
              })
              .catch(errors => {
                  this.$store.state.transacao.status = 'erro'
                  this.$store.state.transacao.mensagem = errors.response.data.message
                  this.$store.state.transacao.dados = errors.response.data.errors
              })
      },
      remover() {
          let confirmacao = confirm('Tem certeza que deseja remover esse registro?')

          if (!confirmacao) {
              return false;
          }

          let formData = new FormData();
          formData.append('_method', 'delete')

          let url = this.urlBase + '/' + this.$store.state.item.id

          console.log(this.$store.state.transacao)
          axios.post(url, formData )
              .then(response => {
                  this.$store.state.transacao.status = 'sucesso'
                  this.$store.state.transacao.mensagem = response.data.msg
                  this.carregarLista()
              })
              .catch(errors => {
                  this.$store.state.transacao.status = 'erro'
                  this.$store.state.transacao.mensagem = errors.response.data.erro

              })

      },
      pesquisar() {
          //console.log(this.busca)

          let filtro = ''

          for (let chave in this.busca) {

              if (this.busca[chave]) {
                  //console.log(chave, this.busca[chave])
                  if (filtro != '') {
                      filtro += ";"
                  }

                  filtro += chave + ':like:' + this.busca[chave]
              }
          }
          if (filtro != '') {
              this.urlPaginacao = 'page=1'
              this.urlFiltro = '&filtro=' + filtro
          } else {
              this.urlFiltro = ''
          }

          this.carregarLista()
      },
      paginacao(l) {
          if (l.url) {
              //this.urlBase = l.url //ajustando a url de consulta com o parâmetro de página
              this.urlPaginacao = l.url.split('?')[1]
              this.carregarLista() //requisitando novamente os dados para nossa API
          }
      },
      carregarLista() {
          
          let url = this.urlBase + '?' + this.urlPaginacao + this.urlFiltro

          console.log(url)
          axios.get(url)
              .then(response => {
                  this.clientes = response.data
                  //console.log(this.clientes)
              })
              .catch(errors => {
                  console.log(errors)
              })
      },
      
      salvar() {
          console.log(this.nomeCliente)

          let formData = new FormData();
          formData.append('nome', this.nomeCliente)
          
          
          axios.post(this.urlBase, formData)
              .then(response => {
                  this.transacaoStatus = 'adicionado'
                  this.transacaoDetalhes = {
                      mensagem: 'ID do registro: ' + response.data.id
                  }

                  console.log(response)
              })
              .catch(errors => {
                  this.transacaoStatus = 'erro'
                  this.transacaoDetalhes = {
                      mensagem: errors.response.data.message,
                      dados: errors.response.data.errors
                  }
                  //errors.response.data.message
              })
      }
  },
  mounted() {
      this.carregarLista()
  }
}
</script>
