<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <!-- inicio card de busca carro -->
                <card-component titulo="Busca de carros">
                    <template v-slot:conteudo>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <!-- Componente que instaciamos -->
                                <input-container titulo="ID" id="inputIdCarro" id-help="idHelpCarro"
                                    texto-ajuda="Opcional. Inofrme o ID do carro.">
                                    <input type="number" class="form-control" id="inputIdCarro"
                                        aria-describedby="idHelpCarro" placeholder="ID" v-model="busca.id">
                                </input-container>
                            </div>
                            <div class="col-md-6 mb-3">
                                <!-- Componente que instaciamos -->
                                <input-container titulo="Placa do carro" id="inputPlacaCarro" id-help="placaHelpCarro"
                                    texto-ajuda="Opcional. Inofrme a placa do carro.">
                                    <input type="text" class="form-control" id="inputPlacaCarro"
                                        aria-describedby="placaHelpCarro" placeholder="Placa do carro"
                                        v-model="busca.placa">
                                </input-container>
                            </div>
                        </div>
                    </template>

                    <template v-slot:rodape>
                        <button type="submit" class="btn btn-primary btn-sm" @click="pesquisar()">Pesquisar</button>
                    </template>
                </card-component>
                <!-- fim card de busca -->

                <!-- inicio do card listagem de carro -->
                <card-component titulo="Relação de carro">
                    <template v-slot:conteudo>
                        <!-- Componente que instaciamos -->
                        <table-component :dados="carros.data"
                            :visualizar="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalCarroVisualizar' }"
                            :atualizar="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalCarroAtualizar' }"
                            :remover="{ visivel: true, dataToggle: 'modal', dataTarget: '#modalCarroRemover' }"
                            :titulos="{
                                id: { titulo: 'ID', tipo: 'text' },
                                modelo_id: { titulo: 'Modelo ID', tipo: 'text' },
                                placa: { titulo: 'Placa', tipo: 'text' },
                                disponivel: { titulo: 'Disponível', tipo: 'text' },
                                km: { titulo: 'KM Rodados', tipo: 'text' },
                                created_at: { titulo: 'Data de criação', tipo: 'data' },
                            }"></table-component>
                    </template>
                    <template v-slot:rodape>
                        <div class="col">
                            <div class="col-10">
                                <paginate-component>
                                    <li v-for="l, key in carros.links" :key="key"
                                        :class="l.active ? 'page-item active' : 'page-item'" @click="paginacao(l)">
                                        <a class="page-link" v-html="l.label"></a>
                                    </li>
                                </paginate-component>
                            </div>
                            <div class="col ">
                                <button type="button" class="btn btn-primary btn-sm " data-bs-toggle="modal"
                                    data-bs-target="#modalCarro">Adicionar</button>
                            </div>
                        </div>
                    </template>
                </card-component>
                <!-- fim do card listagem de Carro -->
            </div>
        </div>

        <!-- inicio do modal de inclusão de Carro -->
        <modal-component id="modalCarro" titulo="Adicionar carro">
            <template v-slot:alertas>
                <alert-component tipo="success" :detalhes="transacaoDetalhes" titulo="Cadastro realizado com sucesso"
                    v-if="transacaoStatus == 'adicionado'"></alert-component>
                <alert-component tipo="danger" :detalhes="transacaoDetalhes" titulo="Erro ao tentar cadastrar a marca"
                    v-if="transacaoStatus == 'erro'"></alert-component>
            </template>

            <template v-slot:conteudo>
                <div class="form-group">
                    <input-container titulo="Modelo ID" id="novoModeloIDCarro" id-help="novoModeloIDHelpCarro"
                        texto-ajuda="Informe o id do modelo.">
                        <input type="text" class="form-control" id="novoModeloIDCarro"
                            aria-describedby="novoModeloIDHelpCarro" placeholder="Modelo ID" v-model="modelo_id">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Placa" id="novoPlacaCarro" id-help="novoPlacaHelpCarro"
                        texto-ajuda="Informe a placa do carro.">
                        <input type="text" class="form-control" id="novoPlacaCarro"
                            aria-describedby="novoPlacaHelpCarro" placeholder="Placa" v-model="placa">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Disponível" id="novoDisponivelCarro" id-help="novoDisponivelHelpCarro"
                        texto-ajuda="Informe a disponibilidade do carro.">
                        <input type="text" class="form-control" id="novoDisponivelCarro"
                            aria-describedby="novoDisponivelHelpCarro" placeholder="Disponível" v-model="disponivel">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="KM Rodados" id="novoKMCarro" id-help="novoKMHelpCarro"
                        texto-ajuda="Informe quantos KM rodados o carro possui.">
                        <input type="text" class="form-control" id="novoKMCarro" aria-describedby="novoKMHelpCarro"
                            placeholder="Lugares" v-model="km">
                    </input-container>
                </div>
            </template>

            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary" @click="salvar()">Salvar</button>
            </template>
        </modal-component>
        <!-- fim do modal de inclusão de Carro -->

        <!-- inicio do modal de visualização de carro -->
        <modal-component id="modalCarroVisualizar" titulo="Visualizar modelo">
            <template v-slot:alertas>
            </template>
            <template v-slot:conteudo>
                <input-container titulo="ID">
                    <input type="text" class="form-control" :value="$store.state.item.id" disabled>
                </input-container>
                <input-container titulo="Modelo ID">
                    <input type="text" class="form-control" :value="$store.state.item.modelo_id" disabled>
                </input-container>
                <input-container titulo="Placa">
                    <input type="text" class="form-control" :value="$store.state.item.placa" disabled>
                </input-container>
                <input-container titulo="Disponivel">
                    <input type="text" class="form-control" :value="$store.state.item.disponivel" disabled>
                </input-container>
                <input-container titulo="KM Rodados">
                    <input type="text" class="form-control" :value="$store.state.item.km" disabled>
                </input-container>
                <input-container titulo="Data de criação">
                    <input type="text" class="form-control" :value="$store.state.item.created_at" disabled>
                </input-container>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
            </template>
        </modal-component>
        <!-- fim do modal de visualização de carro -->

        <!-- inicio do modal de remoção de carro -->
        <modal-component id="modalCarroRemover" titulo="Remover carro">
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
                <input-container titulo="Modelo ID">
                    <input type="text" class="form-control" :value="$store.state.item.modelo_id" disabled>
                </input-container>
                <input-container titulo="Placa">
                    <input type="text" class="form-control" :value="$store.state.item.placa" disabled>
                </input-container>
                <input-container titulo="Disponível">
                    <input type="text" class="form-control" :value="$store.state.item.disponivel" disabled>
                </input-container>
                <input-container titulo="KM Rodados">
                    <input type="text" class="form-control" :value="$store.state.item.km" disabled>
                </input-container>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-danger" @click="remover()"
                    v-if="$store.state.transacao.status != 'sucesso'">Remover</button>
            </template>
        </modal-component>
        <!-- fim do modal de remoção de carro -->

        <!-- inicio do modal de atualização de carro -->
        <modal-component id="modalCarroAtualizar" titulo="Atualizar carro">
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
                    <input-container titulo="Modelo ID" id="atualizarModeloIDCarro" id-help="atualizarModeloIDHelpCarro"
                        texto-ajuda="Informe o id do modelo.">
                        <input type="text" class="form-control" id="atualizarModeloIDCarro"
                            aria-describedby="atualizarModeloIDHelpCarro" placeholder="Modelo ID" v-model="$store.state.item.modelo_id">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Placa" id="atualizarPlacaCarro" id-help="atualizarPlacaHelpCarro"
                        texto-ajuda="Informe a placa do carro.">
                        <input type="text" class="form-control" id="atualizarPlacaCarro"
                            aria-describedby="atualizarPlacaHelpCarro" placeholder="Placa" v-model="$store.state.item.placa">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="Disponível" id="atualizarDisponivelCarro"
                        id-help="atualizarDisponivelHelpCarro" texto-ajuda="Informe a disponibilidade do carro.">
                        <input type="text" class="form-control" id="atualizarDisponivelCarro"
                            aria-describedby="atualizarDisponivelHelpCarro" placeholder="Disponível"
                            v-model="$store.state.item.disponivel">
                    </input-container>
                </div>
                <div class="form-group">
                    <input-container titulo="KM Rodados" id="atualizarKMCarro" id-help="atualizarKMHelpCarro"
                        texto-ajuda="Informe quantos KM rodados o carro possui.">
                        <input type="text" class="form-control" id="atualizarKMCarro"
                            aria-describedby="atualizarKMHelpCarro" placeholder="KM Rodados" v-model="$store.state.item.km">
                    </input-container>
                </div>
            </template>
            <template v-slot:rodape>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary" @click="atualizar()">Atualizar</button>
            </template>
        </modal-component>
        <!-- fim do modal de atualização de carro -->


    </div>
</template>

<script>
import axios from 'axios'


export default {
    data() {
        return {
            urlBase: 'http://localhost:8000/api/v1/carro',
            urlPaginacao: '',
            urlFiltro: '',
            modelo_id: '',
            placa: '',
            disponivel: '',
            km: '',
            transacaoStatus: '',
            transacaoDetalhes: {},
            carros: { data: [] },
            busca: { id: '', placa: '' },
        }
    },
    methods: {
        atualizar() {

            let formData = new FormData();
            formData.append('_method', 'patch')
            formData.append('modelo_id', this.$store.state.item.modelo_id)
            formData.append('placa', this.$store.state.item.placa)
            formData.append('disponivel', this.$store.state.item.disponivel)
            formData.append('km', this.$store.state.item.km)


            let url = this.urlBase + '/' + this.$store.state.item.id

            axios.post(url, formData)
                .then(response => {
                    this.$store.state.transacao.status = 'sucesso'
                    this.$store.state.transacao.mensagem = 'Registro do cliente atualizado com sucesso'
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
                    this.carros = response.data
                    
                })
                .catch(errors => {
                    console.log(errors)
                })
        },
        salvar() {
            console.log(this.modelo_id, this.placa, this.disponivel, this.km)

            let formData = new FormData();

            formData.append('modelo_id', this.modelo_id)
            formData.append('placa', this.placa)
            formData.append('disponivel', this.disponivel)
            formData.append('km', this.km)


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
