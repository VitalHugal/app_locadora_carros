<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <!-- inicio card de busca locacao-->
                <card-component titulo="Busca de locações">
                    <template v-slot:conteudo>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <!-- Componente que instaciamos -->
                                <input-container titulo="ID" id="inputIdLocacao" id-help="idHelpLocacao"
                                    texto-ajuda="Opcional. Informe o ID da Locação.">
                                    <input type="number" class="form-control" id="inputIdLocacao"
                                        aria-describedby="idHelpLocacao" placeholder="ID" v-model="busca.id">
                                </input-container>
                            </div>
                            <div class="col-md-6 mb-3">
                            </div>
                        </div>
                    </template>
                    <template v-slot:rodape>
                        <button type="submit" class="btn btn-primary btn-sm" @click="pesquisar()">Pesquisar</button>
                    </template>
                </card-component>
                <!-- fim card de busca locacao-->

                <!-- inicio do card listagem de locacao -->
                <card-component titulo="Relação de locações">
                    <template v-slot:conteudo>
                        <!-- Componente que instaciamos -->
                        <table-component :dados="locacoes.data"
                            :visualizar="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalLocacaoVisualizar' }"
                            :atualizar="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalLocacaoAtualizar' }"
                            :remover="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalLocacaoRemover' }"
                            :titulos="{
                                id: { titulo: 'ID', tipo: 'text' },
                                cliente_id: { titulo: 'Cliente ID', tipo: 'text' },
                                carro_id: { titulo: 'Carro ID', tipo: 'text' },
                                data_inicio_periodo: { titulo: 'Data inicio da Locação', tipo: 'text' },
                                data_final_previsto_periodo: { titulo: 'Data final da Locação (Previsão)', tipo: 'text' },
                                data_final_realizado_periodo: { titulo: 'Data final da Locação (Final)', tipo: 'text' },
                                valor_diaria: { titulo: 'Valor diária', tipo: 'text' },
                                km_inicial: { titulo: 'KM inicial', tipo: 'text' },
                                km_final: { titulo: 'KM final', tipo: 'text' },
                                created_at: { titulo: 'Data de criação', tipo: 'data' },
                            }"></table-component>
                    </template>
                    <template v-slot:rodape>
                        <div class="col">
                            <div class="col-10">
                                <paginate-component>
                                    <li v-for="l, key in locacoes.links" :key="key"
                                        :class="l.active ? 'page-item active' : 'page-item'" @click="paginacao(l)">
                                        <a class="page-link" v-html="l.label"></a>
                                    </li>
                                </paginate-component>
                            </div>
                            <div class="col ">
                                <button type="button" class="btn btn-primary btn-sm " data-bs-toggle="modal"
                                    data-bs-target="#modalLocacao">Adicionar</button>
                            </div>
                        </div>
                    </template>
                </card-component>
                <!-- fim do card listagem de locacao -->

            </div>
        </div>

        <!-- inicio do modal de inclusão de locacao -->
        <modal-component id="modalLocacao" titulo="Adicionar locação">

            <template v-slot:alertas>
                <alert-component tipo="success" :detalhes="transacaoDetalhes" titulo="Cadastro realizado com sucesso"
                    v-if="transacaoStatus == 'adicionado'"></alert-component>
                <alert-component tipo="danger" :detalhes="transacaoDetalhes" titulo="Erro ao tentar cadastrar locação"
                    v-if="transacaoStatus == 'erro'"></alert-component>
            </template>

            <template v-slot:conteudo>
                <div class="form-group">
                    <input-container titulo="Cliente ID" id="novoClienteIDLocacao" id-help="novoClienteIDHelpLocacao"
                        texto-ajuda="Informe o id do cliente.">
                        <input type="text" class="form-control" id="novoClienteIDLocacao"
                            aria-describedby="novoClienteIDHelpLocacao" placeholder="Cliente ID" v-model="cliente_id">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Carro ID" id="novoCarroIDLocacao" id-help="novoCarroIDHelpLocacao"
                        texto-ajuda="Informe o id do carro.">
                        <input type="text" class="form-control" id="novoCarroIDLocacao"
                            aria-describedby="novoCarroIDHelpLocacao" placeholder="Carro ID" v-model="carro_id">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Data inicio da Locação" id="novoDataInicioLocacao"
                        id-help="novoDataInicioHelpLocacao" texto-ajuda="Informe a data de inicio da locação.">
                        <input type="text" class="form-control" id="novoDataInicioLocacao"
                            aria-describedby="novoDataInicioHelpLocacao" placeholder="Data inicio da Locação"
                            v-model="data_inicio_periodo">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Data final da Locação (Previsão)" id="novoDataFinalPrevisaoLocacao"
                        id-help="novoDataFinalPrevisaoHelpLocacao" texto-ajuda="Informe a data final da locação.">
                        <input type="text" class="form-control" id="novoDataFinalPrevisaoLocacao"
                            aria-describedby="novoDataFinalPrevisaoHelpLocacao" placeholder="Data final da Locação"
                            v-model="data_final_previsto_periodo">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Data final da Locação (Final)" id="novoDataFinalFinalLocacao"
                        id-help="novoDataFinalFinalHelpLocacao" texto-ajuda="Informe a data final da locação.">
                        <input type="text" class="form-control" id="novoDataFinalFinalLocacao"
                            aria-describedby="novoDataFinalFinalHelpLocacao" placeholder="Data final da Locação"
                            v-model="data_final_realizado_periodo">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Valor diária" id="novoValorDiariaLocacao"
                        id-help="novoValorDiariaHelpLocacao" texto-ajuda="Valor diária">
                        <input type="text" class="form-control" id="novoValorDiariaLocacao"
                            aria-describedby="novoValorDiariaHelpLocacao" placeholder="Valor diária"
                            v-model="valor_diaria">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="KM Inicial" id="novoKMInicialLocacao" id-help="novoKMInicialHelpLocacao"
                        texto-ajuda="KM Inicial">
                        <input type="text" class="form-control" id="novoKMInicialLocacao"
                            aria-describedby="novoKMInicialHelpLocacao" placeholder="KM Inicial" v-model="km_inicial">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="KM Final" id="novoKMFinalLocacao"
                        id-help="novoKMFinalHelpLocacao" texto-ajuda="KM Inicial">
                        <input type="text" class="form-control" id="novoKMFinalLocacao"
                            aria-describedby="novoKMFinalHelpLocacao" placeholder="KM Inicial"
                            v-model="km_final">
                    </input-container>
                </div>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary" @click="salvar()">Salvar</button>
            </template>
        </modal-component>
        <!-- fim do modal de inclusão de locacao -->

        <!-- inicio do modal de visualização de locacao -->
        <modal-component id="modalLocacaoVisualizar" titulo="Visualizar locações">
            <template v-slot:alertas>
            </template>
            <template v-slot:conteudo>
                <input-container titulo="ID">
                    <input type="text" class="form-control" :value="$store.state.item.id" disabled>
                </input-container>
                <input-container titulo="Cliente ID">
                    <input type="text" class="form-control" :value="$store.state.item.cliente_id" disabled>
                </input-container>
                <input-container titulo="Carro ID">
                    <input type="text" class="form-control" :value="$store.state.item.carro_id" disabled>
                </input-container>
                <input-container titulo="Data Inicio Locação">
                    <input type="text" class="form-control" :value="$store.state.item.data_inicio_periodo" disabled>
                </input-container>
                <input-container titulo="Data final da Locação (Previsão)">
                    <input type="text" class="form-control" :value="$store.state.item.data_final_previsto_periodo"
                        disabled>
                </input-container>
                <input-container titulo="Data final da Locação (Final)">
                    <input type="text" class="form-control" :value="$store.state.item.data_final_realizado_periodo"
                        disabled>
                </input-container>
                <input-container titulo="Valor Diária">
                    <input type="text" class="form-control" :value="$store.state.item.valor_diaria" disabled>
                </input-container>
                <input-container titulo="KM Inicio">
                    <input type="text" class="form-control" :value="$store.state.item.km_inicial" disabled>
                </input-container>
                <input-container titulo="KM Final">
                    <input type="text" class="form-control" :value="$store.state.item.km_final" disabled>
                </input-container>
                <input-container titulo="Data de criação">
                    <input type="text" class="form-control" :value="$store.state.item.created_at" disabled>
                </input-container>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
            </template>
        </modal-component>
        <!-- fim do modal de visualização de locacao -->

        <!-- inicio do modal de remoção de locacao -->
        <modal-component id="modalLocacaoRemover" titulo="Remover Locação">
            <template v-slot:alertas>
                <alert-component tipo="success" titulo="Transação realizada com sucesso."
                    :detalhes="$store.state.transacao" v-if="$store.state.transacao.status == 'sucesso'">
                </alert-component>
                <alert-component tipo="danger" titulo="Erro na transação." :detalhes="$store.state.transacao"
                    v-if="$store.state.transacao.status == 'erro'">
                </alert-component>
            </template>
            <template v-slot:conteudo v-if="$store.state.transacao.status != 'sucesso'">
                <input-container titulo="ID">
                    <input type="text" class="form-control" :value="$store.state.item.id" disabled>
                </input-container>
                <input-container titulo="Cliente ID">
                    <input type="text" class="form-control" :value="$store.state.item.cliente_id" cliente_id>
                </input-container>
                <input-container titulo="Carro ID">
                    <input type="text" class="form-control" :value="$store.state.item.carro_id" carro_id>
                </input-container>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-danger" @click="remover()"
                    v-if="$store.state.transacao.status != 'sucesso'">Remover</button>
            </template>
        </modal-component>
        <!-- fim do modal de remoção de clientes -->

        <!-- inicio do modal de atualização de clientes -->
        <modal-component id="modalLocacaoAtualizar" titulo="Atualizar locação">
            <template v-slot:alertas>
                <alert-component tipo="success" titulo="Transação realizada com sucesso."
                    :detalhes="$store.state.transacao" v-if="$store.state.transacao.status == 'sucesso'">
                </alert-component>
                <alert-component tipo="danger" titulo="Erro na transação." :detalhes="$store.state.transacao"
                    v-if="$store.state.transacao.status == 'erro'">
                </alert-component>
            </template>
            <template v-slot:conteudo v-if="$store.state.transacao.status != 'sucesso'">
                <div class="form-group">
                    <input-container titulo="Cliente ID" id="atualizarClienteIDLocacao"
                        id-help="atualizarClienteIDHelpLocacao" texto-ajuda="Informe o id do cliente.">
                        <input type="text" class="form-control" id="atualizarClienteIDLocacao"
                            aria-describedby="atualizarClienteIDHelpLocacao" placeholder="Cliente ID"
                            v-model="cliente_id">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Carro ID" id="atualizarCarroIDLocacao"
                        id-help="atualizarCarroIDHelpLocacao" texto-ajuda="Informe o id do carro.">
                        <input type="text" class="form-control" id="atualizarCarroIDLocacao"
                            aria-describedby="atualizarCarroIDHelpLocacao" placeholder="Carro ID" v-model="carro_id">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Data inicio da Locação" id="atualizarDataInicioLocacao"
                        id-help="atualizarDataInicioHelpLocacao" texto-ajuda="Informe a data de inicio da locação.">
                        <input type="text" class="form-control" id="atualizarDataInicioLocacao"
                            aria-describedby="atualizarDataInicioHelpLocacao" placeholder="Data inicio da Locação"
                            v-model="data_inicio_periodo">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Data final da Locação (Previsão)" id="atualizarDataFinalLocacao"
                        id-help="atualizarDataFinalHelpLocacao" texto-ajuda="Informe a data final da locação.">
                        <input type="text" class="form-control" id="atualizarDataFinalLocacao"
                            aria-describedby="atualizarDataFinalHelpLocacao" placeholder="Data final da Locação"
                            v-model="data_final_previsto_periodo">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Data final da Locação (Final)" id="atualizarDataFinalFinalLocacao"
                        id-help="atualizarDataFinalFinalHelpLocacao" texto-ajuda="Informe a data final da locação.">
                        <input type="text" class="form-control" id="atualizarDataFinalFinalLocacao"
                            aria-describedby="atualizarDataFinalFinalHelpLocacao" placeholder="Data final da Locação"
                            v-model="data_final_realizado_periodo">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Valor diária" id="atualizarValorDiariaLocacao"
                        id-help="atualizarValorDiariaHelpLocacao" texto-ajuda="Valor diária">
                        <input type="text" class="form-control" id="atualizarValorDiariaLocacao"
                            aria-describedby="atualizarValorDiariaHelpLocacao" placeholder="Valor diária"
                            v-model="valor_diaria">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="KM Inicial" id="atualizarKMInicialLocacao"
                        id-help="atualizarKMInicialHelpLocacao" texto-ajuda="KM Inicial">
                        <input type="text" class="form-control" id="atualizarKMInicialLocacao"
                            aria-describedby="atualizarKMInicialHelpLocacao" placeholder="KM Inicial"
                            v-model="km_inicial">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="KM Final" id="atualizarKMFinalLocacao"
                        id-help="atualizarKMFinalHelpLocacao" texto-ajuda="KM Inicial">
                        <input type="text" class="form-control" id="atualizarKMFinalLocacao"
                            aria-describedby="atualizarKMFinalHelpLocacao" placeholder="KM Inicial"
                            v-model="km_inicial">
                    </input-container>
                </div>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary" @click="atualizar()">Atualizar</button>
            </template>
        </modal-component>
        <!-- fim do modal de atualização de locacao -->


    </div>
</template>

<script>
import axios from 'axios'


export default {
    data() {
        return {
            urlBase: 'http://localhost:8000/api/v1/locacao',
            urlPaginacao: '',
            urlFiltro: '',
            cliente_id: '',
            carro_id: '',
            data_inicio_periodo: '',
            data_final_previsto_periodo: '',
            data_final_realizado_periodo: '',
            valor_diaria: '',
            km_inicial: '',
            km_final: '',
            transacaoStatus: '',
            transacaoDetalhes: {},
            locacoes: { data: [] },
            busca: { id: '', cliente_id: '' },
        }
    },
    methods: {
        atualizar() {

            let formData = new FormData();
            formData.append('_method', 'patch')
            formData.append('cliente_id', this.$store.state.item.cliente_id)
            formData.append('carro_id', this.$store.state.item.carro_id)
            formData.append('data_inicio_periodo', this.$store.state.item.data_inicio_periodo)
            formData.append('data_final_previsto_periodo', this.$store.state.item.data_final_previsto_periodo)
            formData.append('valor_diaria', this.$store.state.item.valor_diaria)
            formData.append('km_inicial', this.$store.state.item.km_inicial)
            formData.append('km_final', this.$store.state.item.km_final)

            let url = this.urlBase + '/' + this.$store.state.item.id

            axios.post(url, formData)
                .then(response => {
                    this.$store.state.transacao.status = 'sucesso'
                    this.$store.state.transacao.mensagem = 'Registro de locação atualizado com sucesso'
                    //atualizarImagem.value = ''
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
            axios.post(url, formData)
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

            let filtro = ''

            for (let chave in this.busca) {

                if (this.busca[chave]) {
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
                    this.locacoes = response.data;
                    // console.log(response.data); // Verifique os dados recebidos no console
                })
                .catch(errors => {
                    console.log(errors);
                });
        },
        salvar() {
            console.log(this.cliente_id, this.carro_id, this.data_inicio_periodo, this.data_final_previsto_periodo, this.data_final_realizado_periodo, this.valor_diaria, this.km_inicial, this.km_final)

            let formData = new FormData();
            formData.append('cliente_id', this.cliente_id)
            formData.append('carro_id', this.carro_id)
            formData.append('data_inicio_periodo', this.data_inicio_periodo)
            formData.append('data_final_previsto_periodo', this.data_final_previsto_periodo)
            formData.append('data_final_realizado_periodo', this.data_final_realizado_periodo)
            formData.append('valor_diaria', this.valor_diaria)
            formData.append('km_inicial', this.km_inicial)
            formData.append('km_final', this.km_final)

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
